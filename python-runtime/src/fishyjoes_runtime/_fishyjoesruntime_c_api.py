import importlib.resources
import shutil
import sys
import tempfile
from importlib.resources.abc import Traversable
from pathlib import Path
from typing import Any, Callable, cast

from _cffi_backend import Lib
from cffi import FFI


# Contains the raw C ABI function bindings for the FishyJoes runtime, bound to the dynamic library.

def platform_dylib_ext() -> str:
    if sys.platform == "darwin":
        return "dylib"
    elif sys.platform == "win32":
        return "dll"
    else:
        return "so"

def platform_shared_lib_name(library: str) -> str:
    prefix = "" if sys.platform == "win32" else "lib"
    return f"{prefix}{library}.{platform_dylib_ext()}"

ffi = FFI()
_resources = importlib.resources.files('fishyjoes_runtime')

_tmp_lib_dir = tempfile.TemporaryDirectory(prefix="fishyjoes_libs_")
_loaded_libraries: dict[str, Lib] = {}
def load_library(package_name: importlib.resources.Anchor, unused: str | None, iota_library: str) -> Lib:
    lib = _loaded_libraries.get(iota_library)
    if lib is not None:
        return lib
    resource_directory = importlib.resources.files(package_name)
    ffi.cdef((resource_directory / '_declarations.h').read_text("utf-8"))

    # Copying the files to the same directory is probably only required for linux, but makes things easier on windows too.
    # MacOS comes along for consistency.
    def copy_lib(source_lib_path: Path) -> None:
        basename = source_lib_path.parts[-1]
        dest_lib_path = f"{_tmp_lib_dir.name}/{basename}"
        print(f"COPY_LIB from {source_lib_path} to {dest_lib_path}")
        shutil.copyfile(str(source_lib_path), dest_lib_path)

    for resource in resource_directory.joinpath('native').iterdir():
        if resource.is_file() and str(resource).endswith('.' + platform_dylib_ext()):
            with importlib.resources.as_file(resource) as path:
                copy_lib(path)

    lib = ffi.dlopen(f"{_tmp_lib_dir.name}/{platform_shared_lib_name(iota_library)}", getattr(ffi, 'RTLD_LAZY', 0))
    _loaded_libraries[iota_library] = lib
    return lib

_stdlib: list[str] = []
if sys.platform != "darwin":
    _stdlib = open(str(importlib.resources.files('fishyjoes_runtime') / "native" / "stdlib.txt"), "r").readlines()
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
