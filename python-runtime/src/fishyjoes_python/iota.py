from __future__ import annotations

import ctypes
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Callable, Protocol, TypeAlias

import cffi

from .exceptions import FishyJoesError, NativeCallError, TypeMismatchError
from .runtime import ensure_cpython
from . import _native as _native_ext


# A single shared FFI instance for all Iota ABI operations.
_ffi = cffi.FFI()

# Base declarations needed before any library is loaded.
_ffi.cdef("""
    typedef unsigned char uint8_t;
    typedef unsigned short uint16_t;
    typedef unsigned int uint32_t;
    typedef unsigned long long uint64_t;
    typedef signed char int8_t;
    typedef short int16_t;
    typedef int int32_t;
    typedef long long int64_t;
    typedef size_t uintptr_t;
    typedef ssize_t intptr_t;
""")

# Public type aliases kept for compatibility with generated code.
ForeignObject: TypeAlias = Any  # cffi cdata void*
ForeignObjectPtr: TypeAlias = Any  # cffi cdata void**


def _decode_utf16_z(ptr: Any) -> str:
    if not ptr:
        return ""
    units: list[int] = []
    index = 0
    while True:
        unit = int(_ffi.cast("uint16_t*", ptr)[index])
        if unit == 0:
            break
        units.append(unit)
        index += 1
    raw = bytearray()
    for unit in units:
        raw.extend(unit.to_bytes(2, "little"))
    return raw.decode("utf-16-le")


