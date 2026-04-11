"""Runtime helpers for FishyJoes-generated Python bindings."""

from __future__ import annotations

import ctypes
import importlib.resources
import platform
import typing

import cffi as _cffi_module

from fishyjoes_python.iota import IotaRuntime, NativeReference as _SharedNativeReference
from fishyjoes_python.loader import load_shared_library

_ffi = _cffi_module.FFI()

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
        self._callbacks: list[object] = []
        self._symbol_cache: dict[str, typing.Any] = {}

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

        # Load the module's C declarations so cffi knows every iota symbol's
        # signature — enabling direct calls without runtime cdef overhead.
        try:
            pkg_files = importlib.resources.files(self.package)
            header_text = (pkg_files / "_declarations.h").read_text(encoding="utf-8")
            self._runtime.load_module_declarations(header_text)
        except (FileNotFoundError, ModuleNotFoundError, TypeError):
            pass  # declarations file optional; symbols still callable via void* cast

    @property
    def env(self) -> int:
        self.ensure_loaded()
        assert self._runtime is not None
        assert self._runtime.env is not None
        return self._runtime.env

    def call_symbol(self, symbol: str, return_type: str, *args: tuple[str, typing.Any]) -> typing.Any:
        """Call an iota ABI symbol directly via cffi.

        Each element of *args* is a (ffi_type_name, python_value) pair.
        The env pointer is prepended automatically; the exn out-param is
        appended automatically.
        """
        self.ensure_loaded()
        assert self._runtime is not None

        lib = self._runtime.iota_lib
        fn = self._symbol_cache.get(symbol)
        if fn is None:
            fn = getattr(lib, symbol)
            self._symbol_cache[symbol] = fn

        retained_handles: list[int] = []
        exn_holder = _ffi.new("void*[1]")
        call_args: list[typing.Any] = [_ffi.cast("void*", self.env)]

        try:
            for ffi_name, value in args:
                if ffi_name == "object":
                    if value is None:
                        call_args.append(_ffi.NULL)
                    else:
                        # Wrap Python object in a cffi handle so Swift can call
                        # back via anybox_ref_getter to extract native pointer or
                        # object fields.
                        handle = self._runtime.retain_foreign_object(value)
                        retained_handles.append(handle)
                        call_args.append(_ffi.cast("void*", handle))
                elif ffi_name == "bool":
                    call_args.append(1 if value else 0)
                else:
                    call_args.append(value)

            call_args.append(exn_holder)
            result = fn(*call_args)
            exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
            if exn_val:
                self._runtime.raise_if_exception(exn_val)
            return self._convert_return(result, return_type)
        finally:
            for handle in retained_handles:
                self._runtime.release_foreign_object(handle)

    def _invoke_setup(self, setup_symbol: str, *callback_args: typing.Any) -> None:
        """Call a setup symbol via cffi, converting ctypes callbacks to void* pointers."""
        assert self._runtime is not None
        lib = self._runtime.iota_lib
        fn = self._symbol_cache.get(setup_symbol)
        if fn is None:
            fn = getattr(lib, setup_symbol)
            self._symbol_cache[setup_symbol] = fn
        exn_holder = _ffi.new("void*[1]")
        cffi_args: list[typing.Any] = [_ffi.cast("void*", self.env)]
        for cb in callback_args:
            raw = ctypes.cast(cb, ctypes.c_void_p).value
            cffi_args.append(_ffi.cast("void*", raw) if raw is not None else _ffi.NULL)
        cffi_args.append(exn_holder)
        fn(*cffi_args)
        exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
        if exn_val:
            self._runtime.raise_if_exception(exn_val)

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
        self._invoke_setup(setup_symbol, callback)

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

        self._invoke_setup(setup_symbol, *callback_args)

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

        self._invoke_setup(setup_symbol, *callback_args)

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

        self._invoke_setup(setup_symbol, *callback_args)

    def _encode_utf16_name(self, name: str) -> typing.Any:
        """Encode *name* as a null-terminated UTF-16-LE buffer and return a cffi cdata pointer."""
        encoded = (name + "\x00").encode("utf-16-le")
        buf = _ffi.new(f"uint16_t[{len(encoded) // 2}]")
        for i, unit in enumerate(memoryview(encoded).cast("H")):
            buf[i] = unit
        return buf

    def _invoke_generic_setup(self, setup_symbol: str, converter_name: str, *callback_args: typing.Any) -> None:
        """Call a generic (collection/tuple/result/function/future) setup symbol.

        Passes the converter type name as a null-terminated UTF-16 string (the
        first argument after env), followed by the given ctypes callbacks as
        void* pointers, and finally an exn out-parameter.
        """
        assert self._runtime is not None
        lib = self._runtime.iota_lib
        fn = self._symbol_cache.get(setup_symbol)
        if fn is None:
            fn = getattr(lib, setup_symbol)
            self._symbol_cache[setup_symbol] = fn
        exn_holder = _ffi.new("void*[1]")
        name_buf = self._encode_utf16_name(converter_name)
        cffi_args: list[typing.Any] = [_ffi.cast("void*", self.env), _ffi.cast("unsigned short*", name_buf)]
        for cb in callback_args:
            if cb is None:
                cffi_args.append(_ffi.NULL)
            else:
                raw = ctypes.cast(cb, ctypes.c_void_p).value
                cffi_args.append(_ffi.cast("void*", raw) if raw is not None else _ffi.NULL)
        cffi_args.append(exn_holder)
        fn(*cffi_args)
        exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
        if exn_val:
            self._runtime.raise_if_exception(exn_val)

    def _invoke_generic_setup_no_exn(self, setup_symbol: str, converter_name: str, *callback_args: typing.Any) -> None:
        """Like _invoke_generic_setup but for setup symbols that have no exn parameter (Tuple, Result)."""
        assert self._runtime is not None
        lib = self._runtime.iota_lib
        fn = self._symbol_cache.get(setup_symbol)
        if fn is None:
            fn = getattr(lib, setup_symbol)
            self._symbol_cache[setup_symbol] = fn
        name_buf = self._encode_utf16_name(converter_name)
        cffi_args: list[typing.Any] = [_ffi.cast("void*", self.env), _ffi.cast("unsigned short*", name_buf)]
        for cb in callback_args:
            if cb is None:
                cffi_args.append(_ffi.NULL)
            else:
                raw = ctypes.cast(cb, ctypes.c_void_p).value
                cffi_args.append(_ffi.cast("void*", raw) if raw is not None else _ffi.NULL)
        fn(*cffi_args)

    def setup_collection_type(
        self,
        converter_name: str,
        element_ffi_type: str,
    ) -> None:
        """Register a collection (Array/Set) type with the Iota ABI.

        Args:
            converter_name: The converter type name (e.g. ``ArrayConverter<StringConverter>``),
                used as the lookup key on the Swift side.
            element_ffi_type: FFI type string for elements (e.g. ``"object"``, ``"int"``).
        """
        self.ensure_loaded()
        assert self._runtime is not None

        elem_ctype = _ffi_ctypes_type(element_ffi_type)

        # length_fn: (context, array, exn) -> int32_t
        # c_int is the 32-bit signed integer type in ctypes (matches Swift Int32).
        length_type = ctypes.CFUNCTYPE(ctypes.c_int, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))
        # values_fn: (context, array, out_values, exn) -> void
        values_type = ctypes.CFUNCTYPE(None, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))
        # constructor_fn: (context, in_values, length, exn) -> foreignObject
        ctor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_int, ctypes.POINTER(ctypes.c_void_p))

        runtime = self._runtime

        def length_fn(ctx: int, obj: int, exn: typing.Any) -> int:
            try:
                value = runtime.borrow_foreign_object(obj)
                return len(value) if value is not None else 0
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        def values_fn(ctx: int, obj: int, out_values: int, exn: typing.Any) -> None:
            try:
                value = runtime.borrow_foreign_object(obj)
                items = list(value) if value is not None else []
                ptr = _ffi.cast("void**", out_values)
                for i, item in enumerate(items):
                    handle = runtime.retain_foreign_object(item)
                    ptr[i] = _ffi.cast("void*", handle)
            except BaseException as error:
                runtime.store_exception(exn, error)

        def ctor_fn(ctx: int, in_values: int, length: int, exn: typing.Any) -> int:
            try:
                ptr = _ffi.cast("void**", in_values)
                items = [
                    runtime.consume_foreign_object(ptr[i])
                    for i in range(int(length))
                ]
                handle = runtime.retain_foreign_object(items)
                return handle
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        len_cb = length_type(length_fn)
        val_cb = values_type(values_fn)
        ctor_cb = ctor_type(ctor_fn)
        self._callbacks.extend([len_cb, val_cb, ctor_cb])
        self._invoke_generic_setup(
            "FishyJoesCommonRuntime_collection_setup",
            converter_name,
            len_cb, val_cb, ctor_cb, None,
        )

    def setup_dictionary_type(
        self,
        converter_name: str,
    ) -> None:
        """Register a Dictionary type with the Iota ABI.

        Dictionaries are represented on the Python side as dicts.
        On the Iota ABI they are collections of key-value pair tuples, so we
        use two separate collection registrations (keys + values) under the hood.
        Instead, FishyJoes uses a single collection whose elements are opaque
        boxed pairs that the Swift side provides.  We represent the dictionary as
        a plain ``list`` at the collection level and rely on post-processing in
        the generated bindings.

        In practice the Iota ABI treats ``DictionaryConverter`` the same as
        ``ArrayConverter``  — both go through ``FishyJoesCommonRuntime_collection_setup``
        with element type ``object``.
        """
        self.setup_collection_type(converter_name, "object")

    def setup_tuple_type(
        self,
        converter_name: str,
        arity: int,
    ) -> None:
        """Register a tuple type with the Iota ABI.

        Args:
            converter_name: The converter type name (e.g. ``Tuple2Converter<StringConverter, IntConverter>``).
            arity: Number of elements in the tuple (2–6).
        """
        self.ensure_loaded()
        assert self._runtime is not None

        runtime = self._runtime

        # get_N callbacks: (context, tuple_obj, exn) -> foreignObject
        get_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

        get_callbacks: list[typing.Any] = []
        for i in range(arity):
            def make_get(index: int) -> typing.Any:
                def get_fn(ctx: int, obj: int, exn: typing.Any) -> int:
                    try:
                        tup = runtime.borrow_foreign_object(obj)
                        item = tup[index]
                        return runtime.retain_foreign_object(item)
                    except BaseException as error:
                        runtime.store_exception(exn, error)
                        return 0
                return get_type(get_fn)
            cb = make_get(i)
            get_callbacks.append(cb)
            self._callbacks.append(cb)

        # Pad to 6 slots with NULL (TupleConverter_setup expects exactly 6 get methods, nullable)
        null_cbs: list[typing.Any] = [None] * (6 - arity)

        # constructor: (context, values_ptr, exn) -> foreignObject
        ctor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

        def ctor_fn(ctx: int, values_ptr: int, exn: typing.Any) -> int:
            try:
                ptr = _ffi.cast("void**", values_ptr)
                items = [runtime.consume_foreign_object(ptr[i]) for i in range(arity)]
                tup = tuple(items)
                return runtime.retain_foreign_object(tup)
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        ctor_cb = ctor_type(ctor_fn)
        self._callbacks.append(ctor_cb)

        # TupleConverter_setup has no exn parameter and requires a trailing context argument.
        # Build the call manually: env, name, get0..get5 (nullable), ctor, context.
        assert self._runtime is not None
        lib = self._runtime.iota_lib
        fn = getattr(lib, "FishyJoesCommonRuntime_TupleConverter_setup")
        name_buf = self._encode_utf16_name(converter_name)
        cffi_args: list[typing.Any] = [_ffi.cast("void*", self.env), _ffi.cast("unsigned short*", name_buf)]
        for cb in get_callbacks + null_cbs:
            if cb is None:
                cffi_args.append(_ffi.NULL)
            else:
                raw = ctypes.cast(cb, ctypes.c_void_p).value
                cffi_args.append(_ffi.cast("void*", raw) if raw is not None else _ffi.NULL)
        raw_ctor = ctypes.cast(ctor_cb, ctypes.c_void_p).value
        cffi_args.append(_ffi.cast("void*", raw_ctor) if raw_ctor is not None else _ffi.NULL)
        # context: pass env (unused on the Python side, but required by the ABI).
        cffi_args.append(_ffi.cast("void*", self.env))
        fn(*cffi_args)

    def setup_result_type(
        self,
        converter_name: str,
    ) -> None:
        """Register a Result<Success, Failure> type with the Iota ABI.

        On the Python side, results are represented as either the success value
        or an exception.  The Iota ABI passes (isSuccess: UInt8, contents: foreignObject).
        """
        self.ensure_loaded()
        assert self._runtime is not None

        runtime = self._runtime

        # get_contents_fn: (context, result_obj, out_is_success, exn) -> foreignObject (contents)
        get_contents_type = ctypes.CFUNCTYPE(
            ctypes.c_void_p,
            ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)
        )

        def get_contents_fn(ctx: int, obj: int, out_is_success: int, exn: typing.Any) -> int:
            try:
                value = runtime.borrow_foreign_object(obj)
                # Python representation: (True, success_value) or (False, error_value)
                if isinstance(value, tuple) and len(value) == 2:
                    is_success, contents = value
                elif isinstance(value, BaseException):
                    is_success, contents = False, value
                else:
                    is_success, contents = True, value
                flag_ptr = _ffi.cast("uint8_t*", out_is_success)
                flag_ptr[0] = 1 if is_success else 0
                return runtime.retain_foreign_object(contents)
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        # constructor_fn: (context, is_success, contents, exn) -> foreignObject
        ctor_type = ctypes.CFUNCTYPE(
            ctypes.c_void_p,
            ctypes.c_void_p, ctypes.c_uint8, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)
        )

        def ctor_fn(ctx: int, is_success: int, contents: int, exn: typing.Any) -> int:
            try:
                contents_val = runtime.consume_foreign_object(contents)
                result = (bool(is_success), contents_val)
                return runtime.retain_foreign_object(result)
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        gc_cb = get_contents_type(get_contents_fn)
        ctor_cb = ctor_type(ctor_fn)
        self._callbacks.extend([gc_cb, ctor_cb])
        # ResultConverter_setup has no exn parameter — use _invoke_generic_setup_no_exn.
        self._invoke_generic_setup_no_exn(
            "FishyJoesCommonRuntime_ResultConverter_setup",
            converter_name,
            gc_cb, ctor_cb, None,
        )

    def setup_function_type(
        self,
        converter_name: str,
        arity: int,
    ) -> None:
        """Register a function type with the Iota ABI.

        Args:
            converter_name: The converter type name (e.g. ``Function1Converter<IntConverter, StringConverter>``).
            arity: Number of parameters (0–6).
        """
        self.ensure_loaded()
        assert self._runtime is not None

        runtime = self._runtime

        # constructor_fn: (context, opaque_ref, exn) -> foreignObject
        # Called when Swift wraps a Swift-side closure to pass to Python.
        # We create a Python callable that invokes the Swift closure via the invoke method.
        ctor_type = ctypes.CFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p))

        def ctor_fn(ctx: int, opaque_ref: int, exn: typing.Any) -> int:
            try:
                # Wrap the opaque Swift function ref in a Python callable.
                # The callable will use invoke_fn to call into Swift.
                swift_ref = opaque_ref  # retain as int

                def swift_callable(*args: typing.Any) -> typing.Any:
                    raise NotImplementedError(
                        f"Swift-side closures of type {converter_name!r} cannot be called from Python yet."
                    )

                handle = runtime.retain_foreign_object(swift_callable)
                return handle
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        # invoke_fn: (context, fn_obj, args_ptr, exn) -> foreignObject
        # Called when Swift invokes a Python-side callable.
        invoke_type = ctypes.CFUNCTYPE(
            ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_void_p, ctypes.POINTER(ctypes.c_void_p)
        )

        def invoke_fn(ctx: int, fn_obj: int, args_ptr: int, exn: typing.Any) -> int:
            try:
                callable_val = runtime.borrow_foreign_object(fn_obj)
                if args_ptr and arity > 0:
                    ptr = _ffi.cast("void**", args_ptr)
                    args = [runtime.consume_foreign_object(ptr[i]) for i in range(arity)]
                else:
                    args = []
                result = callable_val(*args)
                return runtime.retain_foreign_object(result)
            except BaseException as error:
                runtime.store_exception(exn, error)
                return 0

        ctor_cb = ctor_type(ctor_fn)
        invoke_cb = invoke_type(invoke_fn)
        self._callbacks.extend([ctor_cb, invoke_cb])
        self._invoke_generic_setup(
            "FishyJoesCommonRuntime_FunctionConverter_setup",
            converter_name,
            ctor_cb, invoke_cb, None,
        )

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
