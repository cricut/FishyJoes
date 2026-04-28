"""IotaRuntime — the cffi-backed shared host runtime.

Internal to the ``fishyjoes_python.iota`` package.  Re-exported from
``fishyjoes_python.iota`` so existing imports continue to work
unchanged after the file split.
"""

from __future__ import annotations

import logging
from collections.abc import Callable
from pathlib import Path
from typing import Any

from .. import _native as _native_ext
from ..exceptions import (
    FishyJoesError,
    NativeCallError,
    NotImplementedInNativeError,
)
from ..runtime import ensure_cpython
from ._ffi import _cdef, _ffi
from ._handles import (
    IotaHandle,
    IotaReference,
    NativeReference,
    _as_handle,
    _borrow_python_value,
    _decode_utf16_z,
    _require_not_none,
    _value_type_name,
)

_log = logging.getLogger("fishyjoes")


class IotaRuntime:
    """Shared host runtime for FishyJoes Python bindings, backed by cffi."""

    def __init__(
        self,
        *,
        iota_runtime_path: Path,
        module_path: Path,
        module_iota_path: Path,
        module_name: str,
        strict_thread_scheduling: bool = False,
    ) -> None:
        ensure_cpython()
        self.iota_runtime_path = Path(iota_runtime_path)
        self.module_path = Path(module_path)
        self.module_iota_path = Path(module_iota_path)
        self.module_name = module_name

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

        # Threading: see python-runtime/README.non-goals.md.  The runtime does
        # not own a real thread executor.  When ``strict_thread_scheduling`` is
        # False (default), the inline path is used and a one-time WARNING is
        # logged so the limitation is audible.  When True, every schedule
        # callback raises NotImplementedInNativeError so callers that require
        # off-thread execution fail fast.
        self.strict_thread_scheduling = strict_thread_scheduling
        self._thread_schedule_warning_emitted = False

    def ensure_loaded(self) -> None:
        if self._loaded:
            return
        _log.info("ensure_loaded: bootstrapping IotaRuntime for module %r",
                  self.module_name)
        self._open_libraries()
        self._setup_env()
        self._declare_runtime_attributed_string_symbols()
        self._setup_any_box()
        self._setup_runtime_attributed_string_references()
        self._setup_core_converters()
        self._register_module_types()
        self._loaded = True
        _log.debug("ensure_loaded: %r ready (%d callbacks pinned)",
                   self.module_name, len(self._callbacks))

    def _open_libraries(self) -> None:
        _log.debug("_open_libraries: iota_runtime=%s module=%s module_iota=%s",
                   self.iota_runtime_path, self.module_path,
                   self.module_iota_path)
        self.iota_runtime_lib = _ffi.dlopen(str(self.iota_runtime_path))
        self.module_lib = _ffi.dlopen(str(self.module_path))
        self.module_iota_lib = _ffi.dlopen(str(self.module_iota_path))

    def _setup_env(self) -> None:
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _cdef("""
            void* FishyJoesCommonRuntime_Env_setup(void*, void*, void*, void*, void*);
            void FishyJoesCommonRuntime_runScheduledWork(void* env, void* context, void** exn);
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
        _cdef(cleaned, override=True)

    def _declare_runtime_attributed_string_symbols(self) -> None:
        _cdef("""
            void* __iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(void*, void**);
            void __iota_FishyJoesCommonRuntime_AttributeContainer_merge(void*, void*, void*, uint8_t, void**);
            uint8_t __iota_FishyJoesCommonRuntime_AttributeContainer_equals(void*, void*, void*, void**);
            int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(void*, void*, void**);

            void* __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(void*, void**);
            void* __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(void*, void*, void**);
            void* __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer(void*, void*, void**);
            uint8_t __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(void*, void*, void*, void**);
            int32_t __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(void*, void*, void**);
            void* __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(void*, void*, void**);
            void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(void*, void*, void*, void**);
            void* __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(void*, void*, void**);
            void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(void*, void*, void*, void**);

            void* __iota_Foundation_AttributedString_createEmpty(void*, void**);
            void* __iota_Foundation_AttributedString_create(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_createFromSubstring(void*, void*, void**);
            uint8_t __iota_Foundation_AttributedString_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedString_hash(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_string(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_startIndex(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_endIndex(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_substring(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_runs(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_characters(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_unicodeScalars(void*, void*, void**);
            void* __iota_Foundation_AttributedString_substringForRange(void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_append(void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_appendSubstring(void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_insert(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_insertSubstring(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_replaceSubrange(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_replaceSubrangeWithSubstring(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_removeSubrange(void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_setAttributes(void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_setAttributesForRange(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_mergeAttributes(void*, void*, void*, uint8_t, void**);
            void __iota_Foundation_AttributedString_mergeAttributesForRange(void*, void*, void*, void*, uint8_t, void**);
            void __iota_Foundation_AttributedString_replaceAttributes(void*, void*, void*, void*, void**);
            void __iota_Foundation_AttributedString_replaceAttributesForRange(void*, void*, void*, void*, void*, void**);

            uint8_t __iota_Foundation_AttributedString_Index_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedString_Index_hash(void*, void*, void**);

            void* __iota_get_Foundation_AttributedString_Runs_startIndex(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_Runs_endIndex(void*, void*, void**);
            void* __iota_Foundation_AttributedString_Runs_indexAfter(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_Runs_indexBefore(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_Runs_elementAt(void*, void*, void*, void**);
            uint8_t __iota_Foundation_AttributedString_Runs_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedString_Runs_hash(void*, void*, void**);
            uint8_t __iota_Foundation_AttributedString_Runs_Index_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedString_Runs_Index_hash(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_Runs_Run_range(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_Runs_Run_attributes(void*, void*, void**);
            uint8_t __iota_Foundation_AttributedString_Runs_Run_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedString_Runs_Run_hash(void*, void*, void**);

            void* __iota_get_Foundation_AttributedString_CharacterView_startIndex(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_CharacterView_endIndex(void*, void*, void**);
            void* __iota_Foundation_AttributedString_CharacterView_indexAfter(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_CharacterView_indexBefore(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_CharacterView_elementAt(void*, void*, void*, void**);

            void* __iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex(void*, void*, void**);
            void* __iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex(void*, void*, void**);
            void* __iota_Foundation_AttributedString_UnicodeScalarView_indexAfter(void*, void*, void*, void**);
            void* __iota_Foundation_AttributedString_UnicodeScalarView_indexBefore(void*, void*, void*, void**);
            uint32_t __iota_Foundation_AttributedString_UnicodeScalarView_elementAt(void*, void*, void*, void**);

            void* __iota_get_Foundation_AttributedSubstring_base(void*, void*, void**);
            void* __iota_get_Foundation_AttributedSubstring_string(void*, void*, void**);
            void* __iota_Foundation_AttributedSubstring_substringForRange(void*, void*, void*, void**);
            uint8_t __iota_Foundation_AttributedSubstring_equals(void*, void*, void*, void**);
            int32_t __iota_get_Foundation_AttributedSubstring_hash(void*, void*, void**);

            void FishyJoesCommonRuntime_AttributeContainer_setup(void*, void*, void**);
            void FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup(void*, void*, void**);
            void Foundation_AttributedString_setup(void*, void*, void**);
            void Foundation_AttributedString_Index_setup(void*, void*, void**);
            void Foundation_AttributedSubstring_setup(void*, void*, void**);
            void Foundation_AttributedString_Runs_setup(void*, void*, void**);
            void Foundation_AttributedString_Runs_Index_setup(void*, void*, void**);
            void Foundation_AttributedString_Runs_Run_setup(void*, void*, void**);
            void Foundation_AttributedString_CharacterView_setup(void*, void*, void**);
            void Foundation_AttributedString_UnicodeScalarView_setup(void*, void*, void**);
        """, override=True)

    def _setup_runtime_attributed_string_references(self) -> None:
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")
        from ..attributed_string import (
            AttributeContainer,
            AttributeContainerFoundationAttributes,
            AttributedString,
            AttributedStringCharacterView,
            AttributedStringIndex,
            AttributedStringRun,
            AttributedStringRuns,
            AttributedStringRunsIndex,
            AttributedStringUnicodeScalarView,
            AttributedSubstring,
        )

        registrations: tuple[tuple[str, type[NativeReference], str], ...] = (
            ("FishyJoesCommonRuntime_AttributeContainer_setup", AttributeContainer, "AttributeContainer"),
            (
                "FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_setup",
                AttributeContainerFoundationAttributes,
                "AttributeContainer.FoundationAttributes",
            ),
            ("Foundation_AttributedString_setup", AttributedString, "AttributedString"),
            ("Foundation_AttributedString_Index_setup", AttributedStringIndex, "AttributedString.Index"),
            ("Foundation_AttributedSubstring_setup", AttributedSubstring, "AttributedSubstring"),
            ("Foundation_AttributedString_Runs_setup", AttributedStringRuns, "AttributedString.Runs"),
            ("Foundation_AttributedString_Runs_Index_setup", AttributedStringRunsIndex, "AttributedString.Runs.Index"),
            ("Foundation_AttributedString_Runs_Run_setup", AttributedStringRun, "AttributedString.Runs.Run"),
            ("Foundation_AttributedString_CharacterView_setup", AttributedStringCharacterView, "AttributedString.CharacterView"),
            (
                "Foundation_AttributedString_UnicodeScalarView_setup",
                AttributedStringUnicodeScalarView,
                "AttributedString.UnicodeScalarView",
            ),
        )

        for setup_symbol, cls, native_type in registrations:
            @_ffi.callback("void*(void*, void**)")
            def constructor(ptr: Any, exn: Any, cls: type[NativeReference] = cls, native_type: str = native_type) -> Any:
                try:
                    ptr_int = int(_ffi.cast("uintptr_t", ptr))
                    instance = cls(native_ref=ptr_int or 0, native_type=native_type, _runtime=self)
                    return _ffi.cast("void*", self._retain(instance))
                except BaseException as error:
                    self._set_exn(exn, error)
                    return _ffi.NULL

            self._callbacks.append(constructor)
            exn_holder = _ffi.new("void*[1]")
            getattr(self.iota_runtime_lib, setup_symbol)(
                _ffi.cast("void*", self.env),
                constructor,
                exn_holder,
            )
            exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
            if exn_val:
                self._raise_exception_handle(exn_val)

    @property
    def iota_lib(self) -> Any:
        """The cffi library object for the module's iota dylib."""
        if self.module_iota_lib is None:
            raise FishyJoesError("IotaRuntime not loaded yet")
        return self.module_iota_lib

    def call_runtime_symbol(
        self,
        symbol: str,
        return_type: str,
        *args: tuple[str, Any],
    ) -> Any:
        """Call a symbol exported by libFishyJoesIotaRuntime."""
        self._ensure_loaded()
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")
        fn = getattr(self.iota_runtime_lib, symbol)

        retained_handles: list[int] = []
        exn_holder = _ffi.new("void*[1]")
        call_args: list[Any] = [_ffi.cast("void*", self.env)]
        try:
            for ffi_name, value in args:
                if ffi_name == "object":
                    if value is None:
                        call_args.append(_ffi.NULL)
                    else:
                        handle = self.retain_foreign_object(value)
                        retained_handles.append(handle)
                        call_args.append(_ffi.cast("void*", handle))
                elif ffi_name == "native":
                    call_args.append(_ffi.cast("void*", value or 0))
                elif ffi_name == "bool":
                    call_args.append(_ffi.cast("uint8_t", 1 if value else 0))
                else:
                    call_args.append(value)

            call_args.append(exn_holder)
            result = fn(*call_args)
            exn_val = int(_ffi.cast("uintptr_t", exn_holder[0]))
            if exn_val:
                self.raise_if_exception(exn_val)
            if return_type == "void":
                return None
            if return_type == "object":
                return self.consume_foreign_object(result)
            if return_type == "native":
                return int(_ffi.cast("uintptr_t", result))
            if return_type == "bool":
                return bool(result)
            if return_type in {"int", "uint32"}:
                return int(result)
            return result
        finally:
            for handle in retained_handles:
                self.release_foreign_object(handle)

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
        _log.warning("raise_native_error: %s", message)
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
        _log.debug("register_error_factory: factory=%r", factory)
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")
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
            _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
            return self.iota_runtime_lib
        if name == "module":
            _require_not_none(self.module_lib, "module_lib")
            return self.module_lib
        _require_not_none(self.module_iota_lib, "module_iota_lib")
        return self.module_iota_lib

    def _ensure_loaded(self) -> None:
        if not self._loaded:
            self.ensure_loaded()

    def _register_module_types(self) -> None:
        _require_not_none(self.module_iota_lib, "module_iota_lib")
        _cdef(f"void FishyJoes_{self.module_name}_registerTypes(void);", override=True)
        getattr(self.module_iota_lib, f"FishyJoes_{self.module_name}_registerTypes")()

    def _retain(self, value: object) -> int:
        """Retain a Python object and return its opaque handle address."""
        return _native_ext.retain(value)

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
        if not handle:
            return
        _native_ext.release(handle)

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
        if self.strict_thread_scheduling:
            raise NotImplementedInNativeError(
                "schedule_thread_work: strict_thread_scheduling=True is set; "
                "this runtime does not own a real thread executor"
            )
        if not self._thread_schedule_warning_emitted:
            _log.warning(
                "schedule_thread_work: running scheduled work inline on the "
                "calling thread (no real thread executor); see "
                "python-runtime/README.non-goals.md. Subsequent invocations "
                "will be logged at DEBUG."
            )
            self._thread_schedule_warning_emitted = True
        else:
            _log.debug("schedule_thread_work: inline execution")
        ctx_int = int(_ffi.cast("uintptr_t", context))
        self._run_scheduled_work(ctx_int)

    def _run_scheduled_work(self, context: int) -> None:
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

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

        _cdef("""
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        @_ffi.callback("uint8_t(void*, void**)")
        def bool_value(obj: Any, exn: Any) -> int:
            try:
                addr = int(_ffi.cast("uintptr_t", obj))
                return 1 if bool(_borrow_python_value(addr)) else 0
            except BaseException as error:
                self._set_exn(exn, error)
                return 0

        self._callbacks.append(bool_value)

        _cdef("""
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
            if value is None:
                return 0
            return int(value)  # type: ignore[call-overload]
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        signed_value_cb = _ffi.callback("intptr_t(void*, void**)", self._integer_value)
        unsigned_value_cb = _ffi.callback("uintptr_t(void*, void**)", self._integer_value)
        unsigned_ctor_cb = _ffi.callback("void*(uintptr_t)", self._unsigned_constructor)
        # Per-type signed constructors: each uses the exact C type Swift passes,
        # so that CFFI sign-extends correctly (e.g. int8_t -128 stays -128).
        int8_ctor_cb  = _ffi.callback("void*(int8_t)",  self._integer_constructor)
        int16_ctor_cb = _ffi.callback("void*(int16_t)", self._integer_constructor)
        int32_ctor_cb = _ffi.callback("void*(int32_t)", self._integer_constructor)
        int64_ctor_cb = _ffi.callback("void*(int64_t)", self._integer_constructor)
        self._callbacks.extend([
            signed_value_cb, unsigned_value_cb,
            int8_ctor_cb, int16_ctor_cb, int32_ctor_cb, int64_ctor_cb,
            unsigned_ctor_cb,
        ])

        for symbol, ctor_cb in [
            ("Swift_Int8_setup",  int8_ctor_cb),
            ("Swift_Int16_setup", int16_ctor_cb),
            ("Swift_Int32_setup", int32_ctor_cb),
            ("Swift_Int64_setup", int64_ctor_cb),
            ("Swift_Int_setup",   int64_ctor_cb),
        ]:
            _cdef(f"void {symbol}(void* env, void* value_fn, void* ctor_fn);", override=True)
            getattr(self.iota_runtime_lib, symbol)(
                _ffi.cast("void*", self.env), signed_value_cb, ctor_cb
            )

        for symbol in [
            "Swift_UInt8_setup", "Swift_UInt16_setup", "Swift_UInt32_setup",
            "Swift_UInt64_setup", "Swift_UInt_setup",
        ]:
            _cdef(f"void {symbol}(void* env, void* value_fn, void* ctor_fn);", override=True)
            getattr(self.iota_runtime_lib, symbol)(
                _ffi.cast("void*", self.env), unsigned_value_cb, unsigned_ctor_cb
            )

    def _float_value(self, obj: Any, exn: Any) -> float:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            value = _borrow_python_value(addr)
            if value is None:
                return 0.0
            return float(value)  # type: ignore[arg-type]
        except BaseException as error:
            self._set_exn(exn, error)
            return 0.0

    def _float_constructor(self, value: float) -> Any:
        addr = self._retain(float(value))
        return _ffi.cast("void*", addr)

    def _setup_floats(self) -> None:
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        float_value_cb = _ffi.callback("float(void*, void**)", self._float_value)
        double_value_cb = _ffi.callback("double(void*, void**)", self._float_value)
        float_ctor_cb = _ffi.callback("void*(float)", self._float_constructor)
        double_ctor_cb = _ffi.callback("void*(double)", self._float_constructor)
        self._callbacks.extend([float_value_cb, double_value_cb, float_ctor_cb, double_ctor_cb])

        _cdef("""
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        byte_len_cb = _ffi.callback("intptr_t(void*, void**)", self._string_byte_length)
        utf8_fill_cb = _ffi.callback("void(void*, char*, void**)", self._string_utf8_fill)
        utf8_ctor_cb = _ffi.callback("void*(char*, intptr_t, void**)", self._string_utf8_constructor)
        self._callbacks.extend([byte_len_cb, utf8_fill_cb, utf8_ctor_cb])

        _cdef("""
            void Swift_String_utf8_setup(void* env, void* byte_len_fn, void* fill_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Swift_String_utf8_setup(
            _ffi.cast("void*", self.env), byte_len_cb, utf8_fill_cb, utf8_ctor_cb
        )

    def _data_length(self, obj: Any, exn: Any) -> int:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            raw = _borrow_python_value(addr)
            if raw is None:
                return 0
            return len(bytes(raw))  # type: ignore[call-overload]
        except BaseException as error:
            self._set_exn(exn, error)
            return 0

    def _data_bytes(self, obj: Any, out_values: Any, exn: Any) -> None:
        try:
            addr = int(_ffi.cast("uintptr_t", obj))
            raw = _borrow_python_value(addr)
            value: bytes = b"" if raw is None else bytes(raw)  # type: ignore[call-overload]
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        len_cb = _ffi.callback("int32_t(void*, void**)", self._data_length)
        bytes_cb = _ffi.callback("void(void*, void*, void**)", self._data_bytes)
        ctor_cb = _ffi.callback("void*(void*, int32_t, void**)", self._data_constructor)
        self._callbacks.extend([len_cb, bytes_cb, ctor_cb])

        _cdef("""
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
        _require_not_none(self.iota_runtime_lib, "iota_runtime_lib")
        _require_not_none(self.env, "env")

        uri_cb = _ffi.callback("void*(void*, void**)", self._url_absolute_uri)
        ctor_cb = _ffi.callback("void*(void*, void**)", self._url_constructor)
        self._callbacks.extend([uri_cb, ctor_cb])

        _cdef("""
            void Foundation_URL_setup(void* env, void* uri_fn, void* ctor_fn);
        """, override=True)

        self.iota_runtime_lib.Foundation_URL_setup(
            _ffi.cast("void*", self.env), uri_cb, ctor_cb
        )
