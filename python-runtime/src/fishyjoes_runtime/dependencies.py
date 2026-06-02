from __future__ import annotations

import importlib

from .config import RuntimeDependency, version_satisfies


def load_dependency(dependency: RuntimeDependency) -> dict[str, object]:
    module = importlib.import_module(dependency.import_name)
    diagnostics = getattr(module, "diagnostics", None)
    if diagnostics is None:
        raise RuntimeError(
            f"Dependency package {dependency.import_name} does not expose diagnostics(). "
            f"Install the FishyJoes-generated Python binding package for {dependency.distribution_name}."
        )
    report = diagnostics()
    package_version = str(report.get("package_version", ""))
    if not version_satisfies(package_version, dependency.version_requirement, dependency.distribution_name):
        raise RuntimeError(
            f"Dependency package {dependency.distribution_name} {package_version} does not satisfy "
            f"required {dependency.version_requirement}"
        )
    dependency_iota_abi = str(report.get("iota_abi_version", ""))
    if dependency_iota_abi != dependency.iota_abi_version:
        raise RuntimeError(
            f"Dependency package {dependency.distribution_name} Iota ABI version mismatch: "
            f"package requires {dependency.iota_abi_version}, dependency provides {dependency_iota_abi}"
        )
    if not report.get("supported", False):
        raise RuntimeError(f"Dependency package {dependency.distribution_name} did not finish setup")
    return report


def load_dependencies(dependencies) -> dict[str, dict[str, object]]:
    return {
        dependency.import_name: load_dependency(dependency)
        for dependency in dependencies
    }
