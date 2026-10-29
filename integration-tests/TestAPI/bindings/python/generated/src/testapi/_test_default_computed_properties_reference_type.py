from __future__ import annotations
from ._test_default_computed_properties_type import TestDefaultComputedProperties # early import to make cycles work correctly
from . import _test_default_computed_properties_reference_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

class TestDefaultComputedPropertiesReference(fishyjoes_runtime.SwiftReference, TestDefaultComputedProperties):
    """<!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->"""

    @property
    @typing.override
    def noot(self) -> int:
        """<!-- FishyJoes.export(noot) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @noot.setter
    @typing.override
    def noot(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            _impl.iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value)

    @property
    @typing.override
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def spam(self) -> bool:
        """<!-- FishyJoes.export(spam) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @spam.setter
    def spam(self, new_value: bool) -> None:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            _impl.iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value)

    @staticmethod
    def init(
        spam: bool,
        noot: int,
    ) -> testapi.TestDefaultComputedPropertiesReference:
        """<!-- FishyJoes.export(init) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_TestDefaultComputedPropertiesClass_init(
                fishyjoes_runtime.Runtime.shared.env_ref,
                spam,
                noot,
            ),
            testapi.TestDefaultComputedPropertiesReference
        )
