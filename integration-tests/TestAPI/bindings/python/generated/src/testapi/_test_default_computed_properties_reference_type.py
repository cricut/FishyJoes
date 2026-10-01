from . import _test_default_computed_properties_reference_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestDefaultComputedPropertiesReference(fishyjoes_runtime.SwiftReference, testapi.TestDefaultComputedProperties):
    """<!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->"""

    @property
    def noot(self) -> int:
        """<!-- FishyJoes.export(noot) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @noot.setter
    def noot(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def spam(self) -> bool:
        """<!-- FishyJoes.export(spam) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), bool)

    @spam.setter
    def spam(self, new_value: bool) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @staticmethod
    def init(
        spam: bool,
        noot: int,
    ) -> testapi.TestDefaultComputedPropertiesReference:
        """<!-- FishyJoes.export(init) -->"""
        with fishyjoes_runtime.local_handles(spam, noot) as (_spamHandle, _nootHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestDefaultComputedPropertiesClass_init(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _spamHandle,
                    _nootHandle,
                ),
                testapi.TestDefaultComputedPropertiesReference
            )
