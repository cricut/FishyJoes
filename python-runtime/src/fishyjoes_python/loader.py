from __future__ import annotations

from dataclasses import dataclass
from importlib import resources
from pathlib import Path


@dataclass(frozen=True, slots=True)
class SharedLibraryPath:
    path: Path


def load_shared_library(package: str, relative_name: str) -> SharedLibraryPath:
    """Return the filesystem path for a bundled shared library.

    Generated bindings can use this to load platform-native artifacts relative to the package.
    """

    package_root = resources.files(package)
    candidate = package_root.joinpath(relative_name)
    with resources.as_file(candidate) as resolved:
        return SharedLibraryPath(path=Path(resolved))

