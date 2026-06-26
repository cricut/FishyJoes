"""Shared Iota runtime for FishyJoes-generated Python binding packages."""

from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path

__all__ = ["IOTA_ABI_VERSION", "RuntimeConfig", "RuntimeDependency", "__version__", "create_runtime"]

IOTA_ABI_VERSION: str
__version__: str

@dataclass(frozen=True)
class RuntimeDependency:
    """A generated dependency package this binding needs at import time."""

    import_name: str
    distribution_name: str
    version_requirement: str
    iota_abi_version: str = ...

@dataclass(frozen=True)
class RuntimeConfig:
    """How a generated binding package configures its Iota runtime."""

    package_dir: Path
    module_name: str
    package_version: str
    register_types_symbol: str
    native_dir_candidates: Sequence[Path]
    runtime_distribution_name: str = ...
    dependencies: Sequence[RuntimeDependency] = ...
    declaration_files: Sequence[str] = ...
    iota_abi_version: str = ...
    runtime_requirement: str = ...
    python_requirement: str = ...
    supported_platforms: Sequence[str] = ...
    supported_architectures: Sequence[str] = ...
    build_hint: str = ...

def create_runtime(config: RuntimeConfig) -> dict[str, object]:
    """Create the Iota runtime namespace for one generated binding package."""
