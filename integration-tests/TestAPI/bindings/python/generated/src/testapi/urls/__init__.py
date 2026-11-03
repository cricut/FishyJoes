from __future__ import annotations
from .. import _testapi_exported as testapi
from .. import _urls_implementation as _impl
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_data_image",
    "get_local_file",
    "get_remote_file",
    "get_simple",
    "echo",
]

def get_data_image() -> str:
    """<!-- FishyJoes.export(dataImage) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_URLs_dataImage(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_local_file() -> str:
    """<!-- FishyJoes.export(localFile) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_URLs_localFile(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_remote_file() -> str:
    """<!-- FishyJoes.export(remoteFile) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_URLs_remoteFile(fishyjoes_runtime.Runtime.shared.env_ref), str)

def get_simple() -> str:
    """<!-- FishyJoes.export(simple) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_URLs_simple(fishyjoes_runtime.Runtime.shared.env_ref), str)

def echo(
    url: str,
) -> str:
    """<!-- FishyJoes.export(echo) -->"""
    with fishyjoes_runtime.local_handles(url) as (_urlHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_URLs_echo(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _urlHandle,
            ),
            str
        )
