from . import _test_default_computed_properties_struct_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class TestDefaultComputedPropertiesStruct(testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->"""
    spam: bool
    noot: int

    @property
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)
