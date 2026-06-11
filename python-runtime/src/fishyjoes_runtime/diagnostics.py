from __future__ import annotations

import platform
import sys
import sysconfig

from .config import FISHYJOES_RUNTIME_VERSION, RuntimeConfig


def package_diagnostics(
    package_name: str,
    config: RuntimeConfig,
    *,
    supported: bool,
    dependency_reports: dict[str, dict[str, object]],
    library_paths: dict[str, object],
) -> dict[str, object]:
    return {
        "package": package_name,
        "package_version": config.package_version,
        "supported": supported,
        "iota_abi_version": config.iota_abi_version,
        "python": sys.version,
        "platform": platform.platform(),
        "platform_tag": sysconfig.get_platform().replace("-", "_").replace(".", "_"),
        "runtime": {
            "package": config.runtime_distribution_name,
            "version": FISHYJOES_RUNTIME_VERSION,
            "required": config.runtime_requirement,
        },
        "dependencies": dependency_reports,
        "libraries": {name: str(path) for name, path in library_paths.items()},
    }
