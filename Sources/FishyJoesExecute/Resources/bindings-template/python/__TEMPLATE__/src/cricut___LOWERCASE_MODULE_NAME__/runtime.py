"""Runtime helpers for FishyJoes-generated Python bindings."""

from __future__ import annotations

import ctypes
import platform
import typing

from fishyjoes_python.iota import IotaRuntime, NativeReference as _SharedNativeReference
from fishyjoes_python.loader import load_shared_library


PACKAGE_NAME = __package__ or "cricut___LOWERCASE_MODULE_NAME__"
MODULE_NAME = "__MODULE_NAME__"


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
                    if value is None:
                        converted_args.append(ctypes.c_void_p())
                    else:
                        # Always wrap the Python object in a cffi handle so that
                        # the Swift iota ABI can call back via anybox_ref_getter
                        # to extract the native pointer (for NativeReference) or
                        # the object fields (for value types / protocol conformers).
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
                instance = cls(native_ref=int(pointer or 0))
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

    def setup_enum_type(
        self,
        setup_symbol: str,
        cls: type,
        is_inhabited: bool,
        case_specs: list[tuple[str, list[tuple[str, str]]]],
    ) -> None:
        """Register an enum type with the Iota ABI.

        Args:
            setup_symbol: The @_cdecl symbol name for the enum's setup function.
            cls: The Python enum/sum-type class.
            is_inhabited: True if the enum has at least one case (False for empty enums).
            case_specs: List of (case_name, [(field_name, ffi_type), ...]) tuples.
        """
        self.ensure_loaded()
        assert self._runtime is not None

        if not is_inhabited:
            # Uninhabited enums: only constructors+extractors per case, no discriminator.
            # The setup function still expects callbacks for each case.
            pass

        callback_args: list[typing.Any] = []
        function_argtypes: list[typing.Any] = [ctypes.c_void_p]

        if is_inhabited:
            # discriminator: (foreignObject, foreignOutExn) -> Int
            discriminator_type = ctypes.CFUNCTYPE(ctypes.c_ssize_t, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

            case_names = [name for name, _ in case_specs]

            # Build per-case matchers at setup time (not per-call).
            # Each matcher returns True iff the value belongs to that case.
            import sys as _sys
            case_matchers: list[typing.Callable[[typing.Any], bool]] = []
            for case_name in case_names:
                case_attr = getattr(cls, case_name, None)
                if case_attr is not None and isinstance(case_attr, cls):
                    # enum.Enum member: use identity only.
                    _member = case_attr
                    case_matchers.append(lambda v, m=_member: v is m)
                else:
                    # Dataclass-style subclass: look up {ClassName}_{CaseName} across loaded modules.
                    subname = f"{cls.__name__}_{case_name[0].upper()}{case_name[1:]}"
                    subclass: type | None = None
                    for mod in list(_sys.modules.values()):
                        sc = getattr(mod, subname, None)
                        if sc is not None and isinstance(sc, type):
                            subclass = sc
                            break
                    if subclass is not None:
                        case_matchers.append(lambda v, t=subclass: isinstance(v, t))
                    else:
                        # Fallback: never matches (unrecognised case).
                        case_matchers.append(lambda v: False)

            def discriminator(obj: int | None, exn: ctypes.POINTER(ctypes.c_void_p)) -> int:
                try:
                    value = self._runtime.borrow_foreign_object(obj)
                    for idx, matches in enumerate(case_matchers):
                        if matches(value):
                            return idx
                    raise TypeError(f"value {value!r} is not a case of {cls.__name__}")
                except BaseException as error:
                    self._runtime.store_exception(exn, error)
                    return -1

            disc_cb = discriminator_type(discriminator)
            self._callbacks.append(disc_cb)
            callback_args.append(disc_cb)
            function_argtypes.append(ctypes.c_void_p)

        for case_name, value_field_specs in case_specs:
            # value_field_specs: list of (field_name, ffi_type) pairs
            field_names = [fn for fn, _ in value_field_specs]
            ffi_types_only = [ft for _, ft in value_field_specs]
            ctypes_value_types = [_ffi_ctypes_type(t) for t in ffi_types_only]

            # constructor: (value_types..., foreignOutExn) -> foreignObject
            constructor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, *ctypes_value_types, ctypes.POINTER(ctypes.c_void_p))

            # Resolve the case class at setup time (not at call time) to avoid
            # fragile sys._getframe() usage.
            import sys as _sys
            _case_cls: type | object | None = getattr(cls, case_name, None)
            if _case_cls is None or (_case_cls is not None and not isinstance(_case_cls, type) and not callable(_case_cls)):
                # Try pascal-case dataclass-style subclass: MyEnum_CaseName
                _subname = f"{cls.__name__}_{case_name[0].upper()}{case_name[1:]}"
                for _mod in list(_sys.modules.values()):
                    _sc = getattr(_mod, _subname, None)
                    if _sc is not None and isinstance(_sc, type):
                        _case_cls = _sc
                        break

            def make_constructor(fnames: list[str], ftypes: list[str], case_cls: typing.Any) -> typing.Any:
                def constructor(*raw: typing.Any) -> int:
                    exn = raw[-1]
                    try:
                        kwargs = {
                            fname: self._convert_from_ffi(v, ft)
                            for fname, v, ft in zip(fnames, raw[:-1], ftypes, strict=True)
                        }
                        if callable(case_cls):
                            instance = case_cls(**kwargs)
                        else:
                            # Non-callable sentinel (e.g. a plain enum member): use directly.
                            instance = case_cls
                        return self._runtime.retain_foreign_object(instance)
                    except BaseException as error:
                        self._runtime.store_exception(exn, error)
                        return 0
                return constructor

            ctor_cb = constructor_type(make_constructor(field_names, ffi_types_only, _case_cls))
            self._callbacks.append(ctor_cb)
            callback_args.append(ctor_cb)
            function_argtypes.append(ctypes.c_void_p)

            # extractor: (foreignObject, UnsafePointer<value_types>..., foreignOutExn) -> Void
            extractor_type = ctypes.CFUNCTYPE(
                None, ctypes.c_void_p, *[ctypes.c_void_p] * len(ctypes_value_types), ctypes.POINTER(ctypes.c_void_p)
            )

            def make_extractor(fnames: list[str], ftypes: list[str]) -> typing.Any:
                def extractor(obj: int | None, *raw: typing.Any) -> None:
                    exn = raw[-1]
                    out_ptrs = raw[:-1]
                    try:
                        value = self._runtime.borrow_foreign_object(obj)
                        # Extract named field values from the case instance.
                        for out_ptr, fname, ffi_type in zip(out_ptrs, fnames, ftypes, strict=True):
                            field_val = getattr(value, fname)
                            native_val = self._convert_to_ffi(field_val, ffi_type)
                            ctypes.cast(out_ptr, ctypes.POINTER(_ffi_ctypes_type(ffi_type)))[0] = native_val
                    except BaseException as error:
                        self._runtime.store_exception(exn, error)
                return extractor

            ext_cb = extractor_type(make_extractor(field_names, ffi_types_only))
            self._callbacks.append(ext_cb)
            callback_args.append(ext_cb)
            function_argtypes.append(ctypes.c_void_p)

        function_argtypes.append(ctypes.POINTER(ctypes.c_void_p))
        setup = self.get_iota_function(setup_symbol, restype=None, argtypes=function_argtypes)
        exn = ctypes.c_void_p()
        setup(ctypes.c_void_p(self.env), *callback_args, ctypes.byref(exn))
        self._runtime.raise_if_exception(exn.value)

    def release_native_ref(self, native_ref: int | None) -> None:
        """Release a native reference; called by weakref.finalize() in generated __init__."""
        if self._runtime is not None:
            self._runtime.release_native_reference(native_ref)

    def setup_protocol_type(
        self,
        setup_symbol: str,
        external_witness_cls: type[NativeReference],
        field_specs: list[tuple[str, str]],
        method_specs: list[tuple[str, list[str], str]],
    ) -> None:
        """Register a protocol type with the Iota ABI (both directions).

        Args:
            setup_symbol: The @_cdecl symbol name for the protocol's setup function.
            external_witness_cls: The ExternalWitness_* NativeReference subclass that wraps
                Swift-side protocol conformers when Swift passes them to Python.
            field_specs: List of (field_name, ffi_return_type) tuples for protocol properties.
            method_specs: List of (method_name, [param_ffi_types], return_ffi_type) tuples.
        """
        self.ensure_loaded()
        assert self._runtime is not None

        callback_args: list[typing.Any] = []
        # argtypes: env, constructor, per-field getter, per-method callback, exn
        function_argtypes: list[typing.Any] = [ctypes.c_void_p, ctypes.c_void_p]

        # constructor: (UnsafeMutableRawPointer, foreignOutExn) -> foreignObject
        # Called by Swift when it wants to hand a Swift-side protocol conformer to Python.
        # We wrap the opaque pointer in an ExternalWitness_* NativeReference instance.
        constructor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

        def constructor(pointer: int | None, exn: ctypes.POINTER(ctypes.c_void_p)) -> int:
            try:
                instance = external_witness_cls(
                    native_ref=int(pointer or 0),
                )
                return self._runtime.retain_foreign_object(instance)
            except BaseException as error:
                self._runtime.store_exception(exn, error)
                return 0

        ctor_cb = constructor_type(constructor)
        self._callbacks.append(ctor_cb)
        callback_args.append(ctor_cb)

        # Per-field getter: (foreignObject, foreignOutExn) -> CType
        # Called by Swift when it needs a field value from a Python-side protocol implementor.
        for field_name, ffi_return_type in field_specs:
            getter_type = ctypes.CFUNCTYPE(
                _ffi_ctypes_type(ffi_return_type), ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)
            )

            def make_getter(fname: str, ffi_ret: str) -> typing.Any:
                def getter(obj: int | None, exn: ctypes.POINTER(ctypes.c_void_p)) -> typing.Any:
                    try:
                        instance = self._runtime.borrow_foreign_object(obj)
                        return self._convert_to_ffi(getattr(instance, fname), ffi_ret)
                    except BaseException as error:
                        self._runtime.store_exception(exn, error)
                        return _ffi_default_value(ffi_ret)
                return getter

            getter_cb = getter_type(make_getter(field_name, ffi_return_type))
            self._callbacks.append(getter_cb)
            callback_args.append(getter_cb)
            function_argtypes.append(ctypes.c_void_p)

        # Per-method callback: (foreignObject, param_ctypes..., foreignOutExn) -> ReturnCType
        # Called by Swift when it invokes a method on a Python-side protocol implementor.
        for method_name, param_ffi_types, return_ffi_type in method_specs:
            param_ctypes = [_ffi_ctypes_type(t) for t in param_ffi_types]
            ret_ctype = None if return_ffi_type == "void" else _ffi_ctypes_type(return_ffi_type)
            method_type = ctypes.CFUNCTYPE(
                ret_ctype, ctypes.c_void_p, *param_ctypes, ctypes.POINTER(ctypes.c_void_p)
            )

            def make_method(mname: str, pffi: list[str], rffi: str) -> typing.Any:
                def method_cb(obj: int | None, *raw: typing.Any) -> typing.Any:
                    exn = raw[-1]
                    params = raw[:-1]
                    try:
                        instance = self._runtime.borrow_foreign_object(obj)
                        converted = [self._convert_from_ffi(v, t) for v, t in zip(params, pffi, strict=True)]
                        result = getattr(instance, mname)(*converted)
                        if rffi == "void":
                            return None
                        return self._convert_to_ffi(result, rffi)
                    except BaseException as error:
                        self._runtime.store_exception(exn, error)
                        return _ffi_default_value(rffi) if rffi != "void" else None
                return method_cb

            method_cb_obj = method_type(make_method(method_name, param_ffi_types, return_ffi_type))
            self._callbacks.append(method_cb_obj)
            callback_args.append(method_cb_obj)
            function_argtypes.append(ctypes.c_void_p)

        function_argtypes.append(ctypes.POINTER(ctypes.c_void_p))
        setup = self.get_iota_function(setup_symbol, restype=None, argtypes=function_argtypes)
        exn = ctypes.c_void_p()
        setup(ctypes.c_void_p(self.env), *callback_args, ctypes.byref(exn))
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
                    instance = self._runtime.borrow_foreign_object(obj)
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
                        instance = self._runtime.borrow_foreign_object(obj)
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
