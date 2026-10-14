from __future__ import annotations
from .. import _default_arguments_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "echo_defaults",
    "describe_enum_default",
    "echo_default_tolerance",
    "echo_default_int_limits",
]

def echo_defaults(
    x: int | None,
    *,
    y: int | None = None,
    z: float = 3.14,
) -> str:
    """<!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->"""
    with fishyjoes_runtime.local_handles(y, x, z) as (_yHandle, _xHandle, _zHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_echoDefaults(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _yHandle,
                _xHandle,
                _zHandle,
            ),
            str
        )

def describe_enum_default(
    value: int,
    color: testapi.SimpleEnum,
) -> str:
    """<!-- FishyJoes.export(describeEnumDefault) -->"""
    with fishyjoes_runtime.local_handles(value, color) as (_valueHandle, _colorHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_describeEnumDefault(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
                _colorHandle,
            ),
            str
        )

def echo_default_tolerance(
    *,
    tolerance: float = 1.4901161193847656E-8,
) -> float:
    """<!-- FishyJoes.export(echoDefaultTolerance) -->"""
    with fishyjoes_runtime.local_handles(tolerance) as (_toleranceHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_echoDefaultTolerance(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _toleranceHandle,
            ),
            float
        )

def echo_default_int_limits(
    *,
    min_value: int = -9223372036854775808,
    max_value: int = 9223372036854775807,
) -> str:
    """<!-- FishyJoes.export(echoDefaultIntLimits) -->"""
    with fishyjoes_runtime.local_handles(min_value, max_value) as (_min_valueHandle, _max_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_DefaultArguments_echoDefaultIntLimits(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _min_valueHandle,
                _max_valueHandle,
            ),
            str
        )
