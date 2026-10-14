from __future__ import annotations
from .. import _results_implementation as _impl
from .. import _testapi_exported as testapi
from ._error_type import Error
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "Error",
    "get_a_failure",
    "get_a_success",
    "process_result",
]

def get_a_failure() -> fishyjoes_runtime.Result[int,testapi.results.Error]:
    """<!-- FishyJoes.export(aFailure) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Results_a_failure(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.ResultSuccess, fishyjoes_runtime.ResultFailure)

def get_a_success() -> fishyjoes_runtime.Result[int,testapi.results.Error]:
    """<!-- FishyJoes.export(aSuccess) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Results_a_success(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.ResultSuccess, fishyjoes_runtime.ResultFailure)

def process_result(
    result: fishyjoes_runtime.Result[str,testapi.results.Error],
) -> str:
    """<!-- FishyJoes.export(processResult) -->"""
    with fishyjoes_runtime.local_handles(result) as (_resultHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Results_processResult(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _resultHandle,
            ),
            str
        )
