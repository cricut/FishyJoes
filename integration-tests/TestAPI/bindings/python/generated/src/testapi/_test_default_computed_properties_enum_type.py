from . import _test_default_computed_properties_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import test_default_computed_properties_enum
import fishyjoes_runtime
import types
import typing

class _BaseTestDefaultComputedPropertiesEnum(testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->"""

    @property
    def noot(self) -> int:
        """<!-- FishyJoes.export(noot) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @property
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def spam(self) -> bool:
        """<!-- FishyJoes.export(spam) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), bool)

TestDefaultComputedPropertiesEnum: typing.TypeAlias = typing.Union[
    test_default_computed_properties_enum.Qux,
]
