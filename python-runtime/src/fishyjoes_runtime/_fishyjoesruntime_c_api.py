import importlib.resources
from typing import Any, Callable, cast

from cffi import FFI

# Contains the raw C ABI function bindings for the FishyJoes runtime, bound to the dynamic library.

ffi = FFI()
_resources = importlib.resources.files('fishyjoes_runtime')
ffi.cdef((_resources / '_declarations.h').read_text("utf-8"))
_fishyjoes_runtime_lib = ffi.dlopen(str(_resources / 'native' / 'libFishyJoesIotaRuntime.dylib'))

# MARK: utilities

def callback[F: Callable[..., Any]](cdecl: str | FFI.CType) -> Callable[[F], F]:
    """Like ffi.callback, but with stricter a type annotation"""
    return cast(Callable[[F], F], ffi.callback(cdecl))

def lazy_once(tag: str) -> Callable[[Callable[[], None]], Callable[[], None]]:
    return lambda fn: lambda: ffi.init_once(fn, tag)

def eval_once_now(tag: str) -> Callable[[Callable[[], None]], None]:
    """Evaluate the function immediately, as long as the tag hasn't been seen before"""
    def outer(fn: Callable[[], None]) -> None:
        ffi.init_once(fn, tag)
    return outer

__all__ = ['ffi', 'callback', 'lazy_once', 'eval_once_now', '_fishyjoes_runtime_lib']
