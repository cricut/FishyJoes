from __future__ import annotations
from ._test_leading_underscored_prop_type import TestLeadingUnderscoredProp # early import to make cycles work correctly
from . import _test_leading_underscored_prop_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestLeadingUnderscoredPropStruct(TestLeadingUnderscoredProp):
    """<!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->"""

    leading_underscore_prop_: str
    __slots__: list[str] = [
        'leading_underscore_prop_',
    ]

    def __init__(
        self,
        leading_underscore_prop_: str,
    ) -> None:
        self.leading_underscore_prop_ = leading_underscore_prop_

    def __repr__(self) -> str:
        return f'testapi.TestLeadingUnderscoredPropStruct(...)'

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, TestLeadingUnderscoredPropStruct) and \
            self.leading_underscore_prop_ == other.leading_underscore_prop_ and \
            True
