from __future__ import annotations

import json
import platform
import sys
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path

from packaging.specifiers import InvalidSpecifier, SpecifierSet
from packaging.version import InvalidVersion, Version


FISHYJOES_RUNTIME_VERSION = "0.0.1"
# Internal Iota declaration-schema number, reported by diagnostics() for
# debugging. It is not a package compatibility axis: the Iota ABI is a function
# of the FishyJoes runtime version, and the runtime version requirement is the
# compatibility gate.
_IOTA_ABI_VERSION = "1"
WHEEL_METADATA_NAME = "__fishyjoes_wheel.json"


@dataclass(frozen=True)
class RuntimeDependency:
    """A generated dependency package this binding needs at import time."""

    import_name: str
    distribution_name: str
    version_requirement: str


@dataclass(frozen=True)
class RuntimeConfig:
    """How a generated binding package configures its Iota runtime.

    Generated packages construct one of these and pass it to
    create_runtime(); the fields describe where native libraries live, which
    declaration files define the ABI, and which runtime/dependency versions
    are compatible.
    """

    package_dir: Path
    module_name: str
    package_version: str
    register_types_symbol: str
    native_dir_candidates: Sequence[Path]
    runtime_distribution_name: str = "fishyjoes-runtime"
    dependencies: Sequence[RuntimeDependency] = ()
    declaration_files: Sequence[str] = ("_declarations.h", "_generated_declarations.h")
    runtime_requirement: str = ">=0.0.1"
    python_requirement: str = ">=3.11"
    supported_platforms: Sequence[str] = ("Darwin", "Linux", "Windows")
    supported_architectures: Sequence[str] = ()
    build_hint: str = "Run the FishyJoes Python build phase before importing generated bindings."


def normalized_architecture(value: str) -> str:
    normalized = value.lower().replace("-", "_")
    aliases = {
        "amd64": "x86_64",
        "x64": "x86_64",
        "aarch64": "arm64",
    }
    return aliases.get(normalized, normalized)


def version_satisfies(version: str, requirement: str, label: str) -> bool:
    """Check a version against a PEP 440 specifier set at import time.

    Deliberately reuses packaging's package-time specifier syntax: generated
    packages record their runtime/dependency compatibility as ordinary
    requirement strings (for example ``>=1.2,<2.0``), and the runtime evaluates
    them when the binding is imported so incompatibility fails before any FFI
    call, with the same semantics pip would apply at install time.
    """
    try:
        parsed_version = Version(version)
    except InvalidVersion as error:
        raise RuntimeError(f"Invalid {label} version: {version}") from error
    try:
        specifier = SpecifierSet(requirement)
    except InvalidSpecifier as error:
        raise RuntimeError(f"Unsupported {label} requirement: {requirement}") from error
    return parsed_version in specifier


def current_python_version() -> str:
    return f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}"


def read_wheel_metadata(package_dir: Path) -> dict[str, object] | None:
    metadata_path = package_dir / WHEEL_METADATA_NAME
    if not metadata_path.exists():
        return None
    try:
        data = json.loads(metadata_path.read_text(encoding="utf-8"))
    except json.JSONDecodeError as error:
        raise RuntimeError(f"Invalid FishyJoes wheel metadata: {metadata_path}") from error
    if not isinstance(data, dict):
        raise RuntimeError(f"Invalid FishyJoes wheel metadata: {metadata_path}")
    return data


def validate_platform_compatibility(config: RuntimeConfig) -> None:
    current_platform = platform.system()
    if current_platform not in config.supported_platforms:
        supported = ", ".join(config.supported_platforms)
        raise RuntimeError(f"Unsupported Python binding platform: {current_platform}; supported platforms: {supported}")

    current_arch = normalized_architecture(platform.machine())
    configured_arches = {normalized_architecture(arch) for arch in config.supported_architectures}
    if configured_arches and current_arch not in configured_arches:
        supported = ", ".join(sorted(configured_arches))
        raise RuntimeError(
            f"Python binding architecture mismatch: running on {current_arch}, package supports {supported}"
        )

    wheel_metadata = read_wheel_metadata(config.package_dir)
    if wheel_metadata is None:
        return

    wheel_system = wheel_metadata.get("platform_system")
    if isinstance(wheel_system, str) and wheel_system != current_platform:
        raise RuntimeError(
            f"Python binding platform mismatch: wheel was built for {wheel_system}, running on {current_platform}"
        )

    wheel_arches = wheel_metadata.get("architectures")
    if isinstance(wheel_arches, list):
        normalized_wheel_arches = {
            normalized_architecture(arch)
            for arch in wheel_arches
            if isinstance(arch, str)
        }
        if normalized_wheel_arches and current_arch not in normalized_wheel_arches:
            supported = ", ".join(sorted(normalized_wheel_arches))
            raise RuntimeError(
                f"Python binding architecture mismatch: wheel supports {supported}, running on {current_arch}"
            )


def validate_runtime_compatibility(config: RuntimeConfig) -> None:
    if not version_satisfies(FISHYJOES_RUNTIME_VERSION, config.runtime_requirement, config.runtime_distribution_name):
        raise RuntimeError(
            f"{config.runtime_distribution_name} {FISHYJOES_RUNTIME_VERSION} does not satisfy required "
            f"{config.runtime_requirement}"
        )
    if not version_satisfies(current_python_version(), config.python_requirement, "Python"):
        raise RuntimeError(
            f"Python version mismatch: package requires {config.python_requirement}, "
            f"running on {current_python_version()}"
        )
    validate_platform_compatibility(config)
