from __future__ import annotations
from . import _external_witness__test_properties_protocol_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestPropertiesProtocol(fishyjoes_runtime.SwiftReference, testapi.TestPropertiesProtocol):
    """<!-- FishyJoes.export(TestPropertiesProtocol) -->"""

    @property
    @typing.override
    def corge(self) -> str:
        """<!-- FishyJoes.export(corge) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestPropertiesProtocol_corge(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    @typing.override
    def frobby(self) -> list[int]:
        """<!-- FishyJoes.export(frobby) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestPropertiesProtocol_frobby(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), list)
