from __future__ import annotations
from .. import _protocol_fixtures_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "describe_a_protocol",
    "return_a_protocol",
]

def describe_a_protocol(
    value: testapi.AProtocol,
    x: int,
    y: int,
) -> str:
    """<!-- FishyJoes.export(describeAProtocol) -->"""
    with fishyjoes_runtime.local_handles(value, x, y) as (_valueHandle, _xHandle, _yHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ProtocolFixtures_describeAProtocol(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
                _xHandle,
                _yHandle,
            ),
            str
        )

def return_a_protocol(
    value: testapi.AProtocol,
) -> testapi.AProtocol:
    """<!-- FishyJoes.export(returnAProtocol) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ProtocolFixtures_returnAProtocol(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            testapi.AProtocol
        )
