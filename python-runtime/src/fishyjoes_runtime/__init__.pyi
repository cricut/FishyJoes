from collections.abc import Sequence
from pathlib import Path

IOTA_ABI_VERSION: str
__version__: str

class RuntimeDependency:
    import_name: str
    distribution_name: str
    version_requirement: str
    iota_abi_version: str
    def __init__(
        self,
        import_name: str,
        distribution_name: str,
        version_requirement: str,
        iota_abi_version: str = ...,
    ) -> None: ...

class RuntimeConfig:
    package_dir: Path
    module_name: str
    package_version: str
    register_types_symbol: str
    native_dir_candidates: Sequence[Path]
    runtime_distribution_name: str
    dependencies: Sequence[RuntimeDependency]
    declaration_files: Sequence[str]
    iota_abi_version: str
    runtime_requirement: str
    python_requirement: str
    supported_platforms: Sequence[str]
    supported_architectures: Sequence[str]
    build_hint: str
    def __init__(
        self,
        package_dir: Path,
        module_name: str,
        package_version: str,
        register_types_symbol: str,
        native_dir_candidates: Sequence[Path],
        runtime_distribution_name: str = ...,
        dependencies: Sequence[RuntimeDependency] = ...,
        declaration_files: Sequence[str] = ...,
        iota_abi_version: str = ...,
        runtime_requirement: str = ...,
        python_requirement: str = ...,
        supported_platforms: Sequence[str] = ...,
        supported_architectures: Sequence[str] = ...,
        build_hint: str = ...,
    ) -> None: ...

def create_runtime(config: RuntimeConfig) -> dict[str, object]: ...
