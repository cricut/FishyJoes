from __future__ import annotations
from .. import _bytes_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_bytes",
    "get_data",
    "echo_bytes",
    "echo_data",
]

def get_bytes() -> list[int]:
    """<!-- FishyJoes.export(bytes, cSharp: TheBytes) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Bytes_bytes(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_data() -> bytes:
    """<!-- FishyJoes.export(data) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Bytes_data(fishyjoes_runtime.Runtime.shared.env_ref), bytes)

def echo_bytes(
    bytes_: list[int],
) -> list[int]:
    """<!-- FishyJoes.export(echoBytes) -->"""
    with fishyjoes_runtime.local_handles(bytes_) as (_bytesHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Bytes_echoBytes(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _bytesHandle,
            ),
            list
        )

def echo_data(
    data: bytes,
) -> bytes:
    """<!-- FishyJoes.export(echoData) -->"""
    with fishyjoes_runtime.local_handles(data) as (_dataHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Bytes_echoData(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _dataHandle,
            ),
            bytes
        )
