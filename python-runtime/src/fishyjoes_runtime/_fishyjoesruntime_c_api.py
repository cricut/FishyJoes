import importlib.resources
import shutil
import sys
import tempfile
from typing import Any, Callable, cast

from _cffi_backend import Lib
from cffi import FFI


# Contains the raw C ABI function bindings for the FishyJoes runtime, bound to the dynamic library.

def platform_shared_lib_name(library: str) -> str:
    if sys.platform == "darwin":
        return f"lib{library}.dylib"
    elif sys.platform == "win32":
        return f"{library}.dll"
    else:
        return f"lib{library}.so"

ffi = FFI()
_resources = importlib.resources.files('fishyjoes_runtime')

_tmp_lib_dir = tempfile.TemporaryDirectory(prefix="fishyjoes_libs_")
_loaded_libraries: dict[str, Lib] = {}
def load_library(package_name: importlib.resources.Anchor, base_library: str | None, iota_library: str) -> Lib:
    lib = _loaded_libraries.get(iota_library)
    if lib is not None:
        return lib
    resource_directory = importlib.resources.files(package_name)
    ffi.cdef((resource_directory / '_declarations.h').read_text("utf-8"))

    # Copying the files to the same directory is probably only required for linux, but makes things easier on windows too.
    # MacOS comes along for consistency.
    def copy_lib(library_name: str) -> str:
        source_lib_path = resource_directory / 'native' / platform_shared_lib_name(library_name)
        dest_lib_path = f"{_tmp_lib_dir.name}/{platform_shared_lib_name(library_name)}"
        shutil.copyfile(str(source_lib_path), dest_lib_path)
        return dest_lib_path

    if base_library is not None:
        copy_lib(base_library)
    iota_path = copy_lib(iota_library)

    lib = ffi.dlopen(iota_path)
    _loaded_libraries[iota_library] = lib
    return lib

_fishyjoes_runtime_lib = load_library('fishyjoes_runtime', None, 'FishyJoesIotaRuntime')

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
