from . import _external_witness__test_default_computed_properties_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestDefaultComputedProperties(fishyjoes_runtime.SwiftReference, testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedProperties) -->"""

    @property
    def noot(self) -> int:
        """<!-- FishyJoes.export(noot) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedProperties_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @property
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedProperties_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)
