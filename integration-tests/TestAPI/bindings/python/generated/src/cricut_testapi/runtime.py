"""Runtime helpers for FishyJoes-generated Python bindings."""

from __future__ import annotations

import ctypes
import platform
import typing

from fishyjoes_python.iota import IotaRuntime, NativeReference as _SharedNativeReference
from fishyjoes_python.loader import load_shared_library


PACKAGE_NAME = __package__ or "cricut_testapi"
MODULE_NAME = "TestAPI"


class NativeReference(_SharedNativeReference):
    def _require_native_ref(self) -> int:
        if self.native_ref is None:
            raise RuntimeError("Native reference is not initialized")
        return self.native_ref


class GeneratedRuntime:
    def __init__(self, package: str, module_name: str) -> None:
        self.package = package
        self.module_name = module_name
        self._runtime: IotaRuntime | None = None
        self._functions: dict[str, ctypes._CFuncPtr] = {}
        self._callbacks: list[object] = []

    def ensure_loaded(self) -> None:
        if self._runtime is not None:
            self._runtime.ensure_loaded()
            return

        iota_runtime_library = load_shared_library(self.package, _platform_library_name("FishyJoesIotaRuntime"))
        module_library = load_shared_library(self.package, _platform_library_name(self.module_name))
        iota_library = load_shared_library(self.package, _platform_library_name(f"{self.module_name}-iota"))
        self._runtime = IotaRuntime(
            iota_runtime_path=iota_runtime_library.path,
            module_path=module_library.path,
            module_iota_path=iota_library.path,
            module_name=self.module_name,
        )
        self._runtime.ensure_loaded()

    @property
    def env(self) -> int:
        self.ensure_loaded()
        assert self._runtime is not None
        assert self._runtime.env is not None
        return self._runtime.env

    def get_iota_function(
        self,
        symbol: str,
        *,
        restype: typing.Any,
        argtypes: list[typing.Any],
    ) -> ctypes._CFuncPtr:
        self.ensure_loaded()
        function = self._functions.get(symbol)
        if function is None:
            assert self._runtime is not None
            function = self._runtime.lookup_iota_symbol(symbol, restype=restype, argtypes=argtypes)
            self._functions[symbol] = function
        return function

    def invoke(self, symbol: str, return_type: str, *args: tuple[str, typing.Any]) -> typing.Any:
        self.ensure_loaded()
        assert self._runtime is not None

        converted_args: list[typing.Any] = [ctypes.c_void_p(self.env)]
        retained_handles: list[int] = []
        argtypes: list[typing.Any] = [ctypes.c_void_p]

        try:
            for ffi_name, value in args:
                argtypes.append(_ffi_ctypes_type(ffi_name))
                if ffi_name == "object":
                    native_ref = self._runtime.coerce_native_ref(value)
                    if native_ref is not None:
                        converted_args.append(ctypes.c_void_p(native_ref))
                    elif value is None:
                        converted_args.append(ctypes.c_void_p())
                    else:
                        handle = self._runtime.retain_foreign_object(value)
                        retained_handles.append(handle)
                        converted_args.append(ctypes.c_void_p(handle))
                elif ffi_name == "bool":
                    converted_args.append(1 if value else 0)
                else:
                    converted_args.append(value)

            restype = None if return_type == "void" else _ffi_ctypes_type(return_type)
            argtypes.append(ctypes.POINTER(ctypes.c_void_p))
            function = self.get_iota_function(symbol, restype=restype, argtypes=argtypes)
            exn = ctypes.c_void_p()
            result = function(*converted_args, ctypes.byref(exn))
            self._runtime.raise_if_exception(exn.value)
            return self._convert_return(result, return_type)
        finally:
            for handle in retained_handles:
                self._runtime.release_foreign_object(handle)

    def setup_reference_type(self, setup_symbol: str, cls: type[NativeReference]) -> None:
        self.ensure_loaded()
        assert self._runtime is not None

        constructor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

        def constructor(pointer: int | None, exn: ctypes.POINTER(ctypes.c_void_p)) -> int:
            try:
                instance = cls(native_ref=int(pointer or 0), native_type=cls.__name__, _runtime=self._runtime)
                return self._runtime.retain_foreign_object(instance)
            except BaseException as error:
                self._runtime.store_exception(exn, error)
                return 0

        callback = constructor_type(constructor)
        self._callbacks.append(callback)

        setup = self.get_iota_function(
            setup_symbol,
            restype=None,
            argtypes=[ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)],
        )
        exn = ctypes.c_void_p()
        setup(ctypes.c_void_p(self.env), callback, ctypes.byref(exn))
        self._runtime.raise_if_exception(exn.value)

    def setup_struct_type(
        self,
        setup_symbol: str,
        cls: type[object],
        field_specs: list[tuple[str, str]],
        mutable_fields: set[str],
    ) -> None:
        self.ensure_loaded()
        assert self._runtime is not None

        constructor_argtypes = [_ffi_ctypes_type(ffi_name) for _, ffi_name in field_specs]
        constructor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, *constructor_argtypes, ctypes.POINTER(ctypes.c_void_p))

        def constructor(*raw: typing.Any) -> int:
            exn = raw[-1]
            try:
                kwargs = {
                    field_name: self._convert_from_ffi(value, ffi_name)
                    for (field_name, ffi_name), value in zip(field_specs, raw[:-1], strict=True)
                }
                instance = cls(**kwargs)
                return self._runtime.retain_foreign_object(instance)
            except BaseException as error:
                self._runtime.store_exception(exn, error)
                return 0

        constructor_callback = constructor_type(constructor)
        self._callbacks.append(constructor_callback)
        callback_args: list[typing.Any] = [constructor_callback]
        function_argtypes: list[typing.Any] = [ctypes.c_void_p, ctypes.c_void_p]

        for field_name, ffi_name in field_specs:
            getter_type = ctypes.CFUNCTYPE(_ffi_ctypes_type(ffi_name), ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

            def getter(obj: int | None, exn: ctypes.POINTER(ctypes.c_void_p), *, _field=field_name, _ffi=ffi_name) -> typing.Any:
                try:
                    instance = ctypes.cast(ctypes.c_void_p(obj or 0), ctypes.py_object).value
                    return self._convert_to_ffi(getattr(instance, _field), _ffi)
                except BaseException as error:
                    self._runtime.store_exception(exn, error)
                    return _ffi_default_value(_ffi)

            getter_callback = getter_type(getter)
            self._callbacks.append(getter_callback)
            callback_args.append(getter_callback)
            function_argtypes.append(ctypes.c_void_p)

            if field_name in mutable_fields:
                setter_type = ctypes.CFUNCTYPE(None, ctypes.c_void_p, _ffi_ctypes_type(ffi_name), ctypes.POINTER(ctypes.c_void_p))

                def setter(
                    obj: int | None,
                    value: typing.Any,
                    exn: ctypes.POINTER(ctypes.c_void_p),
                    *,
                    _field=field_name,
                    _ffi=ffi_name,
                ) -> None:
                    try:
                        instance = ctypes.cast(ctypes.c_void_p(obj or 0), ctypes.py_object).value
                        setattr(instance, _field, self._convert_from_ffi(value, _ffi))
                    except BaseException as error:
                        self._runtime.store_exception(exn, error)

                setter_callback = setter_type(setter)
                self._callbacks.append(setter_callback)
                callback_args.append(setter_callback)
                function_argtypes.append(ctypes.c_void_p)

        function_argtypes.append(ctypes.POINTER(ctypes.c_void_p))
        setup = self.get_iota_function(setup_symbol, restype=None, argtypes=function_argtypes)
        exn = ctypes.c_void_p()
        setup(ctypes.c_void_p(self.env), *callback_args, ctypes.byref(exn))
        self._runtime.raise_if_exception(exn.value)

    def _convert_return(self, value: typing.Any, ffi_name: str) -> typing.Any:
        if ffi_name == "void":
            return None
        if ffi_name == "object":
            assert self._runtime is not None
            return self._runtime.consume_foreign_object(value)
        if ffi_name == "bool":
            return bool(value)
        if ffi_name in {"float", "double"}:
            return float(value)
        return int(value)

    def _convert_from_ffi(self, value: typing.Any, ffi_name: str) -> typing.Any:
        if ffi_name == "object":
            assert self._runtime is not None
            return self._runtime.consume_foreign_object(value)
        if ffi_name == "bool":
            return bool(value)
        if ffi_name in {"float", "double"}:
            return float(value)
        if ffi_name == "void":
            return None
        return int(value)

    def _convert_to_ffi(self, value: typing.Any, ffi_name: str) -> typing.Any:
        if ffi_name == "object":
            assert self._runtime is not None
            if value is None:
                return 0
            return self._runtime.retain_foreign_object(value)
        if ffi_name == "bool":
            return 1 if value else 0
        return value


def not_implemented(symbol: str) -> typing.NoReturn:
    raise NotImplementedError(
        f"Python binding surface for {symbol} is generated, but native-backed invocation is not wired yet."
    )


def ensure_loaded() -> None:
    get_runtime().ensure_loaded()


_RUNTIME: GeneratedRuntime | None = None


def get_runtime() -> GeneratedRuntime:
    global _RUNTIME
    if _RUNTIME is None:
        _RUNTIME = GeneratedRuntime(package=PACKAGE_NAME, module_name=MODULE_NAME)
    return _RUNTIME


def _ffi_ctypes_type(name: str) -> typing.Any:
    return {
        "bool": ctypes.c_uint8,
        "int8": ctypes.c_int8,
        "int16": ctypes.c_int16,
        "int32": ctypes.c_int32,
        "int64": ctypes.c_int64,
        "int": ctypes.c_ssize_t,
        "uint8": ctypes.c_uint8,
        "uint16": ctypes.c_uint16,
        "uint32": ctypes.c_uint32,
        "uint64": ctypes.c_uint64,
        "uint": ctypes.c_size_t,
        "float": ctypes.c_float,
        "double": ctypes.c_double,
        "object": ctypes.c_void_p,
    }[name]


def _ffi_default_value(name: str) -> typing.Any:
    return {
        "bool": 0,
        "int8": 0,
        "int16": 0,
        "int32": 0,
        "int64": 0,
        "int": 0,
        "uint8": 0,
        "uint16": 0,
        "uint32": 0,
        "uint64": 0,
        "uint": 0,
        "float": 0.0,
        "double": 0.0,
        "object": 0,
    }[name]


def _platform_library_name(name: str) -> str:
    if hasattr(ctypes, "windll"):
        return f"{name}.dll"

    if platform.system() == "Darwin":
        return f"lib{name}.dylib"

    return f"lib{name}.so"