def _borrow_python_value(handle: Any) -> object | None:
    """Return the Python object for *handle* without releasing it.

    *handle* may be an ``int``, a ``ctypes.c_void_p`` (from the ctypes
    compatibility shim), or a cffi cdata pointer.  ``None`` or zero means
    "no object".
    """
    if handle is None:
        return None
    # Unwrap ctypes.c_void_p wrapper produced by _CffiSymbolWrapper.
    if hasattr(handle, "value"):
        handle = handle.value
        if handle is None:
            return None
    if not handle:
        return None
    return _ffi.from_handle(_ffi.cast("void*", handle))


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
    """Shared host runtime for FishyJoes Python bindings, backed by cffi."""

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

        # Live Python-object handles: int address → cffi handle cdata.
        # Keeping the cdata alive keeps the Python object alive.
        self._handles: dict[int, Any] = {}

        # cffi callback objects must be kept alive.
        self._callbacks: list[Any] = []

        self._loaded = False

        self.iota_runtime_lib: Any = None
        self.module_lib: Any = None
        self.module_iota_lib: Any = None
        self.env: int | None = None

        # Error factory: called by _new_error to produce a Python exception from
        # a Swift error description string.  Defaults to NativeCallError but can
        # be replaced by generated modules to produce typed exceptions.
        self._error_factory: Callable[[str], BaseException] = NativeCallError

    def ensure_loaded(self) -> None:
        if self._loaded:
            return

        # Load shared libraries via cffi.
        mode = ctypes.RTLD_GLOBAL if hasattr(ctypes, "RTLD_GLOBAL") else 0
        self.iota_runtime_lib = _ffi.dlopen(str(self.iota_runtime_path))
        self.module_lib = _ffi.dlopen(str(self.module_path))
        self.module_iota_lib = _ffi.dlopen(str(self.module_iota_path))

        # Declare and call FishyJoesCommonRuntime_Env_setup.
        _ffi.cdef("""
            void* FishyJoesCommonRuntime_Env_setup(void*, void*, void*, void*, void*);
        """, override=True)

        env_cb_new_ref = _ffi.callback("void*(void*)", self._new_ref)
        env_cb_delete_ref = _ffi.callback("void(void*)", self._delete_ref)
        env_cb_new_error = _ffi.callback("void*(uint16_t*)", self._new_error)
        env_cb_describe = _ffi.callback("void*(void*)", self._describe)
        env_cb_schedule = _ffi.callback("void(void*, void*)", self._schedule_thread_work)
        self._callbacks.extend([env_cb_new_ref, env_cb_delete_ref, env_cb_new_error,
                                 env_cb_describe, env_cb_schedule])

        env_ptr = self.iota_runtime_lib.FishyJoesCommonRuntime_Env_setup(
            env_cb_new_ref,
            env_cb_delete_ref,
            env_cb_new_error,
            env_cb_describe,
            env_cb_schedule,
        )
        self.env = int(_ffi.cast("uintptr_t", env_ptr))

        self._setup_any_box()
        self._setup_core_converters()
        self._register_module_types()
        self._loaded = True

    def load_module_declarations(self, header_text: str) -> None:
        """cdef the module's _declarations.h into the shared _ffi instance.

        Must be called after ensure_loaded().  Subsequent call_symbol() calls on
        GeneratedRuntime will resolve symbols from the already-opened iota lib.
        """
        self._ensure_loaded()
        # Strip C preprocessor directives that cffi cannot parse.
        cleaned_lines = [
            line for line in header_text.splitlines()
            if not line.lstrip().startswith("#")
        ]
        cleaned = "\n".join(cleaned_lines)
        _ffi.cdef(cleaned, override=True)

    @property
    def iota_lib(self) -> Any:
        """The cffi library object for the module's iota dylib."""
        assert self.module_iota_lib is not None, "IotaRuntime not loaded yet"
        return self.module_iota_lib

    def retain_foreign_object(self, value: object) -> int:
        self._ensure_loaded()
        return self._retain(value)

    def release_foreign_object(self, handle: int | None) -> None:
        self._ensure_loaded()
        self._release(handle)

    def borrow_foreign_object(self, handle: int | None) -> object | None:
        """Return the Python object for *handle* without releasing it.

        Use this when Swift calls a getter/discriminator callback that must
        inspect the object but must NOT consume (release) the handle, since
        Swift still holds a reference.
        """
        self._ensure_loaded()
        return _borrow_python_value(handle)

    def consume_foreign_object(self, handle: int | None) -> object | None:
        self._ensure_loaded()
        value = _borrow_python_value(handle)
        self._release(handle)
        return value

    def raise_if_exception(self, handle: int | None) -> None:
        self._ensure_loaded()
        if handle:
            self._raise_exception_handle(handle)

    def store_exception(self, out_exn: Any, error: BaseException) -> None:
        self._ensure_loaded()
        self._set_exn(out_exn, error)

    def raise_native_error(self, message: str) -> None:
        raise NativeCallError(message)

    def register_error_factory(self, factory: Callable[[str], BaseException]) -> None:
        """Register a callable that converts a Swift error message string to a Python exception.

        The factory receives the Swift error's description string and should return
        a ``BaseException`` instance.  Use this to produce typed module-specific
        exceptions instead of the default ``NativeCallError``.

        Example::

            def my_factory(message: str) -> BaseException:
                if message.startswith("MyModule.MyError"):
                    return MyError(message)
                return NativeCallError(message)

            runtime.register_error_factory(my_factory)
        """
        self._error_factory = factory

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
        assert self.env is not None
        exn_holder = _ffi.new("void*[1]")
        self.iota_runtime_lib.FishyJoesCommonRuntime_AnyBox_releaseRef(
            _ffi.cast("void*", self.env),
            _ffi.cast("void*", native_ref),
            exn_holder,
        )
        exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
        if exn_val:
            self._raise_exception_handle(exn_val)

    def release_native_ref(self, native_ref: int | None) -> None:
        """Alias for release_native_reference; used by weakref.finalize()."""
        self.release_native_reference(native_ref)

    def describe_native_reference(self, native_ref: int | None) -> str:
        if native_ref is None:
            return "<null>"
        self._ensure_loaded()
        assert self.iota_runtime_lib is not None
        assert self.env is not None
        exn_holder = _ffi.new("void*[1]")
        result_ptr = self.iota_runtime_lib.FishyJoesCommonRuntime_AnyBox_toString(
            _ffi.cast("void*", self.env),
            _ffi.cast("void*", native_ref),
            exn_holder,
        )
        exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
        if exn_val:
            self._raise_exception_handle(exn_val)
        result_addr = int(_ffi.cast("uintptr_t", result_ptr))
        if not result_addr:
            return "<null description>"
        try:
            value = _borrow_python_value(result_addr)
            return str(value)
        finally:
            self._release(result_addr)

    # ------------------------------------------------------------------
    # Internal helpers
    # ------------------------------------------------------------------

    def _library(self, name: str) -> Any:
        if name == "iota_runtime":
            assert self.iota_runtime_lib is not None
            return self.iota_runtime_lib
        if name == "module":
            assert self.module_lib is not None
            return self.module_lib
        assert self.module_iota_lib is not None
        return self.module_iota_lib

    def _ensure_loaded(self) -> None:
        if not self._loaded:
            self.ensure_loaded()

    def _register_module_types(self) -> None:
        assert self.module_iota_lib is not None
        _ffi.cdef(f"void FishyJoes_{self.module_name}_registerTypes(void);", override=True)
        getattr(self.module_iota_lib, f"FishyJoes_{self.module_name}_registerTypes")()

    def _retain(self, value: object) -> int:
        """Retain a Python object and return its opaque handle address."""
        handle_cdata = _ffi.new_handle(value)
        addr = int(_ffi.cast("uintptr_t", handle_cdata))
        self._handles[addr] = handle_cdata
        return addr

    def _release(self, handle: int | None) -> None:
        """Release a previously retained Python object."""
        if handle is None:
            return
        # Unwrap ctypes.c_void_p (produced by the ctypes shim in runtime.py).
        if hasattr(handle, "value"):
            handle = handle.value
        if not handle:
            return
        # cffi cdata (e.g. void*) — convert to int via uintptr_t cast.
        if not isinstance(handle, int):
            try:
                handle = int(_ffi.cast("uintptr_t", handle))
            except TypeError:
                return
        self._handles.pop(handle, None)

    def _set_exn(self, out_exn: Any, error: BaseException) -> None:
        """Write an exception into a void** out-parameter.

        ``out_exn`` may be either a cffi ``void*[1]`` pointer or a ctypes
        ``POINTER(c_void_p)`` (when called from a ctypes CFUNCTYPE callback in
        the generated ``runtime.py``).  We handle both.
        """
        addr = self._retain(error)
        try:
            # cffi path: out_exn is a cdata void*[1]
            out_exn[0] = _ffi.cast("void*", addr)
        except TypeError:
            # ctypes path: out_exn is ctypes.POINTER(ctypes.c_void_p)
            import ctypes as _ctypes
            out_exn[0] = _ctypes.c_void_p(addr)

    def _raise_exception_handle(self, handle: int) -> None:
        value = _borrow_python_value(handle)
        self._release(handle)
        if isinstance(value, BaseException):
            raise value
        raise NativeCallError(str(value))

    def _new_ref(self, obj: Any) -> Any:
        addr = int(_ffi.cast("uintptr_t", obj))
        value = _borrow_python_value(addr)
        if value is None:
            return _ffi.NULL
        new_addr = self._retain(value)
        return _ffi.cast("void*", new_addr)

    def _delete_ref(self, obj: Any) -> None:
        addr = int(_ffi.cast("uintptr_t", obj))
        self._release(addr)

    def _new_error(self, message_ptr: Any) -> Any:
        addr_int = int(_ffi.cast("uintptr_t", message_ptr))
        message = _decode_utf16_z(message_ptr) if addr_int else ""
        error = self._error_factory(message)
        new_addr = self._retain(error)
        return _ffi.cast("void*", new_addr)

    def _describe(self, obj: Any) -> Any:
        addr = int(_ffi.cast("uintptr_t", obj))
        value = _borrow_python_value(addr)
        encoded = str(value).encode("utf-8")
        # Swift calls free() on the returned pointer, so we must allocate with
        # the C malloc that Swift's libc will free.  _native.malloc_copy_bytes
        # does exactly that: allocates via libc malloc, copies the bytes in,
        # and returns the address as a Python int.
        ptr_int = _native_ext.malloc_copy_bytes(encoded)
        return _ffi.cast("void*", ptr_int)

    def _schedule_thread_work(self, _env: Any, context: Any) -> None:
        ctx_int = int(_ffi.cast("uintptr_t", context))
        self._run_scheduled_work(ctx_int)

    def _run_scheduled_work(self, context: int) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None
        exn_holder = _ffi.new("void*[1]")
        self.iota_runtime_lib.FishyJoesCommonRuntime_runScheduledWork(
            _ffi.cast("void*", self.env),
            _ffi.cast("void*", context),
            exn_holder,
        )
        exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
        if exn_val:
            self._raise_exception_handle(exn_val)

    def _setup_any_box(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        @_ffi.callback("void*(void*, void**)")
        def anybox_constructor(ptr: Any, exn: Any) -> Any:
            try:
                ptr_int = int(_ffi.cast("uintptr_t", ptr))
                instance = self.make_native_reference(ptr_int or 0, "AnyBox")
                new_addr = self._retain(instance)
                return _ffi.cast("void*", new_addr)
            except BaseException as error:
                self._set_exn(exn, error)
                return _ffi.NULL

        @_ffi.callback("void*(void*, void**)")
        def anybox_ref_getter(obj: Any, exn: Any) -> Any:
            try:
                addr = int(_ffi.cast("uintptr_t", obj))
                value = _borrow_python_value(addr)
                native_ref = self.coerce_native_ref(value)
                if native_ref is None:
                    raise TypeError(f"expected native reference wrapper, got {_value_type_name(value)}")
                return _ffi.cast("void*", native_ref)
            except BaseException as error:
                self._set_exn(exn, error)
                return _ffi.NULL

        self._callbacks.extend([anybox_constructor, anybox_ref_getter])

        _ffi.cdef("""
            void FishyJoesCommonRuntime_AnyBox_setup(void* env, void* constructor, void* ref_getter);
            void FishyJoesCommonRuntime_AnyBox_releaseRef(void* env, void* ref, void** exn);
            void* FishyJoesCommonRuntime_AnyBox_toString(void* env, void* ref, void** exn);
        """, override=True)

        self.iota_runtime_lib.FishyJoesCommonRuntime_AnyBox_setup(
            _ffi.cast("void*", self.env),
            anybox_constructor,
            anybox_ref_getter,
        )

    def _setup_core_converters(self) -> None:
        self._setup_bool()
        self._setup_integers()
        self._setup_floats()
        self._setup_string()
        self._setup_data()
        self._setup_url()

    def _setup_bool(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        @_ffi.callback("uint8_t(void*, void**)")
        def bool_value(obj: Any, exn: Any) -> int:
            try:
                addr = int(_ffi.cast("uintptr_t", obj))
                return 1 if bool(_borrow_python_value(addr)) else 0
            except BaseException as error:
                self._set_exn(exn, error)
                return 0

        self._callbacks.append(bool_value)

        _ffi.cdef("""
            void Swift_Bool_setup(void* env, void* true_obj, void* false_obj, void* value_fn);
        """, override=True)

        true_addr = self._retain(True)
        false_addr = self._retain(False)
        self.iota_runtime_lib.Swift_Bool_setup(
            _ffi.cast("void*", self.env),
            _ffi.cast("void*", true_addr),
            _ffi.cast("void*", false_addr),
            bool_value,
        )

    def _integer_value(self, obj: Any, exn: Any) -> int:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = _borrow_python_value(addr)
            return int(value if value is not None else 0)
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _integer_constructor(self, value: int) -> Any:
        addr = self._retain(int(value))
        return _ffi.cast("void*", addr)

    def _unsigned_constructor(self, value: int) -> Any:
        addr = self._retain(int(value))
        return _ffi.cast("void*", addr)

    def _setup_integers(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        signed_value_cb = _ffi.callback("intptr_t(void*, void**)", self._integer_value)
        unsigned_value_cb = _ffi.callback("uintptr_t(void*, void**)", self._integer_value)
        signed_ctor_cb = _ffi.callback("void*(intptr_t)", self._integer_constructor)
        unsigned_ctor_cb = _ffi.callback("void*(uintptr_t)", self._unsigned_constructor)
        self._callbacks.extend([signed_value_cb, unsigned_value_cb, signed_ctor_cb, unsigned_ctor_cb])

        for symbol in [
            "Swift_Int8_setup", "Swift_Int16_setup", "Swift_Int32_setup",
            "Swift_Int64_setup", "Swift_Int_setup",
        ]:
            _ffi.cdef(f"void {symbol}(void* env, void* value_fn, void* ctor_fn);", override=True)
            getattr(self.iota_runtime_lib, symbol)(
                _ffi.cast("void*", self.env), signed_value_cb, signed_ctor_cb
            )

        for symbol in [
            "Swift_UInt8_setup", "Swift_UInt16_setup", "Swift_UInt32_setup",
            "Swift_UInt64_setup", "Swift_UInt_setup",
        ]:
            _ffi.cdef(f"void {symbol}(void* env, void* value_fn, void* ctor_fn);", override=True)
            getattr(self.iota_runtime_lib, symbol)(
                _ffi.cast("void*", self.env), unsigned_value_cb, unsigned_ctor_cb
            )

    def _float_value(self, obj: Any, exn: Any) -> float:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            return float(_borrow_python_value(addr) or 0.0)
        except BaseException as error:
            self._set_exn(exn, error)
            return 0.0

    def _float_constructor(self, value: float) -> Any:
        addr = self._retain(float(value))
        return _ffi.cast("void*", addr)

    def _setup_floats(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        float_value_cb = _ffi.callback("float(void*, void**)", self._float_value)
        double_value_cb = _ffi.callback("double(void*, void**)", self._float_value)
        float_ctor_cb = _ffi.callback("void*(float)", self._float_constructor)
        double_ctor_cb = _ffi.callback("void*(double)", self._float_constructor)
        self._callbacks.extend([float_value_cb, double_value_cb, float_ctor_cb, double_ctor_cb])

        _ffi.cdef("""
            void Swift_Float_setup(void* env, void* value_fn, void* ctor_fn);
            void Swift_Double_setup(void* env, void* value_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Swift_Float_setup(
            _ffi.cast("void*", self.env), float_value_cb, float_ctor_cb
        )
        self.iota_runtime_lib.Swift_Double_setup(
            _ffi.cast("void*", self.env), double_value_cb, double_ctor_cb
        )

    def _string_byte_length(self, obj: Any, exn: Any) -> int:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = str(_borrow_python_value(addr) or "")
            return len(value.encode("utf-8"))
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _string_utf8_fill(self, obj: Any, out_buf: Any, exn: Any) -> None:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = str(_borrow_python_value(addr) or "")
            encoded = value.encode("utf-8")
            _ffi.memmove(out_buf, encoded, len(encoded))
        except BaseException as error:
            self._set_exn(exn, error)

    def _string_utf8_constructor(self, in_bytes: Any, length: int, exn: Any) -> Any:
        try:
            raw = bytes(_ffi.buffer(in_bytes, int(length)))
            text = raw.decode("utf-8")
            addr = self._retain(text)
            return _ffi.cast("void*", addr)
        except BaseException as error:
            self._set_exn(exn, error)
            return _ffi.NULL

    def _setup_string(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        byte_len_cb = _ffi.callback("intptr_t(void*, void**)", self._string_byte_length)
        utf8_fill_cb = _ffi.callback("void(void*, char*, void**)", self._string_utf8_fill)
        utf8_ctor_cb = _ffi.callback("void*(char*, intptr_t, void**)", self._string_utf8_constructor)
        self._callbacks.extend([byte_len_cb, utf8_fill_cb, utf8_ctor_cb])

        _ffi.cdef("""
            void Swift_String_utf8_setup(void* env, void* byte_len_fn, void* fill_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Swift_String_utf8_setup(
            _ffi.cast("void*", self.env), byte_len_cb, utf8_fill_cb, utf8_ctor_cb
        )

    def _data_length(self, obj: Any, exn: Any) -> int:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            return len(bytes(_borrow_python_value(addr) or b""))
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _data_bytes(self, obj: Any, out_values: Any, exn: Any) -> None:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = bytes(_borrow_python_value(addr) or b"")
            if value:
                _ffi.memmove(out_values, value, len(value))
        except BaseException as error:
            self._set_exn(exn, error)

    def _data_constructor(self, data_ptr: Any, length: int, exn: Any) -> Any:
        try:
            raw = bytes(_ffi.buffer(data_ptr, int(length)))
            addr = self._retain(raw)
            return _ffi.cast("void*", addr)
        except BaseException as error:
            self._set_exn(exn, error)
            return _ffi.NULL

    def _setup_data(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        len_cb = _ffi.callback("int32_t(void*, void**)", self._data_length)
        bytes_cb = _ffi.callback("void(void*, void*, void**)", self._data_bytes)
        ctor_cb = _ffi.callback("void*(void*, int32_t, void**)", self._data_constructor)
        self._callbacks.extend([len_cb, bytes_cb, ctor_cb])

        _ffi.cdef("""
            void Foundation_Data_setup(void* env, void* len_fn, void* bytes_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Foundation_Data_setup(
            _ffi.cast("void*", self.env), len_cb, bytes_cb, ctor_cb
        )

    def _url_absolute_uri(self, obj: Any, exn: Any) -> Any:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = str(_borrow_python_value(addr) or "")
            new_addr = self._retain(value)
            return _ffi.cast("void*", new_addr)
        except BaseException as error:
            self._set_exn(exn, error)
            return _ffi.NULL

    def _url_constructor(self, string_ref: Any, exn: Any) -> Any:
        try:
            addr = int(_ffi.cast("uintptr_t", string_ref))
            value = str(_borrow_python_value(addr) or "")
            new_addr = self._retain(value)
            return _ffi.cast("void*", new_addr)
        except BaseException as error:
            self._set_exn(exn, error)
            return _ffi.NULL

    def _setup_url(self) -> None:
        assert self.iota_runtime_lib is not None
        assert self.env is not None

        uri_cb = _ffi.callback("void*(void*, void**)", self._url_absolute_uri)
        ctor_cb = _ffi.callback("void*(void*, void**)", self._url_constructor)
        self._callbacks.extend([uri_cb, ctor_cb])

        _ffi.cdef("""
            void Foundation_URL_setup(void* env, void* uri_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Foundation_URL_setup(
            _ffi.cast("void*", self.env), uri_cb, ctor_cb
        )

