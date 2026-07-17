from __future__ import annotations

import os
import platform
import sysconfig
import threading
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path
import importlib.resources


@dataclass(frozen=True)
class NativeLibrary:
    """A native library resolved by the process-wide registry.

    ``reused`` is True when the registry returned the path of a library it had
    already loaded under this name (a registry cache hit), rather than
    performing a fresh load.
    """

    import_name: str
    name: str
    path: Path
    reused: bool = False


class NativeLibraryRegistry:
    def __init__(self) -> None:
        self._lock = threading.RLock()
        self._paths: dict[str, Path] = {}

_DEFAULT_REGISTRY = NativeLibraryRegistry()
_DLL_DIRECTORY_HANDLES: list[object] = []
_RUNTIME_PACKAGE_DIR = Path(__file__).resolve().parent


def library_name(name: str) -> str:
    system = platform.system()
    if system == "Darwin":
        return f"lib{name}.dylib"
    if system == "Linux":
        return f"lib{name}.so"
    if system == "Windows":
        return f"{name}.dll"
    raise RuntimeError(f"Unsupported Python binding platform: {system}")


def runtime_native_dir_candidates() -> list[Path]:
    return [_RUNTIME_PACKAGE_DIR / "native"]

def configure_windows_dll_search_paths(native_dir_candidates: Sequence[Path]) -> None:
    if platform.system() != "Windows" or not hasattr(os, "add_dll_directory"):
        return
    for native_dir in native_dir_candidates:
        if native_dir.exists():
            handle = os.add_dll_directory(str(native_dir.resolve()))
            _DLL_DIRECTORY_HANDLES.append(handle)


def library_load_flags(ffi) -> int:
    if platform.system() == "Linux":
        return ffi.RTLD_NOW | ffi.RTLD_GLOBAL
    return 0


def load_library(ffi, library: Path):
    try:
        return ffi.dlopen(str(library), library_load_flags(ffi))
    except OSError as error:
        platform_tag = sysconfig.get_platform().replace("-", "_").replace(".", "_")
        raise RuntimeError(
            f"Could not load native library {library} "
            f"for platform {platform_tag}: {error}"
        ) from error


def runtime_declarations() -> str:
    """The shared FishyJoesIotaRuntime cffi declarations, owned by this package."""
    path = _RUNTIME_PACKAGE_DIR / "_declarations.h"
    if not path.exists():
        raise RuntimeError(f"Missing required Iota declarations file: {path}")
    return path.read_text(encoding="utf-8")


def read_declarations(package_dir: Path, declaration_files: Sequence[str]) -> str:
    """Concatenate the package's cffi declaration files.

    Every listed file is required: the config names exactly the declaration
    files the package was generated with, so a missing file means a broken or
    partially installed package, not an optional feature. Requiring them all
    keeps the contract explicit instead of encoding required-versus-optional
    in filename comparisons.
    """
    declarations: list[str] = []
    for declaration_file in declaration_files:
        path = package_dir / declaration_file
        if not path.exists():
            raise RuntimeError(f"Missing required Iota declarations file: {path}")
        declarations.append(path.read_text(encoding="utf-8"))
    return "\n".join(declarations)
