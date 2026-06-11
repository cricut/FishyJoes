from __future__ import annotations

import os
import platform
import sysconfig
import threading
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path


@dataclass(frozen=True)
class NativeLibrary:
    name: str
    path: Path
    reused: bool = False


class NativeLibraryRegistry:
    def __init__(self) -> None:
        self._lock = threading.RLock()
        self._paths: dict[str, Path] = {}

    def resolve(
        self,
        name: str,
        native_dir_candidates: Sequence[Path],
        build_hint: str,
        *,
        reusable: bool = False,
    ) -> NativeLibrary:
        with self._lock:
            existing_path = self._paths.get(name)
            if existing_path is not None and reusable:
                return NativeLibrary(name=name, path=existing_path, reused=True)

        path = library_path(name, native_dir_candidates, build_hint).resolve()
        with self._lock:
            existing_path = self._paths.get(name)
            if existing_path is None:
                self._paths[name] = path
                return NativeLibrary(name=name, path=path)
            if existing_path == path or reusable:
                return NativeLibrary(name=name, path=existing_path, reused=True)
            raise RuntimeError(
                f"Native library load conflict for {name}: already loaded from {existing_path}, "
                f"refusing to load another copy from {path}"
            )


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


def library_path(name: str, native_dir_candidates: Sequence[Path], build_hint: str) -> Path:
    resolved_library_name = library_name(name)
    for native_dir in native_dir_candidates:
        path = native_dir / resolved_library_name
        if path.exists():
            return path
    expected_paths = ", ".join(str(native_dir / resolved_library_name) for native_dir in native_dir_candidates)
    raise RuntimeError(
        f"Missing native library {resolved_library_name}; checked {expected_paths}. "
        f"{build_hint}"
    )


def resolve_library_paths(
    module_name: str,
    native_dir_candidates: Sequence[Path],
    build_hint: str,
    *,
    registry: NativeLibraryRegistry = _DEFAULT_REGISTRY,
) -> dict[str, NativeLibrary]:
    runtime_native_dirs = runtime_native_dir_candidates()
    configure_windows_dll_search_paths([*runtime_native_dirs, *native_dir_candidates])
    return {
        "FishyJoesIotaRuntime": registry.resolve(
            "FishyJoesIotaRuntime",
            [*runtime_native_dirs, *native_dir_candidates],
            build_hint,
            reusable=True,
        ),
        module_name: registry.resolve(module_name, native_dir_candidates, build_hint),
        f"{module_name}-iota": registry.resolve(f"{module_name}-iota", native_dir_candidates, build_hint),
    }


def configure_windows_dll_search_paths(native_dir_candidates: Sequence[Path]) -> None:
    if platform.system() != "Windows" or not hasattr(os, "add_dll_directory"):
        return
    for native_dir in native_dir_candidates:
        if native_dir.exists():
            handle = os.add_dll_directory(str(native_dir.resolve()))
            _DLL_DIRECTORY_HANDLES.append(handle)


def load_library(ffi, library: NativeLibrary):
    try:
        return ffi.dlopen(str(library.path))
    except OSError as error:
        platform_tag = sysconfig.get_platform().replace("-", "_").replace(".", "_")
        raise RuntimeError(
            f"Could not load native library {library.name} from {library.path} "
            f"for platform {platform_tag}: {error}"
        ) from error


def read_declarations(package_dir: Path, declaration_files: Sequence[str]) -> str:
    declarations: list[str] = []
    for declaration_file in declaration_files:
        path = package_dir / declaration_file
        if path.exists():
            declarations.append(path.read_text(encoding="utf-8"))
        elif declaration_file == "_declarations.h":
            raise RuntimeError(f"Missing required Iota declarations file: {path}")
    return "\n".join(declarations)
