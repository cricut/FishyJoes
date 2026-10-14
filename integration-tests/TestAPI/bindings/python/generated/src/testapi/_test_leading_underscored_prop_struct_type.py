from __future__ import annotations
from . import _test_leading_underscored_prop_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestLeadingUnderscoredPropStruct(testapi.TestLeadingUnderscoredProp):
    """<!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->"""

    leading_underscore_prop_: str

    def __init__(
        self,
        leading_underscore_prop_: str,
    ) -> None:
        self.leading_underscore_prop_ = leading_underscore_prop_

    def __repr__(self) -> str:
        return f'testapi.TestLeadingUnderscoredPropStruct(leading_underscore_prop_={self.leading_underscore_prop_!r})'
