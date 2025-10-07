"""Async/Future type converters for Python-Swift interop."""

from __future__ import annotations

import asyncio
import ctypes
from collections.abc import Coroutine
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from fishyjoes_runtime.loader import Loader


def setup_futures(loader_cls: type[Loader]) -> None:
    """
    Setup async/Future type converters with Swift.

    Async/Future conversion bridges Swift's async/await with Python's asyncio.
    This involves:
    1. Converting Swift Task to Python asyncio.Future
    2. Converting Python coroutines to Swift async functions
    3. Properly scheduling work on the Python event loop
    4. Handling cancellation and exceptions across the boundary

    Args:
        loader_cls: The Loader class (passed to avoid circular import)

    Note:
        Future conversion is more complex than primitives because it requires:
        - Event loop integration
        - Cross-language cancellation handling
        - Proper exception propagation
        - Thread-safe callback scheduling
    """
    if not loader_cls._lib or not loader_cls._env:
        return

    # Future conversion infrastructure notes:
    #
    # Swift async/await → Python asyncio:
    # 1. Swift async function is called from Python
    # 2. Swift creates a Task and returns it immediately
    # 3. Python wraps the Task in an asyncio.Future
    # 4. When Swift Task completes, it calls back to resolve/reject the Future
    # 5. Python awaits can resolve the Future
    #
    # Python asyncio → Swift async/await:
    # 1. Python async function is passed to Swift
    # 2. Swift calls the function when needed
    # 3. Python schedules a coroutine on its event loop
    # 4. When the coroutine completes, callback notifies Swift
    # 5. Swift async function resumes with the result
    #
    # This requires the schedule_work_callback that was registered during
    # environment setup to properly schedule continuations on the event loop.

    # No explicit converter registration at init time.
    # Future conversion is handled by generated bindings that create
    # appropriate bridges between Swift Tasks and Python Futures.
    pass


# Helper class for bridging Swift Tasks and Python Futures


class SwiftTaskFuture(asyncio.Future[Any]):
    """
    An asyncio.Future that represents a Swift Task.

    This bridges Swift's async/await with Python's asyncio, allowing
    Python code to await Swift async functions.
    """

    def __init__(
        self,
        swift_task_ptr: ctypes.c_void_p,
        result_converter: Any,
        loader_cls: type[Loader],
        *,
        loop: asyncio.AbstractEventLoop | None = None,
    ) -> None:
        """
        Initialize a Future representing a Swift Task.

        Args:
            swift_task_ptr: Pointer to the Swift Task object
            result_converter: Function to convert the Swift result to Python
            loader_cls: Loader class for FFI operations
            loop: Event loop to use (defaults to current loop)
        """
        super().__init__(loop=loop)
        self._swift_task_ptr = swift_task_ptr
        self._result_converter = result_converter
        self._loader_cls = loader_cls

        # TODO: Register completion callback with Swift
        # When Swift Task completes, it should call _on_swift_completion

    def _on_swift_completion(
        self, result_ptr: ctypes.c_void_p | None, error_ptr: ctypes.c_void_p | None
    ) -> None:
        """
        Called by Swift when the Task completes.

        This method is called from the Swift side and needs to be thread-safe.

        Args:
            result_ptr: Pointer to result if successful, None if failed
            error_ptr: Pointer to error if failed, None if successful
        """
        if self.done():
            return

        try:
            if error_ptr:
                # TODO: Convert Swift error to Python exception
                exception = Exception("Swift async operation failed")
                self.set_exception(exception)
            elif result_ptr:
                # Convert Swift result to Python
                result = self._result_converter(result_ptr)
                self.set_result(result)
            else:
                # Void result
                self.set_result(None)
        except Exception as e:
            self.set_exception(e)

    def cancel(self, msg: str | None = None) -> bool:
        """
        Cancel the Future and attempt to cancel the Swift Task.

        Args:
            msg: Optional cancellation message

        Returns:
            True if cancellation was successful
        """
        if super().cancel(msg=msg):
            # TODO: Call Swift to cancel the Task
            # This requires a Swift-side cancellation API
            return True
        return False


# Helper functions for async conversion (used by generated bindings)


def swift_task_to_python_future(
    swift_task_ptr: ctypes.c_void_p,
    result_converter: Any,
    loader_cls: type[Loader],
) -> asyncio.Future[Any]:
    """
    Convert a Swift Task to a Python asyncio.Future.

    This is a helper that will be used by generated bindings.

    Args:
        swift_task_ptr: Pointer to Swift Task object
        result_converter: Function to convert the result
        loader_cls: Loader class for FFI operations

    Returns:
        asyncio.Future that resolves when Swift Task completes
    """
    return SwiftTaskFuture(swift_task_ptr, result_converter, loader_cls)


def python_coroutine_to_swift_task(
    py_coroutine: Coroutine[Any, Any, Any],
    result_converter: Any,
    loader_cls: type[Loader],
) -> ctypes.c_void_p:
    """
    Convert a Python coroutine to a Swift Task.

    This is a helper that will be used by generated bindings.

    Args:
        py_coroutine: Python coroutine to convert
        result_converter: Function to convert the result to Swift
        loader_cls: Loader class for FFI operations

    Returns:
        Pointer to Swift Task object
    """
    # Placeholder implementation
    # In real implementation:
    # 1. Create a Swift Task wrapper
    # 2. Schedule the coroutine on Python's event loop
    # 3. When coroutine completes, notify Swift via callback
    # 4. Convert result using result_converter
    # 5. Return Swift Task pointer
    return ctypes.c_void_p(0)


def get_or_create_event_loop() -> asyncio.AbstractEventLoop:
    """
    Get the current event loop or create a new one if needed.

    Returns:
        The current or newly created event loop
    """
    try:
        return asyncio.get_running_loop()
    except RuntimeError:
        # No running loop, try to get the current loop
        loop = asyncio.get_event_loop()
        if loop.is_closed():
            # Loop is closed, create a new one
            loop = asyncio.new_event_loop()
            asyncio.set_event_loop(loop)
        return loop
