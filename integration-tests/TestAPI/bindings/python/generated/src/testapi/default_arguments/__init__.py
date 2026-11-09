from __future__ import annotations
from .. import _default_arguments_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "describe_enum_default",
    "echo_default_tolerance",
    "echo_defaults",
]

def echo_defaults(
    x: int | None,
    *,
    y: int | None = None,
    z: float = 3.14,
) -> str:
    """<!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->"""
    with fishyjoes_runtime.local_handles(y, x) as (_yHandle, _xHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_echoDefaults(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _yHandle,
                _xHandle,
                z,
            ),
            str
        )

def describe_enum_default(
    value: int,
    color: testapi.SimpleEnum,
) -> str:
    """<!-- FishyJoes.export(describeEnumDefault) -->"""
    with fishyjoes_runtime.local_handles(color) as (_colorHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_describeEnumDefault(
                fishyjoes_runtime.Runtime.shared.env_ref,
                value,
                _colorHandle,
            ),
            str
        )

def echo_default_tolerance(
    *,
    tolerance: float = 1.4901161193847656E-8,
) -> float:
    """<!-- FishyJoes.export(echoDefaultTolerance) -->"""
    return _impl.iota_TestAPI_DefaultArguments_echoDefaultTolerance(
        fishyjoes_runtime.Runtime.shared.env_ref,
        tolerance,
    )
