from __future__ import annotations

import ctypes
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Iterable, Protocol, TypeAlias

from .exceptions import NativeCallError
from .runtime import ensure_cpython


ForeignObject: TypeAlias = ctypes.c_void_p
ForeignObjectPtr: TypeAlias = ctypes.POINTER(ForeignObject)
Utf16Ptr: TypeAlias = ctypes.POINTER(ctypes.c_uint16)


def _decode_utf16_z(ptr: Utf16Ptr | None) -> str:
    if not ptr:
        return ""

    units: list[int] = []
    index = 0
    while True:
        unit = int(ptr[index])
        if unit == 0:
            break
        units.append(unit)
        index += 1

    raw = bytearray()
    for unit in units:
        raw.extend(unit.to_bytes(2, "little"))
    return raw.decode("utf-16-le")


def _decode_utf16_buffer(ptr: Utf16Ptr | None, length_in_bytes: int) -> str:
    if not ptr or length_in_bytes <= 0:
        return ""
    raw = ctypes.string_at(ctypes.cast(ptr, ctypes.c_void_p), length_in_bytes)
    return raw.decode("utf-16-le")


def _borrow_python_value(handle: int | None) -> object | None:
    if not handle:
        return None
    return ctypes.cast(ctypes.c_void_p(handle), ctypes.py_object).value


def _value_type_name(value: object | None) -> str:
    if value is None:
        return "None"
    return type(value).__name__


def _as_handle(value: object | int | None) -> int | None:
    if value is None:
        return None
    if isinstance(value, int):
        return value
    if isinstance(value, IotaReference):
        return value.handle.value
    if isinstance(value, NativeReference):
        return value.native_ref
    native_ref = getattr(value, "native_ref", None)
    if isinstance(native_ref, int) or native_ref is None:
        return native_ref
    handle = getattr(value, "handle", None)
    if isinstance(handle, IotaHandle):
        return handle.value
    if hasattr(handle, "value"):
        candidate = getattr(handle, "value")
        if isinstance(candidate, int) or candidate is None:
            return candidate
    return None


@dataclass(frozen=True, slots=True)
class IotaHandle:
    """Opaque handle for a native FishyJoes object."""

    value: int


class _ReleasableReference(Protocol):
    native_ref: int | None
    native_type: str

    def release(self) -> None: ...


@dataclass(slots=True)
class NativeReference:
    """Python-side wrapper around an opaque native reference."""

    native_ref: int | None = None
    native_type: str = "AnyBox"
    _runtime: "IotaRuntime | None" = field(default=None, repr=False, compare=False)

    def release(self) -> None:
        if self.native_ref is None or self._runtime is None:
            return
        self._runtime.release_native_reference(self.native_ref)
        self.native_ref = None

    def __repr__(self) -> str:
        return f"{type(self).__name__}(native_ref={self.native_ref!r}, native_type={self.native_type!r})"


@dataclass(slots=True)
class IotaReference:
    """Typed wrapper around an opaque native reference used by generated bindings."""

    handle: IotaHandle
    native_type: str
    _runtime: "IotaRuntime | None" = field(default=None, repr=False, compare=False)

    def release(self) -> None:
        if self._runtime is None:
            return
        self._runtime.release_native_reference(self.handle.value)

    def __repr__(self) -> str:
        return f"{type(self).__name__}(handle={self.handle!r}, native_type={self.native_type!r})"


