"""Main loader for FishyJoes Python runtime."""

from __future__ import annotations

import ctypes
import platform
import sys
from pathlib import Path
from typing import Any

from fishyjoes_runtime.utilities import (
    DeleteRefFn,
    DescribeFn,
    NewErrorFn,
    NewRefFn,
    ScheduleThreadWorkFn,
    check_error,
    ensure_bytes,
)


class Loader:
    """
    Main loader for FishyJoes Python runtime.

    Handles:
    - Loading the Swift runtime library
    - Initializing the environment
    - Managing reference counting
    - Type converter registration
    """

    _lib: ctypes.CDLL | None = None
    _env: ctypes.c_void_p | None = None
    _initialized: bool = False

    # Keep references to callbacks so they don't get garbage collected
    _callback_bag: list[Any] = []

    @classmethod
    def _bag(cls, obj: Any) -> Any:
        """Keep a reference to prevent garbage collection."""
        cls._callback_bag.append(obj)
        return obj

    @classmethod
    def _find_library(cls) -> Path:
        """
        Find the Swift runtime library.

        Returns:
            Path to the library file

        Raises:
            FileNotFoundError: If library cannot be found
        """
        system = platform.system()
        runtime_dir = Path(__file__).parent

        if system == "Darwin":  # macOS
            lib_name = "libFishyJoesPythonRuntime.dylib"
        elif system == "Windows":
            lib_name = "FishyJoesPythonRuntime.dll"
        else:  # Linux and others
            lib_name = "libFishyJoesPythonRuntime.so"

        lib_path = runtime_dir / lib_name

        if not lib_path.exists():
            raise FileNotFoundError(
                f"Swift runtime library not found at {lib_path}. "
                f"Run './scripts/compile-python-runtime.sh' to build it."
            )

        return lib_path

    @classmethod
    def _new_ref_callback(cls, obj_ptr: ctypes.c_void_p) -> ctypes.c_void_p:
        """Callback for Swift to increment Python object refcount."""
        if not obj_ptr:
            return ctypes.c_void_p()

        # In Python, we use id(obj) as the "handle"
        # Swift passes us back the id, we need to keep the actual object alive
        try:
            # For now, just return the same pointer
            # TODO: Implement proper handle->object mapping
            return obj_ptr
        except Exception as e:
            print(f"Error in _new_ref_callback: {e}", file=sys.stderr)
            return ctypes.c_void_p()

    @classmethod
    def _delete_ref_callback(cls, obj_ptr: ctypes.c_void_p) -> None:
        """Callback for Swift to decrement Python object refcount."""
        if not obj_ptr:
            return

        try:
            # TODO: Implement proper handle cleanup
            pass
        except Exception as e:
            print(f"Error in _delete_ref_callback: {e}", file=sys.stderr)

    @classmethod
    def _new_error_callback(cls, message_ptr: ctypes.c_char_p) -> ctypes.c_void_p:
        """Callback for Swift to create a Python exception."""
        try:
            if message_ptr:
                message = (
                    message_ptr.value.decode("utf-8")
                    if message_ptr.value
                    else "Unknown error"
                )
            else:
                message = "Unknown error"
            # Create Python exception and return a handle to it
            exc = Exception(message)
            # TODO: Implement proper exception handling
            return ctypes.c_void_p(id(exc))
        except Exception as e:
            print(f"Error in _new_error_callback: {e}", file=sys.stderr)
            return ctypes.c_void_p()

    @classmethod
    def _describe_callback(cls, obj_ptr: ctypes.c_void_p) -> ctypes.c_void_p:
        """Callback for Swift to get string description of Python object."""
        if not obj_ptr:
            return ctypes.c_void_p()

        try:
            # TODO: Implement proper object->string conversion
            desc = f"<Python object at 0x{obj_ptr.value:x}>"
            # Allocate C string (caller will free)
            desc_bytes = desc.encode("utf-8") + b"\0"
            # Need to allocate with libc malloc so Swift can free it
            if cls._lib:
                strdup = cls._lib.FishyJoesCommonRuntime_strdup
                strdup.argtypes = [ctypes.c_char_p]
                strdup.restype = ctypes.c_void_p
                return ctypes.c_void_p(strdup(desc_bytes))
            return ctypes.c_void_p()
        except Exception as e:
            print(f"Error in _describe_callback: {e}", file=sys.stderr)
            return ctypes.c_void_p()

    @classmethod
    def _schedule_work_callback(
        cls, env_ref: ctypes.c_void_p, context: ctypes.c_void_p
    ) -> None:
        """Callback for Swift to schedule work on Python thread."""
        try:
            # TODO: Implement proper async work scheduling
            # For now, just run synchronously
            if cls._lib:
                run_work = cls._lib.FishyJoesPythonRuntime_runScheduledWork
                run_work.argtypes = [
                    ctypes.c_void_p,
                    ctypes.c_void_p,
                    ctypes.POINTER(ctypes.c_void_p),
                ]
                run_work.restype = None

                exn = ctypes.c_void_p()
                run_work(env_ref, context, ctypes.byref(exn))
                if exn.value:
                    check_error(ctypes.c_void_p(exn.value))
        except Exception as e:
            print(f"Error in _schedule_work_callback: {e}", file=sys.stderr)

    @classmethod
    def initialize(cls) -> None:
        """Initialize the FishyJoes runtime."""
        if cls._initialized:
            return

        # Load the Swift runtime library
        lib_path = cls._find_library()
        cls._lib = ctypes.CDLL(str(lib_path))

        # Set up function signatures
        setup_fn = cls._lib.FishyJoesPythonRuntime_Env_setup
        setup_fn.argtypes = [
            NewRefFn,
            DeleteRefFn,
            NewErrorFn,
            DescribeFn,
            ScheduleThreadWorkFn,
        ]
        setup_fn.restype = ctypes.c_void_p

        # Create callbacks (and bag them to prevent GC)
        new_ref_fn = cls._bag(NewRefFn(cls._new_ref_callback))
        delete_ref_fn = cls._bag(DeleteRefFn(cls._delete_ref_callback))
        new_error_fn = cls._bag(NewErrorFn(cls._new_error_callback))
        describe_fn = cls._bag(DescribeFn(cls._describe_callback))
        schedule_work_fn = cls._bag(ScheduleThreadWorkFn(cls._schedule_work_callback))

        # Initialize the environment
        cls._env = setup_fn(
            new_ref_fn,
            delete_ref_fn,
            new_error_fn,
            describe_fn,
            schedule_work_fn,
        )

        if not cls._env:
            raise RuntimeError("Failed to initialize FishyJoes environment")

        # Setup type converters
        cls._setup_primitives()
        cls._setup_collections()
        cls._setup_tuples()
        cls._setup_futures()
        # TODO: Add more setup methods as needed
        # cls._setup_ranges()
        # cls._setup_results()

        cls._initialized = True

    @classmethod
    def ensure_initialized(cls) -> None:
        """Ensure the runtime is initialized, initializing if necessary."""
        if not cls._initialized:
            cls.initialize()

    @classmethod
    def new_ref(cls, ptr: ctypes.c_void_p) -> ctypes.c_void_p:
        """Increment reference count on a Swift object."""
        cls.ensure_initialized()
        # Call through to Swift
        return cls._new_ref_callback(ptr)

    @classmethod
    def delete_ref(cls, ptr: ctypes.c_void_p) -> None:
        """Decrement reference count on a Swift object."""
        if not cls._initialized or not ptr:
            return
        cls._delete_ref_callback(ptr)

    @classmethod
    def describe_python_object(cls, ptr: ctypes.c_void_p) -> str:
        """Get string description of a Python object from Swift."""
        cls.ensure_initialized()
        result_ptr = cls._describe_callback(ptr)
        if not result_ptr:
            return "<null>"

        try:
            # Convert C string to Python string
            c_str = ctypes.cast(result_ptr, ctypes.c_char_p)
            desc = c_str.value.decode("utf-8") if c_str.value else "<null>"
            # Free the C string
            if cls._lib:
                # TODO: Proper cleanup
                pass
            return desc
        except Exception:
            return "<error>"

    @classmethod
    def _setup_primitives(cls) -> None:
        """Setup primitive type converters."""
        if not cls._lib or not cls._env:
            return

        # Import here to avoid circular dependency
        from fishyjoes_runtime._loader_primitives import setup_primitives

        setup_primitives(cls)

    @classmethod
    def _setup_collections(cls) -> None:
        """Setup collection type converters."""
        if not cls._lib or not cls._env:
            return

        from fishyjoes_runtime._loader_collections import setup_collections

        setup_collections(cls)

    @classmethod
    def _setup_tuples(cls) -> None:
        """Setup tuple type converters."""
        if not cls._lib or not cls._env:
            return

        from fishyjoes_runtime._loader_tuples import setup_tuples

        setup_tuples(cls)

    @classmethod
    def _setup_futures(cls) -> None:
        """Setup async/Future type converters."""
        if not cls._lib or not cls._env:
            return

        from fishyjoes_runtime._loader_futures import setup_futures

        setup_futures(cls)

    @classmethod
    def get_type_id(cls, type_name: str) -> int:
        """Get the type ID for a named Swift type."""
        cls.ensure_initialized()
        if not cls._lib:
            raise RuntimeError("Library not loaded")

        get_type_id_fn = cls._lib.FishyJoesPythonRuntime_getTypeID
        get_type_id_fn.argtypes = [ctypes.c_char_p]
        get_type_id_fn.restype = ctypes.c_int

        name_bytes = ensure_bytes(type_name)
        result: int = get_type_id_fn(name_bytes)
        return result


# Auto-initialize on module import
# This ensures the runtime is ready when bindings are loaded
try:
    Loader.initialize()
except Exception as e:
    print(f"Warning: Failed to initialize FishyJoes runtime: {e}", file=sys.stderr)
    print("The runtime library may not be built yet.", file=sys.stderr)
