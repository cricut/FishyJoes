from __future__ import annotations
from ._test_default_computed_properties_type import TestDefaultComputedProperties # early import to make cycles work correctly
from . import _test_default_computed_properties_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestDefaultComputedPropertiesStruct(TestDefaultComputedProperties):
    """<!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->"""

    spam: bool
    noot: int
    __slots__: list[str] = [
        'spam',
        'noot',
    ]

    def __init__(
        self,
        spam: bool,
        noot: int,
    ) -> None:
        self.spam = spam
        self.noot = noot

    def __repr__(self) -> str:
        return f'testapi.TestDefaultComputedPropertiesStruct(...)'

    @property
    @typing.override
    def plutonic(self) -> str:
        """<!-- FishyJoes.export(plutonic) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, TestDefaultComputedPropertiesStruct) and \
            self.spam == other.spam and \
            self.noot == other.noot and \
            True