class IotaRuntime:
    """Shared host runtime for FishyJoes Python bindings."""

    _EnvNewRefFn = ctypes.CFUNCTYPE(ForeignObject, ForeignObject)
    _EnvDeleteRefFn = ctypes.CFUNCTYPE(None, ForeignObject)
    _EnvNewErrorFn = ctypes.CFUNCTYPE(ForeignObject, Utf16Ptr)
    _EnvDescribeFn = ctypes.CFUNCTYPE(ctypes.c_void_p, ForeignObject)
    _EnvScheduleThreadWorkFn = ctypes.CFUNCTYPE(None, ctypes.c_void_p, ctypes.c_void_p)

    _BoolValueMethod = ctypes.CFUNCTYPE(ctypes.c_uint8, ForeignObject, ForeignObjectPtr)
    _IntValueMethod = ctypes.CFUNCTYPE(ctypes.c_longlong, ForeignObject, ForeignObjectPtr)
    _UIntValueMethod = ctypes.CFUNCTYPE(ctypes.c_ulonglong, ForeignObject, ForeignObjectPtr)
    _FloatValueMethod = ctypes.CFUNCTYPE(ctypes.c_float, ForeignObject, ForeignObjectPtr)
    _DoubleValueMethod = ctypes.CFUNCTYPE(ctypes.c_double, ForeignObject, ForeignObjectPtr)
    _IntConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_longlong)
    _UIntConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_ulonglong)
    _FloatConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_float)
    _DoubleConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_double)
    _StringLengthMethod = ctypes.CFUNCTYPE(ctypes.c_long, ForeignObject, ForeignObjectPtr)
    _StringUtf16Method = ctypes.CFUNCTYPE(None, ForeignObject, Utf16Ptr, ForeignObjectPtr)
    _StringConstructor = ctypes.CFUNCTYPE(ForeignObject, Utf16Ptr, ctypes.c_long, ForeignObjectPtr)
    _DataLengthMethod = ctypes.CFUNCTYPE(ctypes.c_int32, ForeignObject, ForeignObjectPtr)
    _DataBytesMethod = ctypes.CFUNCTYPE(None, ForeignObject, ctypes.c_void_p, ForeignObjectPtr)
    _DataConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_void_p, ctypes.c_int32, ForeignObjectPtr)
    _URLAbsoluteURIMethod = ctypes.CFUNCTYPE(ForeignObject, ForeignObject, ForeignObjectPtr)
    _URLConstructor = ctypes.CFUNCTYPE(ForeignObject, ForeignObject, ForeignObjectPtr)
    _AnyBoxConstructor = ctypes.CFUNCTYPE(ForeignObject, ctypes.c_void_p, ForeignObjectPtr)
    _AnyBoxRefGetter = ctypes.CFUNCTYPE(ctypes.c_void_p, ForeignObject, ForeignObjectPtr)
    def __init__(
        self,
        *,
        iota_runtime_path: Path,
        module_path: Path,
        module_iota_path: Path,
        module_name: str,
    ) -> None:
        ensure_cpython()
        self.iota_runtime_path = Path(iota_runtime_path)
        self.module_path = Path(module_path)
        self.module_iota_path = Path(module_iota_path)
        self.module_name = module_name

        self._pythonapi = ctypes.pythonapi
        self._pythonapi.Py_IncRef.argtypes = [ctypes.py_object]
        self._pythonapi.Py_IncRef.restype = None
        self._pythonapi.Py_DecRef.argtypes = [ctypes.py_object]
        self._pythonapi.Py_DecRef.restype = None

        self._libc = ctypes.CDLL(None)
        self._libc.malloc.argtypes = [ctypes.c_size_t]
        self._libc.malloc.restype = ctypes.c_void_p
        self._libc.free.argtypes = [ctypes.c_void_p]
        self._libc.free.restype = None

        self._callbacks: list[object] = []
        self._loaded = False

        self.iota_runtime_lib: ctypes.CDLL | None = None
        self.module_lib: ctypes.CDLL | None = None
        self.module_iota_lib: ctypes.CDLL | None = None
        self.env: int | None = None

    def ensure_loaded(self) -> None:
        if self._loaded:
            return

        mode = getattr(ctypes, "RTLD_GLOBAL", 0)
        self.iota_runtime_lib = ctypes.CDLL(str(self.iota_runtime_path), mode=mode)
        self.module_lib = ctypes.CDLL(str(self.module_path), mode=mode)
        self.module_iota_lib = ctypes.CDLL(str(self.module_iota_path), mode=mode)

        env_setup = self._bind(
            self.iota_runtime_lib,
            "FishyJoesCommonRuntime_Env_setup",
            restype=ctypes.c_void_p,
            argtypes=[ctypes.c_void_p] * 5,
        )

        self._callbacks.extend(
            [
                self._EnvNewRefFn(self._new_ref),
                self._EnvDeleteRefFn(self._delete_ref),
                self._EnvNewErrorFn(self._new_error),
                self._EnvDescribeFn(self._describe),
                self._EnvScheduleThreadWorkFn(self._schedule_thread_work),
            ]
        )

        self.env = int(
            env_setup(
                self._callbacks[0],
                self._callbacks[1],
                self._callbacks[2],
                self._callbacks[3],
                self._callbacks[4],
            )
        )
        self._setup_any_box()
        self._setup_core_converters()
        self._register_module_types()
        self._loaded = True

    def bind(
        self,
        symbol: str,
        *,
        library: str = "module_iota",
        restype: Any = None,
        argtypes: Iterable[Any] = (),
    ) -> Any:
        self.ensure_loaded()
        return self._bind(self._library(library), symbol, restype=restype, argtypes=argtypes)

    def invoke(
        self,
        symbol: str,
        *args: Any,
        library: str = "module_iota",
        restype: Any = None,
        argtypes: Iterable[Any] = (),
    ) -> Any:
        function = self.bind(symbol, library=library, restype=restype, argtypes=argtypes)
        return function(*args)

    def lookup_iota_symbol(self, symbol: str, *, restype: Any = None, argtypes: Iterable[Any] = ()) -> Any:
        return self.bind(symbol, library="module_iota", restype=restype, argtypes=argtypes)

    def retain_foreign_object(self, value: object) -> int:
        self._ensure_loaded()
        return self._retain(value)

    def release_foreign_object(self, handle: int | None) -> None:
        self._ensure_loaded()
        self._release(handle)

    def consume_foreign_object(self, handle: int | None) -> object | None:
        self._ensure_loaded()
        value = _borrow_python_value(handle)
        self._release(handle)
        return value

    def raise_if_exception(self, handle: int | None) -> None:
        self._ensure_loaded()
        if handle:
            self._raise_exception_handle(handle)

    def store_exception(self, out_exn: ForeignObjectPtr, error: BaseException) -> None:
        self._ensure_loaded()
        self._set_exn(out_exn, error)

    def raise_native_error(self, message: str) -> None:
        raise NativeCallError(message)

    def make_native_reference(self, native_ref: int | None, native_type: str = "AnyBox") -> NativeReference:
        return NativeReference(native_ref=native_ref, native_type=native_type, _runtime=self)

    def make_iota_reference(self, handle: int | None, native_type: str) -> IotaReference:
        return IotaReference(handle=IotaHandle(0 if handle is None else handle), native_type=native_type, _runtime=self)

    def wrap_reference(self, handle: int, native_type: str) -> NativeReference:
        return self.make_native_reference(handle, native_type)

    def unwrap_reference(self, value: IotaReference | NativeReference | int | None) -> int | None:
        return _as_handle(value)

    def passthrough(self, value: Any) -> Any:
        return value

    def coerce_native_ref(self, value: Any) -> int | None:
        return _as_handle(value)

    def release_native_reference(self, native_ref: int | None) -> None:
        if native_ref is None:
            return
        self._ensure_loaded()
        assert self.iota_runtime_lib is not None
        release = self._bind(
            self.iota_runtime_lib,
            "FishyJoesCommonRuntime_AnyBox_releaseRef",
            restype=None,
            argtypes=[ctypes.c_void_p, ForeignObjectPtr],
        )
        exn = ForeignObject()
        release(ctypes.c_void_p(self.env or 0), ctypes.c_void_p(native_ref), ctypes.byref(exn))
        self._raise_from_out(exn)

    def describe_native_reference(self, native_ref: int | None) -> str:
        if native_ref is None:
            return "<null>"
        self._ensure_loaded()
        assert self.iota_runtime_lib is not None
        describe = self._bind(
            self.iota_runtime_lib,
            "FishyJoesCommonRuntime_AnyBox_toString",
            restype=ForeignObject,
            argtypes=[ctypes.c_void_p, ForeignObjectPtr],
        )
        exn = ForeignObject()
        result = describe(ctypes.c_void_p(self.env or 0), ctypes.c_void_p(native_ref), ctypes.byref(exn))
        self._raise_from_out(exn)
        if not result.value:
            return "<null description>"
        try:
            value = _borrow_python_value(int(result.value))
            return str(value)
        finally:
            self._release(int(result.value))

    def _library(self, name: str) -> ctypes.CDLL:
        if name == "iota_runtime":
            assert self.iota_runtime_lib is not None
            return self.iota_runtime_lib
        if name == "module":
            assert self.module_lib is not None
            return self.module_lib
        assert self.module_iota_lib is not None
        return self.module_iota_lib

    def _bind(self, library: ctypes.CDLL, symbol: str, *, restype: Any, argtypes: Iterable[Any]) -> Any:
        function = getattr(library, symbol)
        function.restype = restype
        function.argtypes = list(argtypes)
        return function

    def _ensure_loaded(self) -> None:
        if not self._loaded:
            self.ensure_loaded()

    def _register_module_types(self) -> None:
        assert self.module_iota_lib is not None
        register_types = self._bind(
            self.module_iota_lib,
            f"FishyJoes_{self.module_name}_registerTypes",
            restype=None,
            argtypes=[],
        )
        register_types()

    def _retain(self, value: object) -> int:
        self._pythonapi.Py_IncRef(ctypes.py_object(value))
        return id(value)

    def _release(self, handle: int | None) -> None:
        value = _borrow_python_value(handle)
        if value is None:
            return
        self._pythonapi.Py_DecRef(ctypes.py_object(value))

    def _set_exn(self, out_exn: ForeignObjectPtr, error: BaseException) -> None:
        out_exn[0] = ForeignObject(self._retain(error))

    def _raise_exception_handle(self, handle: int) -> None:
        value = _borrow_python_value(handle)
        self._release(handle)
        if isinstance(value, BaseException):
            raise value
        raise NativeCallError(str(value))

    def _raise_from_out(self, out_exn: ForeignObject) -> None:
        if out_exn.value:
            self._raise_exception_handle(int(out_exn.value))

    def _run_scheduled_work(self, context: int) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        run_work = self._bind(
            self.iota_runtime_lib,
            "FishyJoesCommonRuntime_runScheduledWork",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ForeignObjectPtr],
        )
        exn = ForeignObject()
        run_work(ctypes.c_void_p(self.env), ctypes.c_void_p(context), ctypes.byref(exn))
        self._raise_from_out(exn)

    def _new_ref(self, obj: int | None) -> int | None:
        value = _borrow_python_value(obj)
        if value is None:
            return None
        return self._retain(value)

    def _delete_ref(self, obj: int | None) -> None:
        self._release(obj)

    def _new_error(self, message_ptr: Utf16Ptr | None) -> int:
        return self._retain(NativeCallError(_decode_utf16_z(message_ptr)))

    def _describe(self, obj: int | None) -> int:
        value = _borrow_python_value(obj)
        encoded = str(value).encode("utf-8")
        buffer = self._libc.malloc(len(encoded) + 1)
        if not buffer:
            raise MemoryError("failed to allocate UTF-8 description")
        ctypes.memmove(buffer, encoded, len(encoded))
        ctypes.memset(ctypes.c_void_p(buffer + len(encoded)), 0, 1)
        return int(buffer)

    def _schedule_thread_work(self, _env: int, context: int) -> None:
        self._run_scheduled_work(context)

    def _setup_any_box(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        constructor = self._AnyBoxConstructor(self._anybox_constructor)
        ref_getter = self._AnyBoxRefGetter(self._anybox_ref_getter)
        self._callbacks.extend([constructor, ref_getter])

        setup = self._bind(
            self.iota_runtime_lib,
            "FishyJoesCommonRuntime_AnyBox_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), constructor, ref_getter)

    def _anybox_constructor(self, ptr: int | None, exn: ForeignObjectPtr) -> int | None:
        try:
            return self._retain(self.make_native_reference(int(ptr or 0), "AnyBox"))
        except BaseException as error:
            self._set_exn(exn, error)
            return None

    def _anybox_ref_getter(self, obj: int | None, exn: ForeignObjectPtr) -> int:
        try:
            value = _borrow_python_value(obj)
            native_ref = self.coerce_native_ref(value)
            if native_ref is None:
                raise TypeError(f"expected native reference wrapper, got {_value_type_name(value)}")
            return int(native_ref)
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _setup_core_converters(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        self._setup_bool()
        self._setup_integers()
        self._setup_floats()
        self._setup_string()
        self._setup_data()
        self._setup_url()

    def _setup_bool(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        def bool_value(obj: int | None, exn: ForeignObjectPtr) -> int:
            try:
                return 1 if bool(_borrow_python_value(obj)) else 0
            except BaseException as error:
                self._set_exn(exn, error)
                return 0

        callback = self._BoolValueMethod(bool_value)
        self._callbacks.append(callback)

        setup = self._bind(
            self.iota_runtime_lib,
            "Swift_Bool_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ForeignObject, ForeignObject, ctypes.c_void_p],
        )
        setup(
            ctypes.c_void_p(self.env),
            self._retain(True),
            self._retain(False),
            callback,
        )

    def _integer_value(self, obj: int | None, exn: ForeignObjectPtr) -> int:
        try:
            value = _borrow_python_value(obj)
            return int(value if value is not None else 0)
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _integer_constructor(self, value: int) -> int:
        return self._retain(int(value))

    def _unsigned_constructor(self, value: int) -> int:
        return self._retain(int(value))

    def _setup_integers(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        signed_value = self._IntValueMethod(self._integer_value)
        unsigned_value = self._UIntValueMethod(self._integer_value)
        signed_constructor = self._IntConstructor(self._integer_constructor)
        unsigned_constructor = self._UIntConstructor(self._unsigned_constructor)
        self._callbacks.extend([signed_value, unsigned_value, signed_constructor, unsigned_constructor])

        for symbol in [
            "Swift_Int8_setup",
            "Swift_Int16_setup",
            "Swift_Int32_setup",
            "Swift_Int64_setup",
            "Swift_Int_setup",
        ]:
            setup = self._bind(
                self.iota_runtime_lib,
                symbol,
                restype=None,
                argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
            )
            setup(ctypes.c_void_p(self.env), signed_value, signed_constructor)

        for symbol in [
            "Swift_UInt8_setup",
            "Swift_UInt16_setup",
            "Swift_UInt32_setup",
            "Swift_UInt64_setup",
            "Swift_UInt_setup",
        ]:
            setup = self._bind(
                self.iota_runtime_lib,
                symbol,
                restype=None,
                argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
            )
            setup(ctypes.c_void_p(self.env), unsigned_value, unsigned_constructor)

    def _float_value(self, obj: int | None, exn: ForeignObjectPtr) -> float:
        try:
            return float(_borrow_python_value(obj) or 0.0)
        except BaseException as error:
            self._set_exn(exn, error)
            return 0.0

    def _float_constructor(self, value: float) -> int:
        return self._retain(float(value))

    def _setup_floats(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        float_value = self._FloatValueMethod(self._float_value)
        double_value = self._DoubleValueMethod(self._float_value)
        float_constructor = self._FloatConstructor(self._float_constructor)
        double_constructor = self._DoubleConstructor(self._float_constructor)
        self._callbacks.extend([float_value, double_value, float_constructor, double_constructor])

        setup = self._bind(
            self.iota_runtime_lib,
            "Swift_Float_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), float_value, float_constructor)

        setup = self._bind(
            self.iota_runtime_lib,
            "Swift_Double_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), double_value, double_constructor)

    def _string_length(self, obj: int | None, exn: ForeignObjectPtr) -> int:
        try:
            value = str(_borrow_python_value(obj) or "")
            return len(value.encode("utf-16-le")) // 2
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _string_utf16(self, obj: int | None, out_values: Utf16Ptr, exn: ForeignObjectPtr) -> None:
        try:
            value = str(_borrow_python_value(obj) or "")
            encoded = value.encode("utf-16-le")
            ctypes.memmove(out_values, encoded, len(encoded))
        except BaseException as error:
            self._set_exn(exn, error)

    def _string_constructor(
        self,
        in_values: Utf16Ptr,
        length_in_bytes: int,
        exn: ForeignObjectPtr,
    ) -> int | None:
        try:
            text = _decode_utf16_buffer(in_values, max(int(length_in_bytes), 0))
            return self._retain(text)
        except BaseException as error:
            self._set_exn(exn, error)
            return None

    def _setup_string(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        length = self._StringLengthMethod(self._string_length)
        utf16 = self._StringUtf16Method(self._string_utf16)
        constructor = self._StringConstructor(self._string_constructor)
        self._callbacks.extend([length, utf16, constructor])

        setup = self._bind(
            self.iota_runtime_lib,
            "Swift_String_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), length, utf16, constructor)

    def _data_length(self, obj: int | None, exn: ForeignObjectPtr) -> int:
        try:
            return len(bytes(_borrow_python_value(obj) or b""))
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _data_bytes(self, obj: int | None, out_values: int, exn: ForeignObjectPtr) -> None:
        try:
            value = bytes(_borrow_python_value(obj) or b"")
            if value:
                ctypes.memmove(out_values, value, len(value))
        except BaseException as error:
            self._set_exn(exn, error)

    def _data_constructor(self, data_ptr: int, length: int, exn: ForeignObjectPtr) -> int | None:
        try:
            value = ctypes.string_at(data_ptr, int(length))
            return self._retain(value)
        except BaseException as error:
            self._set_exn(exn, error)
            return None

    def _setup_data(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        length = self._DataLengthMethod(self._data_length)
        bytes_method = self._DataBytesMethod(self._data_bytes)
        constructor = self._DataConstructor(self._data_constructor)
        self._callbacks.extend([length, bytes_method, constructor])

        setup = self._bind(
            self.iota_runtime_lib,
            "Foundation_Data_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), length, bytes_method, constructor)

    def _url_absolute_uri(self, obj: int | None, exn: ForeignObjectPtr) -> int | None:
        try:
            value = str(_borrow_python_value(obj) or "")
            return self._retain(value)
        except BaseException as error:
            self._set_exn(exn, error)
            return None

    def _url_constructor(self, string_ref: int | None, exn: ForeignObjectPtr) -> int | None:
        try:
            value = str(_borrow_python_value(string_ref) or "")
            return self._retain(value)
        except BaseException as error:
            self._set_exn(exn, error)
            return None

    def _setup_url(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        absolute_uri = self._URLAbsoluteURIMethod(self._url_absolute_uri)
        constructor = self._URLConstructor(self._url_constructor)
        self._callbacks.extend([absolute_uri, constructor])

        setup = self._bind(
            self.iota_runtime_lib,
            "Foundation_URL_setup",
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p],
        )
        setup(ctypes.c_void_p(self.env), absolute_uri, constructor)
