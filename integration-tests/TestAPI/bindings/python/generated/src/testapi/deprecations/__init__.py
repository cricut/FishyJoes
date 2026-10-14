from __future__ import annotations
from .. import _deprecations_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

@deprecated("replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)")
def get_deprecated_variable() -> int:
    """<!-- FishyJoes.export(deprecatedVariable) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Deprecations_deprecated_variable(fishyjoes_runtime.Runtime.shared.env_ref), int)

@deprecated("don't use this")
def deprecated_method(
) -> str:
    """An old greeting kept only for deprecation coverage."""
    """<!-- FishyJoes.export(deprecatedMethod) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_Deprecations_deprecatedMethod(
            fishyjoes_runtime.Runtime.shared.env_ref,
        ),
        str
    )

__all__: list[str] = [
    "get_deprecated_variable",
    "deprecated_method",
]
