from __future__ import annotations

import asyncio
import concurrent.futures
import inspect
import sys
import threading
import types
import warnings
import weakref
from dataclasses import dataclass

from cffi import FFI

from .config import IOTA_ABI_VERSION, RuntimeConfig, validate_runtime_compatibility
from .dependencies import load_dependencies
from .diagnostics import package_diagnostics
from .native import load_library, read_declarations, resolve_library_paths


def create_runtime(config: RuntimeConfig) -> dict[str, object]:
    ffi = FFI()
    _PACKAGE_DIR = config.package_dir
    _NATIVE_DIR_CANDIDATES = list(config.native_dir_candidates)

    validate_runtime_compatibility(config)
    _DEPENDENCY_REPORTS = load_dependencies(config.dependencies)

    ffi.cdef(read_declarations(_PACKAGE_DIR, config.declaration_files))

    _NATIVE_LIBRARIES = resolve_library_paths(config.module_name, _NATIVE_DIR_CANDIDATES, config.build_hint)
    _LIBRARY_PATHS = {name: library.path for name, library in _NATIVE_LIBRARIES.items()}

    runtime_lib = load_library(ffi, _NATIVE_LIBRARIES["FishyJoesIotaRuntime"])
    module_lib = load_library(ffi, _NATIVE_LIBRARIES[config.module_name])
    iota_lib = load_library(ffi, _NATIVE_LIBRARIES[f"{config.module_name}-iota"])

    _handle_lock = threading.RLock()
    _handles: dict[int, object] = {}
    _handle_refcounts: dict[int, int] = {}
    _callbacks: list[object] = []
    _external_type_setups: set[str] = set()
    _value_types: dict[str, type] = {}
    _external_value_types: set[str] = set()
    _protocol_requirements: dict[str, tuple[tuple[str, ...], tuple[str, ...]]] = {}
    _descriptor_cache: dict[tuple, object] = {}
    _async_context = threading.local()
    _pending_promises: set[object] = set()
    _is_shutdown = False


    @dataclass(frozen=True)
    class SwiftRange:
        lower_bound: int
        upper_bound: int


    @dataclass(frozen=True)
    class SwiftClosedRange:
        lower_bound: int
        upper_bound: int


    @dataclass(frozen=True)
    class ResultSuccess:
        value: object

        def get_or_none(self):
            return self.value

        def exception_or_none(self):
            return None


    @dataclass(frozen=True)
    class ResultFailure:
        error: object

        def get_or_none(self):
            return None

        def exception_or_none(self):
            return self.error


    @dataclass(frozen=True)
    class Field:
        name: str
        descriptor: TypeDescriptor
        mutable: bool = False


    @dataclass(frozen=True)
    class EnumCase:
        name: str
        case_type: type
        fields: list[Field]


    @dataclass(frozen=True)
    class ProtocolField:
        name: str
        descriptor: TypeDescriptor


    @dataclass(frozen=True)
    class ProtocolMethod:
        name: str
        parameters: list[TypeDescriptor]
        return_type: TypeDescriptor


    class _IotaValue:
        def __init__(self, type_name: str):
            self.type_name = type_name


    class _SwiftReferenceValue:
        def __init__(self, type_name: str, ptr):
            self.type_name = type_name
            self.ptr = ptr


    class StaticProperty:
        def __init__(self, getter):
            self._getter = getter

        def __get__(self, instance, owner):
            return self._getter()


    def warn_deprecated(message: str, *, stacklevel: int = 3) -> None:
        warnings.warn(message, DeprecationWarning, stacklevel=stacklevel)


    def deprecated_getter(getter, message: str):
        warn_deprecated(message, stacklevel=4)
        return getter()


    def _address(ptr) -> int:
        return int(ffi.cast("uintptr_t", ptr))


    def _retain_handle(ptr):
        address = _address(ptr)
        with _handle_lock:
            if address not in _handles:
                _handles[address] = ptr
            _handle_refcounts[address] = _handle_refcounts.get(address, 0) + 1
        return ptr


    def _new_handle(value):
        return _retain_handle(ffi.new_handle(value))


    def _new_iota_value_ref(type_name: str):
        return _new_handle(_IotaValue(type_name))


    def _new_swift_reference_ref(type_name: str, ptr):
        return _new_handle(_SwiftReferenceValue(type_name, ptr))


    def _utf16_null_terminated(value: str):
        data = value.encode("utf-16-le")
        code_units = [int.from_bytes(data[index : index + 2], "little") for index in range(0, len(data), 2)]
        code_units.append(0)
        return ffi.new("uint16_t[]", code_units)


    def _bool_value(value) -> bool:
        if type(value) is not bool:
            raise ValueError(f"Expected Bool value, got {value!r}")
        return value


    def _int32_value(value) -> int:
        if type(value) is not int or value < -(2**31) or value > 2**31 - 1:
            raise ValueError(f"Expected Int32 value in range -2147483648...2147483647, got {value!r}")
        return value


    def _int_value(value) -> int:
        if type(value) is not int or value < -sys.maxsize - 1 or value > sys.maxsize:
            raise ValueError(f"Expected Int value in range {-sys.maxsize - 1}...{sys.maxsize}, got {value!r}")
        return value


    def _double_value(value) -> float:
        if type(value) not in (float, int):
            raise ValueError(f"Expected Double value, got {value!r}")
        return float(value)


    def _float_value(value) -> float:
        if type(value) not in (float, int):
            raise ValueError(f"Expected Float value, got {value!r}")
        return float(value)


    def _uint8_value(value) -> int:
        if type(value) is not int or value < 0 or value > 255:
            raise ValueError(f"Expected UInt8 value in range 0...255, got {value!r}")
        return value


    def _int8_value(value) -> int:
        if type(value) is not int or value < -(2**7) or value > 2**7 - 1:
            raise ValueError(f"Expected Int8 value in range -128...127, got {value!r}")
        return value


    def _int16_value(value) -> int:
        if type(value) is not int or value < -(2**15) or value > 2**15 - 1:
            raise ValueError(f"Expected Int16 value in range -32768...32767, got {value!r}")
        return value


    def _int64_value(value) -> int:
        if type(value) is not int or value < -(2**63) or value > 2**63 - 1:
            raise ValueError(
                f"Expected Int64 value in range {-(2**63)}...{2**63 - 1}, got {value!r}"
            )
        return value


    def _uint_value(value) -> int:
        # UInt is pointer-width (uintptr_t); mirror _int_value's use of sys.maxsize.
        if type(value) is not int or value < 0 or value > 2 * sys.maxsize + 1:
            raise ValueError(f"Expected UInt value in range 0...{2 * sys.maxsize + 1}, got {value!r}")
        return value


    def _uint16_value(value) -> int:
        if type(value) is not int or value < 0 or value > 2**16 - 1:
            raise ValueError(f"Expected UInt16 value in range 0...65535, got {value!r}")
        return value


    def _uint32_value(value) -> int:
        if type(value) is not int or value < 0 or value > 2**32 - 1:
            raise ValueError(f"Expected UInt32 value in range 0...{2**32 - 1}, got {value!r}")
        return value


    def _uint64_value(value) -> int:
        if type(value) is not int or value < 0 or value > 2**64 - 1:
            raise ValueError(f"Expected UInt64 value in range 0...{2**64 - 1}, got {value!r}")
        return value


    class TypeDescriptor:
        swift_name: str | None = None
        c_type: str = "foreignObject"

        def ensure_setup(self):
            return None

        def to_python(self, value):
            return value

        def to_iota(self, value):
            return _new_handle(self.to_python(value))

        def peek_iota(self, ref):
            if ref == ffi.NULL:
                raise RuntimeError(f"Expected {self}, got null Iota reference")
            return self.to_python(ffi.from_handle(ref))

        def consume_iota(self, ref):
            try:
                return self.peek_iota(ref)
            finally:
                if ref != ffi.NULL:
                    _delete_ref(ref)


    class Primitive(TypeDescriptor):
        def __init__(self, name: str, validator):
            self.name = name
            self.validator = validator

        def __repr__(self):
            return self.name

        def to_python(self, value):
            return self.validator(value)


    class Void(TypeDescriptor):
        swift_name = "FishyJoesCommonRuntime.VoidConverter"
        c_type = "void"

        def __repr__(self):
            return "Void"

        def to_python(self, value):
            if value is not None:
                raise TypeError(f"Expected None for Swift Void, got {type(value).__name__}")
            return None

        def to_iota(self, value):
            self.to_python(value)
            return ffi.NULL

        def peek_iota(self, ref):
            return None

        def consume_iota(self, ref):
            return None


    class Bytes(TypeDescriptor):
        def to_python(self, value):
            return bytes(value)


    class Url(TypeDescriptor):
        def to_python(self, value):
            return str(value)


    class Optional(TypeDescriptor):
        def __new__(cls, wrapped: TypeDescriptor):
            key = (cls, wrapped)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, wrapped: TypeDescriptor):
            if hasattr(self, "wrapped"):
                return
            self.wrapped = wrapped
            self.swift_name = f"OptionalConverter<{wrapped.swift_name}>"

        def ensure_setup(self):
            self.wrapped.ensure_setup()

        def to_iota(self, value):
            if value is None:
                return ffi.NULL
            return self.wrapped.to_iota(value)

        def peek_iota(self, ref):
            if ref == ffi.NULL:
                return None
            return self.wrapped.peek_iota(ref)

        def consume_iota(self, ref):
            if ref == ffi.NULL:
                return None
            return self.wrapped.consume_iota(ref)


    class Array(TypeDescriptor):
        def __new__(cls, swift_name: str, element: TypeDescriptor):
            key = (cls, swift_name, element)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, element: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.element = element
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            self.element.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            check(lambda exn: runtime_lib.FishyJoesCommonRuntime_collection_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _collection_length,
                _collection_values,
                _collection_constructor,
                self._context,
                exn,
            ))
            self._is_setup = True

        def to_python(self, value):
            return [self.element.to_python(item) for item in value]

        def values(self, value):
            return self.to_python(value)

        def construct(self, values):
            return values


    class Set(Array):
        def to_python(self, value):
            return {self.element.to_python(item) for item in value}

        def values(self, value):
            return list(self.to_python(value))

        def construct(self, values):
            return set(values)


    class Dictionary(TypeDescriptor):
        def __new__(cls, swift_name: str, key: TypeDescriptor, value: TypeDescriptor):
            cache_key = (cls, swift_name, key, value)
            if cache_key not in _descriptor_cache:
                _descriptor_cache[cache_key] = super().__new__(cls)
            return _descriptor_cache[cache_key]

        def __init__(self, swift_name: str, key: TypeDescriptor, value: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.key = key
            self.value = value
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            self.key.ensure_setup()
            self.value.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            check(lambda exn: runtime_lib.FishyJoesCommonRuntime_collection_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _collection_length,
                _collection_values,
                _collection_constructor,
                self._context,
                exn,
            ))
            self._is_setup = True

        def to_python(self, value):
            return {
                self.key.to_python(key): self.value.to_python(item)
                for key, item in dict(value).items()
            }

        def values(self, value):
            result = []
            for key, item in self.to_python(value).items():
                result.extend([key, item])
            return result

        def construct(self, values):
            return {
                values[index]: values[index + 1]
                for index in range(0, len(values), 2)
            }

        def descriptor_for_index(self, index: int):
            return self.key if index % 2 == 0 else self.value


    class _RangeDescriptor(TypeDescriptor):
        python_type = SwiftRange

        def __new__(cls, swift_name: str, bound: TypeDescriptor):
            key = (cls, swift_name, bound)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, bound: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.bound = bound
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            self.bound.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            runtime_lib.FishyJoesCommonRuntime_RangeConverter_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _range_lower_bound,
                _range_upper_bound,
                _range_constructor,
                self._context,
            )
            self._is_setup = True

        def to_python(self, value):
            if not isinstance(value, self.python_type):
                raise TypeError(f"Expected {self.python_type.__name__}, got {type(value).__name__}")
            return self.python_type(
                self.bound.to_python(value.lower_bound),
                self.bound.to_python(value.upper_bound),
            )


    class Range(_RangeDescriptor):
        python_type = SwiftRange


    class ClosedRange(_RangeDescriptor):
        python_type = SwiftClosedRange


    class Tuple(TypeDescriptor):
        def __new__(cls, swift_name: str, elements: list[TypeDescriptor]):
            key = (cls, swift_name, tuple(elements))
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, elements: list[TypeDescriptor]):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.elements = elements
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            for element in self.elements:
                element.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            get_methods = [_tuple_get0, _tuple_get1, _tuple_get2, _tuple_get3, _tuple_get4, _tuple_get5]
            runtime_lib.FishyJoesCommonRuntime_TupleConverter_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                *(get_methods[index] if index < len(self.elements) else ffi.NULL for index in range(6)),
                _tuple_constructor,
                self._context,
            )
            self._is_setup = True

        def to_python(self, value):
            if not isinstance(value, tuple) or len(value) != len(self.elements):
                raise TypeError(f"Expected tuple with {len(self.elements)} elements, got {value!r}")
            return tuple(
                element.to_python(item)
                for element, item in zip(self.elements, value)
            )


    class Result(TypeDescriptor):
        def __new__(cls, swift_name: str, success: TypeDescriptor, failure: TypeDescriptor):
            key = (cls, swift_name, success, failure)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, success: TypeDescriptor, failure: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.success = success
            self.failure = failure
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            self.success.ensure_setup()
            self.failure.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            runtime_lib.FishyJoesCommonRuntime_ResultConverter_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _result_get_contents,
                _result_constructor,
                self._context,
            )
            self._is_setup = True

        def to_python(self, value):
            if isinstance(value, ResultSuccess):
                return ResultSuccess(self.success.to_python(value.value))
            if isinstance(value, ResultFailure):
                return ResultFailure(self.failure.to_python(value.error))
            raise TypeError(f"Expected ResultSuccess or ResultFailure, got {type(value).__name__}")


    class Future(TypeDescriptor):
        c_type = "foreignObject"

        def __new__(cls, swift_name: str, output: TypeDescriptor):
            key = (cls, swift_name, output)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, output: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.output = output
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            self.output.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            check(lambda exn: runtime_lib.FishyJoesCommonRuntime_FutureConverter_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _future_constructor,
                _future_sink,
                _future_resolve,
                _future_reject,
                self._context,
                exn,
            ))
            self._is_setup = True

        def to_iota(self, value):
            self.ensure_setup()
            return _new_handle(self.to_python_future(value))

        def to_iota_with_loop(self, value, loop):
            self.ensure_setup()
            return _new_handle(self.to_python_future(value, loop=loop))

        def peek_iota(self, ref):
            self.ensure_setup()
            return self.peek_python_future(ref).future

        def peek_python_future(self, ref):
            value = ffi.from_handle(ref)
            if isinstance(value, _PythonFuture):
                return value
            if asyncio.isfuture(value):
                return _PythonFuture(value, value.get_loop())
            if isinstance(value, concurrent.futures.Future):
                return _PythonFuture(value, None)
            raise TypeError(f"Expected awaitable for {self.swift_name}, got {type(value).__name__}")

        def consume_iota(self, ref):
            try:
                return self.peek_iota(ref)
            finally:
                if ref != ffi.NULL:
                    _delete_ref(ref)

        def to_python_future(self, value, loop=None):
            if isinstance(value, _PythonFuture):
                return value
            if asyncio.isfuture(value):
                return _PythonFuture(value, value.get_loop())
            if isinstance(value, concurrent.futures.Future):
                return _PythonFuture(value, loop)
            if loop is None:
                loop = _conversion_loop()
            if inspect.isawaitable(value):
                if _running_loop_or_none() is loop:
                    return _PythonFuture(loop.create_task(value), loop)
                return _PythonFuture(asyncio.run_coroutine_threadsafe(value, loop), loop)
            if _running_loop_or_none() is loop:
                future = loop.create_future()
            else:
                future = concurrent.futures.Future()
            future.set_result(self.output.to_python(value))
            return _PythonFuture(future, loop)


    class AsyncFunction(TypeDescriptor):
        c_type = "foreignObject"

        def __new__(cls, swift_name: str, setup_name: str, parameters: list[TypeDescriptor], return_type: TypeDescriptor):
            key = (cls, swift_name, setup_name, tuple(parameters), return_type)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, setup_name: str, parameters: list[TypeDescriptor], return_type: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.future = Future(f"FutureConverter<{return_type.swift_name}>", return_type)
            self.function = Function(setup_name, parameters, self.future)
            self.swift_name = swift_name
            self.setup_name = setup_name
            self.parameters = parameters
            self.return_type = return_type
            self._is_setup = False

        def ensure_setup(self):
            self.future.ensure_setup()
            self.function.ensure_setup()
            self._is_setup = True

        def to_iota(self, value):
            if not callable(value):
                raise TypeError(f"Expected callable for {self.swift_name}, got {type(value).__name__}")
            self.ensure_setup()
            return _new_handle(_PythonAsyncFunction(self, value, _conversion_loop()))

        def peek_iota(self, ref):
            self.ensure_setup()
            value = ffi.from_handle(ref)
            if not isinstance(value, _SwiftFunction):
                raise TypeError(f"Expected Swift async function for {self.swift_name}, got {type(value).__name__}")
            return value

        def consume_iota(self, ref):
            try:
                return self.peek_iota(ref)
            finally:
                if ref != ffi.NULL:
                    _delete_ref(ref)

        def invoke_swift(self, swift_ref, args, exn):
            return self.function.invoke_swift(swift_ref, args, exn)


    class Function(TypeDescriptor):
        c_type = "foreignObject"

        def __new__(cls, swift_name: str, parameters: list[TypeDescriptor], return_type: TypeDescriptor):
            key = (cls, swift_name, tuple(parameters), return_type)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, swift_name: str, parameters: list[TypeDescriptor], return_type: TypeDescriptor):
            if "_is_setup" in self.__dict__:
                return
            self.swift_name = swift_name
            self.parameters = parameters
            self.return_type = return_type
            self._context = None
            self._is_setup = False

        def ensure_setup(self):
            if self._is_setup:
                return
            for parameter in self.parameters:
                parameter.ensure_setup()
            self.return_type.ensure_setup()
            self._context = ffi.new_handle(self)
            _callbacks.append(self._context)
            check(lambda exn: runtime_lib.FishyJoesCommonRuntime_FunctionConverter_setup(
                env,
                _utf16_null_terminated(self.swift_name),
                _function_constructor,
                _function_invoke,
                self._context,
                exn,
            ))
            self._is_setup = True

        def to_iota(self, value):
            if not callable(value):
                raise TypeError(f"Expected callable for {self.swift_name}, got {type(value).__name__}")
            self.ensure_setup()
            return _new_handle(_PythonFunction(self, value, _conversion_loop_or_none()))

        def peek_iota(self, ref):
            self.ensure_setup()
            value = ffi.from_handle(ref)
            if not isinstance(value, _SwiftFunction):
                raise TypeError(f"Expected Swift function for {self.swift_name}, got {type(value).__name__}")
            return value

        def consume_iota(self, ref):
            try:
                return self.peek_iota(ref)
            finally:
                if ref != ffi.NULL:
                    _delete_ref(ref)

        def invoke_swift(self, swift_ref, args, exn):
            if len(args) != len(self.parameters):
                raise TypeError(f"Expected {len(self.parameters)} arguments, got {len(args)}")
            invoker = _swift_function_invokers[len(self.parameters)]
            return invoker(env, swift_ref, *args, exn)


    class _PythonFunction:
        def __init__(self, descriptor: Function, function, loop=None):
            self.descriptor = descriptor
            self.function = function
            self.loop = loop


    class _PythonAsyncFunction:
        def __init__(self, descriptor: AsyncFunction, function, loop):
            self.descriptor = descriptor
            self.function = function
            self.loop = loop

        def invoke(self, values):
            previous_loop = getattr(_async_context, "loop", None)
            _async_context.loop = self.loop
            try:
                return self.descriptor.future.to_iota_with_loop(self.function(*values), self.loop)
            finally:
                _async_context.loop = previous_loop


    class _PythonFuture:
        def __init__(self, future, loop):
            self.future = future
            self.loop = loop


    class _FuturePromise:
        def __init__(self, future, loop, output: TypeDescriptor):
            self.future = future
            self.loop = loop
            self.output = output
            with _handle_lock:
                # Re-check under the lock so the gate and registration are atomic with
                # shutdown()'s flag-set-and-snapshot. Without this a promise constructed
                # concurrently with shutdown() could miss the snapshot and never be
                # rejected, hanging its awaiter forever. _future_constructor's
                # `except BaseException` converts this into an out-exn back to Swift.
                if _is_shutdown:
                    raise RuntimeError("FishyJoes runtime has been shut down")
                _pending_promises.add(self)
            # Forget the promise if the awaiter cancels (or otherwise completes) the
            # future before Swift calls back, instead of leaking it in _pending_promises
            # until shutdown(). _forget is idempotent and lock-guarded.
            future.add_done_callback(lambda _: self._forget())

        def resolve(self, result_ref):
            if self.future.done():
                self.output.consume_iota(result_ref)
                self._forget()
                return
            value = self.output.consume_iota(result_ref)
            self._schedule(self._set_result_if_pending, value)

        def reject(self, error_ref):
            if self.future.done():
                _consume_error(error_ref)
                self._forget()
                return
            error = _consume_error(error_ref)
            self._schedule(self._set_exception_if_pending, error)

        def reject_for_shutdown(self):
            self._schedule(
                self._set_exception_if_pending,
                RuntimeError("FishyJoes runtime shut down before Swift future completed"),
            )

        def _schedule(self, callback, value):
            if self.loop is None or self.loop.is_closed() or _running_loop_or_none() is self.loop:
                callback(value)
            else:
                self.loop.call_soon_threadsafe(callback, value)

        def _forget(self):
            with _handle_lock:
                _pending_promises.discard(self)

        def _set_result_if_pending(self, value):
            try:
                if not self.future.done():
                    self.future.set_result(value)
            finally:
                self._forget()

        def _set_exception_if_pending(self, error):
            try:
                if not self.future.done():
                    self.future.set_exception(error)
            finally:
                self._forget()


    class _SwiftFunction:
        def __init__(self, descriptor: Function, ref):
            self.descriptor = descriptor
            self._swift_ref = ref
            self._finalizer = weakref.finalize(self, _release_swift_function, ref)

        def __call__(self, *args):
            if len(args) != len(self.descriptor.parameters):
                raise TypeError(f"Expected {len(self.descriptor.parameters)} arguments, got {len(args)}")
            converted_args = []
            try:
                for descriptor, value in zip(self.descriptor.parameters, args):
                    converted_args.append(descriptor.to_iota(value))
                result = check(lambda exn: self.descriptor.invoke_swift(self._swift_ref, converted_args, exn))
                return self.descriptor.return_type.consume_iota(result)
            finally:
                for ref in converted_args:
                    if ref != ffi.NULL:
                        _delete_ref(ref)


    class ValueType(TypeDescriptor):
        def __new__(cls, type_name: str):
            key = (cls, type_name)
            if key not in _descriptor_cache:
                _descriptor_cache[key] = super().__new__(cls)
            return _descriptor_cache[key]

        def __init__(self, type_name: str):
            if hasattr(self, "type_name"):
                return
            self.type_name = type_name

        def to_iota(self, value):
            if not isinstance(value, _value_types[self.type_name]):
                raise TypeError(f"Expected {self.type_name}, got {type(value).__name__}")
            if self.type_name in _external_value_types and hasattr(value, "_fishyjoes_external_iota_pointer"):
                return _new_swift_reference_ref(
                    self.type_name,
                    ffi.cast("void *", value._fishyjoes_external_iota_pointer()),
                )
            if hasattr(value, "_iota_ref"):
                return _new_handle(value)
            return _new_handle(value)

        def peek_iota(self, ref):
            value_type = _value_types[self.type_name]
            if self.type_name in _external_value_types and hasattr(value_type, "_fishyjoes_from_external_iota_pointer"):
                value = ffi.from_handle(ref)
                if isinstance(value, _SwiftReferenceValue):
                    return value_type._fishyjoes_from_external_iota_pointer(_address(value.ptr))
            if hasattr(value_type, "_from_iota"):
                return value_type._from_iota(_new_ref(ref))
            value = ffi.from_handle(ref)
            if not isinstance(value, value_type):
                raise TypeError(f"Expected {self.type_name}, got {type(value).__name__}")
            return value

        def consume_iota(self, ref):
            value_type = _value_types[self.type_name]
            if self.type_name in _external_value_types and hasattr(value_type, "_fishyjoes_from_external_iota_pointer"):
                try:
                    value = ffi.from_handle(ref)
                    if isinstance(value, _SwiftReferenceValue):
                        return value_type._fishyjoes_from_external_iota_pointer(_address(value.ptr))
                finally:
                    if ref != ffi.NULL:
                        _delete_ref(ref)
            if hasattr(value_type, "_from_iota"):
                return value_type._from_iota(ref)
            try:
                value = ffi.from_handle(ref)
                if not isinstance(value, value_type):
                    raise TypeError(f"Expected {self.type_name}, got {type(value).__name__}")
                return value
            finally:
                if ref != ffi.NULL:
                    _delete_ref(ref)


    class ProtocolType(ValueType):
        def to_iota(self, value):
            if hasattr(value, "_iota_ref"):
                return _new_handle(value)
            expected_type = _value_types[self.type_name]
            field_names, method_names = _protocol_requirements.get(self.type_name, ((), ()))
            if not isinstance(value, expected_type) and not all(hasattr(value, name) for name in field_names + method_names):
                raise TypeError(f"Expected {self.type_name}, got {type(value).__name__}")
            return _new_handle(value)


    VOID = Void()
    BOOL = Primitive("Bool", _bool_value)
    BOOL.swift_name = "Swift.Bool"
    BOOL.c_type = "bool"
    INT = Primitive("Int", _int_value)
    INT.swift_name = "Swift.Int"
    INT.c_type = "intptr_t"
    INT32 = Primitive("Int32", _int32_value)
    INT32.swift_name = "Swift.Int32"
    INT32.c_type = "int32_t"
    UINT8 = Primitive("UInt8", _uint8_value)
    UINT8.swift_name = "Swift.UInt8"
    UINT8.c_type = "uint8_t"
    INT8 = Primitive("Int8", _int8_value)
    INT8.swift_name = "Swift.Int8"
    INT8.c_type = "int8_t"
    INT16 = Primitive("Int16", _int16_value)
    INT16.swift_name = "Swift.Int16"
    INT16.c_type = "int16_t"
    INT64 = Primitive("Int64", _int64_value)
    INT64.swift_name = "Swift.Int64"
    INT64.c_type = "int64_t"
    UINT = Primitive("UInt", _uint_value)
    UINT.swift_name = "Swift.UInt"
    UINT.c_type = "uintptr_t"
    UINT16 = Primitive("UInt16", _uint16_value)
    UINT16.swift_name = "Swift.UInt16"
    UINT16.c_type = "uint16_t"
    UINT32 = Primitive("UInt32", _uint32_value)
    UINT32.swift_name = "Swift.UInt32"
    UINT32.c_type = "uint32_t"
    UINT64 = Primitive("UInt64", _uint64_value)
    UINT64.swift_name = "Swift.UInt64"
    UINT64.c_type = "uint64_t"
    FLOAT = Primitive("Float", _float_value)
    FLOAT.swift_name = "Swift.Float"
    FLOAT.c_type = "float"
    DOUBLE = Primitive("Double", _double_value)
    DOUBLE.swift_name = "Swift.Double"
    DOUBLE.c_type = "double"
    STRING = Primitive("String", lambda value: value if type(value) is str else (_raise_type("String", value)))
    STRING.swift_name = "Swift.String"
    DATA = Bytes()
    DATA.swift_name = "Foundation.Data"
    URL = Url()
    URL.swift_name = "Foundation.URL"


    def _raise_type(expected: str, value):
        raise TypeError(f"Expected {expected}, got {type(value).__name__}")


    @ffi.callback("foreignObject(foreignObject)")
    def _new_ref(obj):
        if obj == ffi.NULL:
            return ffi.NULL
        return _retain_handle(obj)


    @ffi.callback("void(foreignObject)")
    def _delete_ref(obj):
        if obj == ffi.NULL:
            return
        address = _address(obj)
        with _handle_lock:
            count = _handle_refcounts.get(address, 0)
            if count <= 1:
                _handle_refcounts.pop(address, None)
                _handles.pop(address, None)
            else:
                _handle_refcounts[address] = count - 1


    @ffi.callback("foreignObject(const uint16_t *)")
    def _new_error(message):
        data = bytearray()
        index = 0
        while message[index] != 0:
            data += int(message[index]).to_bytes(2, "little")
            index += 1
        return _new_handle(RuntimeError(data.decode("utf-16-le")))


    @ffi.callback("char *(foreignObject)")
    def _describe(obj):
        if obj == ffi.NULL:
            text = "<null>"
        else:
            text = str(ffi.from_handle(obj))
        return runtime_lib.FishyJoesCommonRuntime_strdup(ffi.new("char[]", text.encode("utf-8")))


    @ffi.callback("void(EnvRef, void *)")
    def _schedule_thread_work(env_ref, context):
        exn = ffi.new("foreignObject *")
        runtime_lib.FishyJoesCommonRuntime_runScheduledWork(env_ref, context, exn)
        if exn[0] != ffi.NULL:
            error = ffi.from_handle(exn[0])
            raise error if isinstance(error, BaseException) else RuntimeError(str(error))


    def _running_loop():
        try:
            return asyncio.get_running_loop()
        except RuntimeError as error:
            raise RuntimeError("Swift async bindings require a running asyncio event loop") from error


    def _running_loop_or_none():
        try:
            return asyncio.get_running_loop()
        except RuntimeError:
            return None


    def _conversion_loop():
        loop = getattr(_async_context, "loop", None)
        return loop if loop is not None else _running_loop()


    def _conversion_loop_or_none():
        loop = getattr(_async_context, "loop", None)
        return loop if loop is not None else _running_loop_or_none()


    def _consume_error(ref):
        try:
            error = ffi.from_handle(ref)
            return error if isinstance(error, BaseException) else RuntimeError(str(error))
        finally:
            if ref != ffi.NULL:
                _delete_ref(ref)


    def _encode_utf8(value: str) -> bytes:
        # FishyJoes exchanges strings as UTF-8 (ADR 0004). A Python str may contain lone
        # surrogates (e.g. "\ud800") that are not valid UTF-8; reject them explicitly with
        # a clear ValueError rather than surfacing an opaque codec error across the Swift
        # boundary. This is a hard error by design — the boundary does not lossily replace
        # or pass through invalid scalars.
        try:
            return value.encode("utf-8")
        except UnicodeEncodeError as error:
            raise ValueError(
                f"String is not valid UTF-8 and cannot cross the FishyJoes boundary: {value!r}"
            ) from error


    @ffi.callback("int(foreignObject, foreignOutExn)")
    def _string_utf8_length(obj, exn):
        try:
            return len(_encode_utf8(ffi.from_handle(obj)))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("void(foreignObject, char *, foreignOutExn)")
    def _string_get_utf8(obj, out_bytes, exn):
        try:
            encoded = _encode_utf8(ffi.from_handle(obj))
            ffi.memmove(out_bytes, encoded, len(encoded))
        except BaseException as error:
            exn[0] = _new_handle(error)


    @ffi.callback("foreignObject(const char *, int, foreignOutExn)")
    def _string_utf8_constructor(bytes_ptr, length, exn):
        try:
            return _new_handle(bytes(ffi.buffer(bytes_ptr, length)).decode("utf-8"))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("int(foreignObject, foreignOutExn)")
    def _data_length(data, exn):
        try:
            return len(ffi.from_handle(data))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("void(foreignObject, void *, foreignOutExn)")
    def _data_bytes(data, out_bytes, exn):
        try:
            value = bytes(ffi.from_handle(data))
            ffi.memmove(out_bytes, value, len(value))
        except BaseException as error:
            exn[0] = _new_handle(error)


    @ffi.callback("foreignObject(const void *, int, foreignOutExn)")
    def _data_constructor(bytes_ptr, length, exn):
        try:
            return _new_handle(bytes(ffi.buffer(bytes_ptr, length)))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("uint8_t(foreignObject, foreignOutExn)")
    def _bool_callback_value(obj, exn):
        try:
            return 1 if _bool_value(ffi.from_handle(obj)) else 0
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("uint8_t(foreignObject, foreignOutExn)")
    def _uint8_callback_value(obj, exn):
        try:
            return UINT8.peek_iota(obj)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("foreignObject(uint8_t)")
    def _uint8_constructor(value):
        return _new_handle(int(value))


    @ffi.callback("int32_t(foreignObject, foreignOutExn)")
    def _int32_callback_value(obj, exn):
        try:
            return _int32_value(ffi.from_handle(obj))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("foreignObject(int32_t)")
    def _int32_constructor(value):
        return _new_handle(int(value))


    @ffi.callback("intptr_t(foreignObject, foreignOutExn)")
    def _int_callback_value(obj, exn):
        try:
            return _int_value(ffi.from_handle(obj))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("foreignObject(intptr_t)")
    def _int_constructor(value):
        return _new_handle(int(value))


    # The fixed-width integer converters are mechanically identical, differing only by
    # C type and range validator, so build them from a factory rather than repeating the
    # boilerplate per width. (Bool/Int/Int32/UInt8/Float/Double keep their bespoke
    # definitions above because several have non-uniform bodies.)
    def _make_primitive_value_callback(c_type, validator):
        @ffi.callback(c_type + "(foreignObject, foreignOutExn)")
        def callback_value(obj, exn):
            try:
                return validator(ffi.from_handle(obj))
            except BaseException as error:
                exn[0] = _new_handle(error)
                return 0

        return callback_value

    def _make_primitive_constructor(c_type):
        @ffi.callback("foreignObject(" + c_type + ")")
        def constructor(value):
            return _new_handle(int(value))

        return constructor

    _int8_callback_value = _make_primitive_value_callback("int8_t", _int8_value)
    _int8_constructor = _make_primitive_constructor("int8_t")
    _int16_callback_value = _make_primitive_value_callback("int16_t", _int16_value)
    _int16_constructor = _make_primitive_constructor("int16_t")
    _int64_callback_value = _make_primitive_value_callback("int64_t", _int64_value)
    _int64_constructor = _make_primitive_constructor("int64_t")
    _uint_callback_value = _make_primitive_value_callback("uintptr_t", _uint_value)
    _uint_constructor = _make_primitive_constructor("uintptr_t")
    _uint16_callback_value = _make_primitive_value_callback("uint16_t", _uint16_value)
    _uint16_constructor = _make_primitive_constructor("uint16_t")
    _uint32_callback_value = _make_primitive_value_callback("uint32_t", _uint32_value)
    _uint32_constructor = _make_primitive_constructor("uint32_t")
    _uint64_callback_value = _make_primitive_value_callback("uint64_t", _uint64_value)
    _uint64_constructor = _make_primitive_constructor("uint64_t")


    @ffi.callback("double(foreignObject, foreignOutExn)")
    def _double_callback_value(obj, exn):
        try:
            return _double_value(ffi.from_handle(obj))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0.0


    @ffi.callback("foreignObject(double)")
    def _double_constructor(value):
        return _new_handle(float(value))


    @ffi.callback("float(foreignObject, foreignOutExn)")
    def _float_callback_value(obj, exn):
        try:
            return _float_value(ffi.from_handle(obj))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0.0


    @ffi.callback("foreignObject(float)")
    def _float_constructor(value):
        return _new_handle(float(value))


    @ffi.callback("int(void *, foreignObject, foreignOutExn)")
    def _collection_length(context, collection, exn):
        try:
            descriptor = ffi.from_handle(context)
            return len(descriptor.to_python(ffi.from_handle(collection)))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return 0


    @ffi.callback("void(void *, foreignObject, foreignObject *, foreignOutExn)")
    def _collection_values(context, collection, out_values, exn):
        try:
            descriptor = ffi.from_handle(context)
            values = descriptor.values(ffi.from_handle(collection))
            for index, value in enumerate(values):
                item_descriptor = descriptor.descriptor_for_index(index) if isinstance(descriptor, Dictionary) else descriptor.element
                out_values[index] = item_descriptor.to_iota(value)
        except BaseException as error:
            exn[0] = _new_handle(error)


    @ffi.callback("foreignObject(void *, const foreignObject *, int, foreignOutExn)")
    def _collection_constructor(context, in_values, length, exn):
        try:
            descriptor = ffi.from_handle(context)
            count = length * 2 if isinstance(descriptor, Dictionary) else length
            values = [
                (descriptor.descriptor_for_index(index) if isinstance(descriptor, Dictionary) else descriptor.element)
                .peek_iota(in_values[index])
                for index in range(count)
            ]
            return _new_handle(descriptor.construct(values))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _range_lower_bound(context, range_ref, exn):
        try:
            descriptor = ffi.from_handle(context)
            return descriptor.bound.to_iota(descriptor.to_python(ffi.from_handle(range_ref)).lower_bound)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _range_upper_bound(context, range_ref, exn):
        try:
            descriptor = ffi.from_handle(context)
            return descriptor.bound.to_iota(descriptor.to_python(ffi.from_handle(range_ref)).upper_bound)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, foreignObject, foreignOutExn)")
    def _range_constructor(context, lower_bound_ref, upper_bound_ref, exn):
        try:
            descriptor = ffi.from_handle(context)
            return _new_handle(descriptor.python_type(
                descriptor.bound.peek_iota(lower_bound_ref),
                descriptor.bound.peek_iota(upper_bound_ref),
            ))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    def _tuple_get(context, tuple_ref, index, exn):
        try:
            descriptor = ffi.from_handle(context)
            value = descriptor.to_python(ffi.from_handle(tuple_ref))[index]
            return descriptor.elements[index].to_iota(value)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get0(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 0, exn)


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get1(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 1, exn)


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get2(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 2, exn)


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get3(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 3, exn)


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get4(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 4, exn)


    @ffi.callback("foreignObject(void *, foreignObject, foreignOutExn)")
    def _tuple_get5(context, tuple_ref, exn):
        return _tuple_get(context, tuple_ref, 5, exn)


    @ffi.callback("foreignObject(void *, const foreignObject *, foreignOutExn)")
    def _tuple_constructor(context, values, exn):
        try:
            descriptor = ffi.from_handle(context)
            return _new_handle(tuple(
                element.peek_iota(values[index])
                for index, element in enumerate(descriptor.elements)
            ))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, uint8_t *, foreignOutExn)")
    def _result_get_contents(context, result, out_is_success, exn):
        try:
            descriptor = ffi.from_handle(context)
            value = descriptor.to_python(ffi.from_handle(result))
            if isinstance(value, ResultSuccess):
                out_is_success[0] = 1
                return descriptor.success.to_iota(value.value)
            out_is_success[0] = 0
            return descriptor.failure.to_iota(value.error)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, uint8_t, foreignObject, foreignOutExn)")
    def _result_constructor(context, is_success, contents, exn):
        try:
            descriptor = ffi.from_handle(context)
            if is_success != 0:
                return _new_handle(ResultSuccess(descriptor.success.consume_iota(contents)))
            return _new_handle(ResultFailure(descriptor.failure.consume_iota(contents)))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, void *, foreignOutExn)")
    def _function_constructor(context, ref, exn):
        try:
            descriptor = ffi.from_handle(context)
            return _new_handle(_SwiftFunction(descriptor, ref))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject, const foreignObject *, foreignOutExn)")
    def _function_invoke(context, fn, args, exn):
        try:
            descriptor = ffi.from_handle(context)
            function = ffi.from_handle(fn)
            if isinstance(function, _PythonAsyncFunction):
                values = [
                    parameter.consume_iota(args[index])
                    for index, parameter in enumerate(descriptor.parameters)
                ]
                return function.invoke(values)
            if not isinstance(function, _PythonFunction):
                raise TypeError(f"Expected Python function for {descriptor.swift_name}, got {type(function).__name__}")
            values = [
                parameter.consume_iota(args[index])
                for index, parameter in enumerate(descriptor.parameters)
            ]
            previous_loop = getattr(_async_context, "loop", None)
            _async_context.loop = function.loop
            try:
                return descriptor.return_type.to_iota(function.function(*values))
            finally:
                _async_context.loop = previous_loop
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignObject *, foreignOutExn)")
    def _future_constructor(context, out_promise, exn):
        try:
            if _is_shutdown:
                raise RuntimeError("FishyJoes runtime has been shut down")
            descriptor = ffi.from_handle(context)
            loop = _conversion_loop()
            future = loop.create_future() if _running_loop_or_none() is loop else concurrent.futures.Future()
            out_promise[0] = _new_handle(_FuturePromise(future, loop, descriptor.output))
            return _new_handle(_PythonFuture(future, loop))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("void(void *, foreignObject, foreignObject, foreignOutExn)")
    def _future_sink(context, future_ref, handler_context, exn):
        try:
            descriptor = ffi.from_handle(context)
            wrapped = descriptor.peek_python_future(future_ref)
            future = wrapped.future
            loop = wrapped.loop

            def attach_done_callback():
                future.add_done_callback(lambda completed: _invoke_future_sink_handler(descriptor, completed, handler_context))

            # Mirror _FuturePromise._schedule: when the owning loop is absent, already
            # closed, or is the current loop, attach inline rather than hopping through
            # call_soon_threadsafe (which raises on a closed loop and would strand the
            # Swift sink handler).
            if loop is None or loop.is_closed() or _running_loop_or_none() is loop:
                attach_done_callback()
            else:
                loop.call_soon_threadsafe(attach_done_callback)
        except BaseException as error:
            exn[0] = _new_handle(error)


    def _invoke_future_sink_handler(descriptor: Future, completed, handler_context):
        exn = ffi.new("foreignObject *")
        try:
            result_ref = descriptor.output.to_iota(completed.result())
            success = 1
        except BaseException as error:
            result_ref = _new_handle(error)
            success = 0
        runtime_lib.FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
            env,
            handler_context,
            success,
            result_ref,
            exn,
        )
        if exn[0] != ffi.NULL:
            raise _consume_error(exn[0])


    @ffi.callback("void(void *, foreignObject, foreignObject, foreignOutExn)")
    def _future_resolve(context, promise_ref, result, exn):
        try:
            promise = ffi.from_handle(promise_ref)
            if not isinstance(promise, _FuturePromise):
                raise TypeError(f"Expected Future promise, got {type(promise).__name__}")
            promise.resolve(result)
        except BaseException as error:
            exn[0] = _new_handle(error)
        finally:
            if promise_ref != ffi.NULL:
                _delete_ref(promise_ref)


    @ffi.callback("void(void *, foreignObject, foreignObject, foreignOutExn)")
    def _future_reject(context, promise_ref, error_ref, exn):
        try:
            promise = ffi.from_handle(promise_ref)
            if not isinstance(promise, _FuturePromise):
                raise TypeError(f"Expected Future promise, got {type(promise).__name__}")
            promise.reject(error_ref)
        except BaseException as error:
            exn[0] = _new_handle(error)
        finally:
            if promise_ref != ffi.NULL:
                _delete_ref(promise_ref)


    @ffi.callback("foreignObject(foreignObject, foreignOutExn)")
    def _url_absolute_uri(url, exn):
        try:
            return _new_handle(str(ffi.from_handle(url)))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(foreignObject, foreignOutExn)")
    def _url_constructor(string_ref, exn):
        try:
            return _new_handle(STRING.consume_iota(string_ref))
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("foreignObject(void *, foreignOutExn)")
    def _any_box_constructor(ptr, exn):
        try:
            return _new_swift_reference_ref("AnyBox", ptr)
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    @ffi.callback("void *(foreignObject, foreignOutExn)")
    def _any_box_ref_getter(obj, exn):
        try:
            value = ffi.from_handle(obj)
            if not isinstance(value, _SwiftReferenceValue):
                if not hasattr(value, "_iota_ref"):
                    raise TypeError(f"Expected Swift reference, got {type(value).__name__}")
                value = ffi.from_handle(value._iota_ref)
                if not isinstance(value, _SwiftReferenceValue):
                    raise TypeError(f"Expected Swift reference, got {type(value).__name__}")
            return value.ptr
        except BaseException as error:
            exn[0] = _new_handle(error)
            return ffi.NULL


    def check(invocation):
        exn = ffi.new("foreignObject *")
        result = invocation(exn)
        if exn[0] != ffi.NULL:
            error = ffi.from_handle(exn[0])
            _delete_ref(exn[0])
            raise error if isinstance(error, BaseException) else RuntimeError(str(error))
        return result


    _callbacks.extend([
        _new_ref,
        _delete_ref,
        _new_error,
        _describe,
        _schedule_thread_work,
        _string_utf8_length,
        _string_get_utf8,
        _string_utf8_constructor,
        _data_length,
        _data_bytes,
        _data_constructor,
        _bool_callback_value,
        _uint8_callback_value,
        _uint8_constructor,
        _int8_callback_value,
        _int8_constructor,
        _int16_callback_value,
        _int16_constructor,
        _int64_callback_value,
        _int64_constructor,
        _uint_callback_value,
        _uint_constructor,
        _uint16_callback_value,
        _uint16_constructor,
        _uint32_callback_value,
        _uint32_constructor,
        _uint64_callback_value,
        _uint64_constructor,
        _int32_callback_value,
        _int32_constructor,
        _int_callback_value,
        _int_constructor,
        _double_callback_value,
        _double_constructor,
        _float_callback_value,
        _float_constructor,
        _collection_length,
        _collection_values,
        _collection_constructor,
        _range_lower_bound,
        _range_upper_bound,
        _range_constructor,
        _tuple_get0,
        _tuple_get1,
        _tuple_get2,
        _tuple_get3,
        _tuple_get4,
        _tuple_get5,
        _tuple_constructor,
        _result_get_contents,
        _result_constructor,
        _function_constructor,
        _function_invoke,
        _future_constructor,
        _future_sink,
        _future_resolve,
        _future_reject,
        _url_absolute_uri,
        _url_constructor,
        _any_box_constructor,
        _any_box_ref_getter,
    ])


    env = runtime_lib.FishyJoesCommonRuntime_Env_setup(
        _new_ref,
        _delete_ref,
        _new_error,
        _describe,
        _schedule_thread_work,
    )
    runtime_lib.Swift_Bool_setup(
        env,
        _new_handle(True),
        _new_handle(False),
        _bool_callback_value,
    )
    runtime_lib.Swift_String_utf8_setup(
        env,
        _string_utf8_length,
        _string_get_utf8,
        _string_utf8_constructor,
    )
    runtime_lib.Foundation_Data_setup(
        env,
        _data_length,
        _data_bytes,
        _data_constructor,
    )
    runtime_lib.Foundation_URL_setup(
        env,
        _url_absolute_uri,
        _url_constructor,
    )
    runtime_lib.Swift_Int_setup(
        env,
        _int_callback_value,
        _int_constructor,
    )
    runtime_lib.Swift_Int32_setup(
        env,
        _int32_callback_value,
        _int32_constructor,
    )
    runtime_lib.Swift_UInt8_setup(
        env,
        _uint8_callback_value,
        _uint8_constructor,
    )
    runtime_lib.Swift_Int8_setup(
        env,
        _int8_callback_value,
        _int8_constructor,
    )
    runtime_lib.Swift_Int16_setup(
        env,
        _int16_callback_value,
        _int16_constructor,
    )
    runtime_lib.Swift_Int64_setup(
        env,
        _int64_callback_value,
        _int64_constructor,
    )
    runtime_lib.Swift_UInt_setup(
        env,
        _uint_callback_value,
        _uint_constructor,
    )
    runtime_lib.Swift_UInt16_setup(
        env,
        _uint16_callback_value,
        _uint16_constructor,
    )
    runtime_lib.Swift_UInt32_setup(
        env,
        _uint32_callback_value,
        _uint32_constructor,
    )
    runtime_lib.Swift_UInt64_setup(
        env,
        _uint64_callback_value,
        _uint64_constructor,
    )
    runtime_lib.Swift_Float_setup(
        env,
        _float_callback_value,
        _float_constructor,
    )
    runtime_lib.Swift_Double_setup(
        env,
        _double_callback_value,
        _double_constructor,
    )
    runtime_lib.FishyJoesCommonRuntime_AnyBox_setup(
        env,
        _any_box_constructor,
        _any_box_ref_getter,
    )
    getattr(iota_lib, config.register_types_symbol)()

    SUPPORTED = True


    def diagnostics(package_name: str):
        return package_diagnostics(
            package_name,
            config,
            supported=SUPPORTED,
            dependency_reports=_DEPENDENCY_REPORTS,
            library_paths=_LIBRARY_PATHS,
        )


    def shutdown():
        nonlocal _is_shutdown
        # Set the flag and snapshot pending promises in one critical section so it is
        # totally ordered against _FuturePromise.__init__'s gate: a promise is either
        # in this snapshot (and rejected below) or refused at construction. No
        # never-resolved future can escape.
        with _handle_lock:
            _is_shutdown = True
            promises = list(_pending_promises)
        for promise in promises:
            promise.reject_for_shutdown()


    def bind(name: str):
        return getattr(iota_lib, name)


    class IotaObject:
        def __init__(self):
            self._adopt_iota_ref(_new_iota_value_ref(type(self).__name__))

        def _adopt_iota_ref(self, ref):
            self._iota_ref = ref
            self._iota_finalizer = weakref.finalize(self, _delete_ref, ref)

        @classmethod
        def _from_iota(cls, ref):
            if ref == ffi.NULL:
                raise RuntimeError(f"Expected {cls.__name__}, got null Iota reference")
            value = ffi.from_handle(ref)
            if not isinstance(value, _IotaValue) or value.type_name != cls.__name__:
                raise TypeError(f"Expected {cls.__name__}, got {type(value).__name__}")
            instance = cls.__new__(cls)
            instance._adopt_iota_ref(ref)
            return instance


    def _release_swift_reference(ref):
        try:
            value = ffi.from_handle(ref)
            if isinstance(value, _SwiftReferenceValue) and value.ptr != ffi.NULL:
                check(lambda exn: runtime_lib.FishyJoesCommonRuntime_AnyBox_releaseRef(env, value.ptr, exn))
        finally:
            _delete_ref(ref)


    def _swift_reference_pointer(ref) -> int:
        value = ffi.from_handle(ref)
        if not isinstance(value, _SwiftReferenceValue):
            raise TypeError(f"Expected Swift reference, got {type(value).__name__}")
        return _address(value.ptr)


    def _release_swift_function(ref):
        check(lambda exn: runtime_lib.FishyJoesCommonRuntime_AnyBox_releaseRef(env, ref, exn))


    _swift_function_invokers = [
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5,
        runtime_lib.FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6,
    ]


    class SwiftReference:
        def _adopt_iota_ref(self, ref):
            self._iota_ref = ref
            self._iota_finalizer = weakref.finalize(self, _release_swift_reference, ref)

        def _fishyjoes_external_iota_pointer(self) -> int:
            value = ffi.from_handle(self._iota_ref)
            if not isinstance(value, _SwiftReferenceValue):
                raise TypeError(f"Expected Swift reference, got {type(value).__name__}")
            return _address(value.ptr)

        @classmethod
        def _fishyjoes_from_external_iota_pointer(cls, ptr_address: int):
            instance = cls.__new__(cls)
            instance._adopt_iota_ref(_new_swift_reference_ref(cls.__name__, ffi.cast("void *", ptr_address)))
            return instance

        @classmethod
        def _from_iota(cls, ref):
            if ref == ffi.NULL:
                raise RuntimeError(f"Expected {cls.__name__}, got null Iota reference")
            value = ffi.from_handle(ref)
            if not isinstance(value, _SwiftReferenceValue) or value.type_name != cls.__name__:
                raise TypeError(f"Expected {cls.__name__}, got {type(value).__name__}")
            instance = cls.__new__(cls)
            instance._adopt_iota_ref(ref)
            return instance

        def __repr__(self):
            return f"{type(self).__name__}(swift_ref=0x{_swift_reference_pointer(self._iota_ref):x})"


    def setup_empty_value_type(setup_function, value_type: type[IotaObject]):
        _value_types[value_type.__name__] = value_type

        @ffi.callback("foreignObject(foreignOutExn)")
        def constructor(exn):
            try:
                return _new_iota_value_ref(value_type.__name__)
            except BaseException as error:
                exn[0] = _new_handle(error)
                return ffi.NULL

        _callbacks.append(constructor)
        check(lambda exn: setup_function(env, constructor, exn))


    def _external_setup_hook(value_type: type):
        module = sys.modules.get(value_type.__module__)
        if module is None:
            return None
        return getattr(module, "_fishyjoes_setup_external", None)


    def register_external_type(value_type: type, setup_external=None):
        _value_types[value_type.__name__] = value_type
        _external_value_types.add(value_type.__name__)
        if setup_external is not None and value_type.__name__ not in _external_type_setups:
            setup_external(_runtime_namespace)
            _external_type_setups.add(value_type.__name__)
            return
        if value_type.__name__ in _external_type_setups:
            return
        discovered_setup = _external_setup_hook(value_type)
        if discovered_setup is None:
            raise RuntimeError(
                f"External generated type {value_type.__module__}.{value_type.__name__} does not expose "
                "_fishyjoes_setup_external; regenerate that dependency with this FishyJoes version."
            )
        discovered_setup(_runtime_namespace)
        _external_type_setups.add(value_type.__name__)


    def _callback_result(descriptor: TypeDescriptor, value):
        if descriptor.c_type == "foreignObject":
            return descriptor.to_iota(value)
        return descriptor.to_python(value)


    def _callback_argument(descriptor: TypeDescriptor, value):
        if descriptor.c_type == "foreignObject":
            return descriptor.consume_iota(value)
        return descriptor.to_python(value)


    def _callback_default_value(descriptor: TypeDescriptor):
        if descriptor.c_type == "foreignObject":
            return ffi.NULL
        if descriptor is BOOL:
            return False
        if descriptor is VOID:
            return None
        return descriptor.to_python(0)


    def setup_value_type(setup_function, value_type: type, fields: list[Field]):
        _value_types[value_type.__name__] = value_type
        for field in fields:
            field.descriptor.ensure_setup()

        constructor_signature = ", ".join([field.descriptor.c_type for field in fields] + ["foreignOutExn"])

        @ffi.callback(f"foreignObject({constructor_signature})")
        def constructor(*args):
            *values, exn = args
            try:
                return _new_handle(value_type(**{
                    field.name: _callback_argument(field.descriptor, value)
                    for field, value in zip(fields, values)
                }))
            except BaseException as error:
                exn[0] = _new_handle(error)
                return ffi.NULL

        callbacks = [constructor]

        for field in fields:
            @ffi.callback(f"{field.descriptor.c_type}(foreignObject, foreignOutExn)")
            def getter(obj, exn, field=field):
                try:
                    return _callback_result(field.descriptor, getattr(ffi.from_handle(obj), field.name))
                except BaseException as error:
                    exn[0] = _new_handle(error)
                    return ffi.NULL if field.descriptor.c_type == "foreignObject" else field.descriptor.to_python(False if field.descriptor is BOOL else 0)

            callbacks.append(getter)

            if field.mutable:
                @ffi.callback(f"void(foreignObject, {field.descriptor.c_type}, foreignOutExn)")
                def setter(obj, new_value, exn, field=field):
                    try:
                        setattr(ffi.from_handle(obj), field.name, _callback_argument(field.descriptor, new_value))
                    except BaseException as error:
                        exn[0] = _new_handle(error)

                callbacks.append(setter)

        _callbacks.extend(callbacks)
        check(lambda exn: setup_function(env, *callbacks, exn))


    def setup_protocol_type(setup_function, protocol_type: type[SwiftReference], fields: list[ProtocolField], methods: list[ProtocolMethod]):
        _value_types[protocol_type.__name__] = protocol_type
        _protocol_requirements[protocol_type.__name__] = (
            tuple(field.name for field in fields),
            tuple(method.name for method in methods),
        )
        for field in fields:
            field.descriptor.ensure_setup()
        for method in methods:
            for parameter in method.parameters:
                parameter.ensure_setup()
            method.return_type.ensure_setup()

        @ffi.callback("foreignObject(void *, foreignOutExn)")
        def constructor(ptr, exn):
            try:
                return _new_swift_reference_ref(protocol_type.__name__, ptr)
            except BaseException as error:
                exn[0] = _new_handle(error)
                return ffi.NULL

        callbacks = [constructor]

        for field in fields:
            @ffi.callback(f"{field.descriptor.c_type}(foreignObject, foreignOutExn)")
            def getter(obj, exn, field=field):
                try:
                    return _callback_result(field.descriptor, getattr(ffi.from_handle(obj), field.name))
                except BaseException as error:
                    exn[0] = _new_handle(error)
                    return _callback_default_value(field.descriptor)

            callbacks.append(getter)

        for method in methods:
            signature = ", ".join(["foreignObject"] + [parameter.c_type for parameter in method.parameters] + ["foreignOutExn"])

            @ffi.callback(f"{method.return_type.c_type}({signature})")
            def invoker(*args, method=method):
                obj, *raw_values, exn = args
                try:
                    values = [
                        parameter.consume_iota(value) if parameter.c_type == "foreignObject" else parameter.to_python(value)
                        for parameter, value in zip(method.parameters, raw_values)
                    ]
                    result = getattr(ffi.from_handle(obj), method.name)(*values)
                    return _callback_result(method.return_type, result)
                except BaseException as error:
                    exn[0] = _new_handle(error)
                    return _callback_default_value(method.return_type)

            callbacks.append(invoker)

        _callbacks.extend(callbacks)
        check(lambda exn: setup_function(env, *callbacks, exn))


    def setup_simple_enum_type(setup_function, enum_type: type, cases: list[str]):
        _value_types[enum_type.__name__] = enum_type

        @ffi.callback("int(foreignObject, foreignOutExn)")
        def discriminator(obj, exn):
            try:
                value = ffi.from_handle(obj)
                if not isinstance(value, enum_type):
                    raise TypeError(f"Expected {enum_type.__name__}, got {type(value).__name__}")
                return cases.index(value.name)
            except BaseException as error:
                exn[0] = _new_handle(error)
                return 0

        callbacks = [discriminator]

        for case in cases:
            @ffi.callback("foreignObject(foreignOutExn)")
            def constructor(exn, case=case):
                try:
                    return _new_handle(enum_type[case])
                except BaseException as error:
                    exn[0] = _new_handle(error)
                    return ffi.NULL

            @ffi.callback("void(foreignObject, foreignOutExn)")
            def extractor(obj, exn, case=case):
                try:
                    value = ffi.from_handle(obj)
                    if not isinstance(value, enum_type) or value.name != case:
                        raise TypeError(f"Expected {enum_type.__name__}.{case}, got {value!r}")
                except BaseException as error:
                    exn[0] = _new_handle(error)

            callbacks.extend([constructor, extractor])

        _callbacks.extend(callbacks)
        setup_function(env, *callbacks)


    def setup_associated_enum_type(setup_function, enum_type: type, cases: list[EnumCase]):
        _value_types[enum_type.__name__] = enum_type
        for enum_case in cases:
            for field in enum_case.fields:
                field.descriptor.ensure_setup()

        @ffi.callback("int(foreignObject, foreignOutExn)")
        def discriminator(obj, exn):
            try:
                value = ffi.from_handle(obj)
                if not isinstance(value, enum_type):
                    raise TypeError(f"Expected {enum_type.__name__}, got {type(value).__name__}")
                for index, enum_case in enumerate(cases):
                    if isinstance(value, enum_case.case_type):
                        return index
                raise TypeError(f"Found unexpected subclass of {enum_type.__name__}: {value!r}")
            except BaseException as error:
                exn[0] = _new_handle(error)
                return 0

        callbacks = [discriminator]

        for enum_case in cases:
            constructor_signature = ", ".join(
                [field.descriptor.c_type for field in enum_case.fields] + ["foreignOutExn"]
            )

            @ffi.callback(f"foreignObject({constructor_signature})")
            def constructor(*args, enum_case=enum_case):
                *values, exn = args
                try:
                    return _new_handle(enum_case.case_type(**{
                        field.name: _callback_argument(field.descriptor, value)
                        for field, value in zip(enum_case.fields, values)
                    }))
                except BaseException as error:
                    exn[0] = _new_handle(error)
                    return ffi.NULL

            extractor_signature = ", ".join(
                ["foreignObject"] + [f"{field.descriptor.c_type} *" for field in enum_case.fields] + ["foreignOutExn"]
            )

            @ffi.callback(f"void({extractor_signature})")
            def extractor(*args, enum_case=enum_case):
                obj, *outputs, exn = args
                try:
                    value = ffi.from_handle(obj)
                    if not isinstance(value, enum_case.case_type):
                        raise TypeError(f"Expected {enum_case.case_type.__name__}, got {type(value).__name__}")
                    for field, output in zip(enum_case.fields, outputs):
                        output[0] = _callback_result(field.descriptor, getattr(value, field.name))
                    exn[0] = ffi.NULL
                except BaseException as error:
                    exn[0] = _new_handle(error)

            callbacks.extend([constructor, extractor])

        _callbacks.extend(callbacks)
        setup_function(env, *callbacks)


    def setup_reference_type(setup_function, reference_type: type[SwiftReference]):
        _value_types[reference_type.__name__] = reference_type

        @ffi.callback("foreignObject(void *, foreignOutExn)")
        def constructor(ptr, exn):
            try:
                return _new_swift_reference_ref(reference_type.__name__, ptr)
            except BaseException as error:
                exn[0] = _new_handle(error)
                return ffi.NULL

        _callbacks.append(constructor)
        check(lambda exn: setup_function(env, constructor, exn))


    def _runtime_symbol(name: str):
        return getattr(runtime_lib, name)


    def _runtime_reference_equals(expected_type, equals_function, lhs, rhs):
        if not isinstance(rhs, expected_type):
            return False
        return bool(check(lambda exn: equals_function(
            env,
            lhs._iota_ref,
            rhs._iota_ref,
            exn,
        )))


    def _runtime_reference_hash(hash_function, value):
        return check(lambda exn: hash_function(
            env,
            value._iota_ref,
            exn,
        ))


    _attributed_string_get_string = _runtime_symbol("__iota_get_Foundation_AttributedString_string")
    _attributed_string_get_substring = _runtime_symbol("__iota_get_Foundation_AttributedString_substring")
    _attributed_string_equals = _runtime_symbol("__iota_Foundation_AttributedString_equals")
    _attributed_string_hash = _runtime_symbol("__iota_get_Foundation_AttributedString_hash")
    _attributed_substring_get_base = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_base")
    _attributed_substring_get_string = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_string")
    _attributed_substring_get_substring = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_substring")
    _attributed_substring_equals = _runtime_symbol("__iota_Foundation_AttributedSubstring_equals")
    _attributed_substring_hash = _runtime_symbol("__iota_get_Foundation_AttributedSubstring_hash")
    _attribute_container_equals = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_equals")
    _attribute_container_hash = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash")
    _foundation_attributes_get_link = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link")
    _foundation_attributes_get_language_identifier = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier")
    _foundation_attributes_equals = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals")
    _foundation_attributes_hash = _runtime_symbol("__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash")
    _foundation_attributes_create_from_container = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer")
    _foundation_attributes_as_container = _runtime_symbol("__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer")


    class AttributedString(SwiftReference):
        @property
        def string(self):
            return call(
                _attributed_string_get_string,
                args=[self._iota_ref],
                return_conversion=STRING,
            )

        @property
        def substring(self):
            return call(
                _attributed_string_get_substring,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedSubstring"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedString, _attributed_string_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attributed_string_hash, self)


    _opaque_runtime_reference_names = [
        "AttributedString_Index",
        "AttributedString_UnicodeScalarView",
        "AttributedString_CharacterView",
        "AttributedString_Runs",
        "AttributedString_Runs_Index",
        "AttributedString_Runs_Run",
    ]
    _opaque_runtime_references = {
        name: type(name, (SwiftReference,), {}) for name in _opaque_runtime_reference_names
    }


    class AttributedSubstring(SwiftReference):
        @property
        def base(self):
            return call(
                _attributed_substring_get_base,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedString"),
            )

        @property
        def string(self):
            return call(
                _attributed_substring_get_string,
                args=[self._iota_ref],
                return_conversion=STRING,
            )

        @property
        def substring(self):
            return call(
                _attributed_substring_get_substring,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributedSubstring"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(AttributedSubstring, _attributed_substring_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attributed_substring_hash, self)


    class AttributeContainer(SwiftReference):
        @property
        def foundation(self):
            return call(
                _foundation_attributes_create_from_container,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributeContainer_FoundationAttributes"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(AttributeContainer, _attribute_container_equals, self, other)

        def __hash__(self):
            return _runtime_reference_hash(_attribute_container_hash, self)


    class AttributeContainer_FoundationAttributes(SwiftReference):
        @property
        def link(self):
            return call(
                _foundation_attributes_get_link,
                args=[self._iota_ref],
                return_conversion=Optional(URL),
            )

        @property
        def language_identifier(self):
            return call(
                _foundation_attributes_get_language_identifier,
                args=[self._iota_ref],
                return_conversion=Optional(STRING),
            )

        def as_container(self):
            return call(
                _foundation_attributes_as_container,
                args=[self._iota_ref],
                return_conversion=ValueType("AttributeContainer"),
            )

        def __eq__(self, other):
            return _runtime_reference_equals(
                AttributeContainer_FoundationAttributes,
                _foundation_attributes_equals,
                self,
                other,
            )

        def __hash__(self):
            return _runtime_reference_hash(_foundation_attributes_hash, self)


    setup_reference_type(runtime_lib.Foundation_AttributedString_setup, AttributedString)
    for type_name in _opaque_runtime_reference_names:
        setup_reference_type(getattr(runtime_lib, f"Foundation_{type_name}_setup"), _opaque_runtime_references[type_name])
    setup_reference_type(runtime_lib.Foundation_AttributedSubstring_setup, AttributedSubstring)
    setup_reference_type(runtime_lib.FishyJoesCommonRuntime_AttributeContainer_setup, AttributeContainer)
    setup_reference_type(
        runtime_lib.FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup,
        AttributeContainer_FoundationAttributes,
    )

    _runtime_type_exports = {
        "Runtime_AttributedString": AttributedString,
        "Runtime_AttributedSubstring": AttributedSubstring,
        "Runtime_AttributeContainer": AttributeContainer,
        "Runtime_AttributeContainer_FoundationAttributes": AttributeContainer_FoundationAttributes,
        **{f"Runtime_{name}": python_type for name, python_type in _opaque_runtime_references.items()},
    }


    def call(function, args=None, arg_conversions=None, return_conversion=None):
        args = args or []
        arg_conversions = arg_conversions or []
        converted_args = []
        owned_args = []
        conversions = list(arg_conversions) + [None] * (len(args) - len(arg_conversions))
        for value, conversion in zip(args, conversions):
            if conversion is None:
                converted_args.append(value)
            else:
                conversion.ensure_setup()
                ref = conversion.to_iota(value)
                converted_args.append(ref)
                if ref != ffi.NULL:
                    owned_args.append(ref)
        if return_conversion is not None:
            return_conversion.ensure_setup()
        try:
            result = check(lambda exn: function(env, *converted_args, exn))
        finally:
            for ref in owned_args:
                _delete_ref(ref)

        if return_conversion is not None:
            return return_conversion.consume_iota(result)
        return result


    _export_names = [
        "ffi",
        "env",
        "SUPPORTED",
        "diagnostics",
        "shutdown",
        "bind",
        "check",
        "call",
        "StaticProperty",
        "warn_deprecated",
        "deprecated_getter",
        "IotaObject",
        "SwiftReference",
        "SwiftRange",
        "SwiftClosedRange",
        "ResultSuccess",
        "ResultFailure",
        "Field",
        "EnumCase",
        "ProtocolField",
        "ProtocolMethod",
        "VOID",
        "BOOL",
        "INT",
        "INT8",
        "INT16",
        "INT32",
        "INT64",
        "UINT",
        "UINT8",
        "UINT16",
        "UINT32",
        "UINT64",
        "FLOAT",
        "DOUBLE",
        "STRING",
        "DATA",
        "URL",
        "Optional",
        "Array",
        "Set",
        "Dictionary",
        "Range",
        "ClosedRange",
        "Tuple",
        "Result",
        "Future",
        "Function",
        "AsyncFunction",
        "ValueType",
        "ProtocolType",
        "register_external_type",
        "setup_empty_value_type",
        "setup_value_type",
        "setup_protocol_type",
        "setup_simple_enum_type",
        "setup_associated_enum_type",
        "setup_reference_type",
    ]
    _runtime_locals = locals()
    _exports = {name: _runtime_locals[name] for name in _export_names}
    _exports.update(_runtime_type_exports)
    _runtime_namespace = types.SimpleNamespace(**_exports)
    return _exports
