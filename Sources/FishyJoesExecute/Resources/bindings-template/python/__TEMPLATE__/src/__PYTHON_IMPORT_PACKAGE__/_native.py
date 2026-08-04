# __AUTOGEN_WARNING__

from __future__ import annotations

from pathlib import Path

from fishyjoes_runtime import RuntimeConfig, RuntimeDependency, create_runtime


_PACKAGE_DIR = Path(__file__).resolve().parent
_RUNTIME_EXPORTS = create_runtime(
    RuntimeConfig(
        package_dir=_PACKAGE_DIR,
        module_name="__MODULE_NAME__",
        package_version="__PYTHON_PACKAGE_VERSION__",
        runtime_distribution_name="__PYTHON_RUNTIME_DISTRIBUTION_NAME__",
        register_types_symbol="__PYTHON_MODULE_REGISTER_TYPES__",
        python_requirement=">=3.11",
        native_dir_candidates=[
            _PACKAGE_DIR / "native",
            _PACKAGE_DIR.parents[1] / "native",
        ],
        dependencies=__PYTHON_RUNTIME_DEPENDENCIES__,
    )
)

globals().update(_RUNTIME_EXPORTS)
