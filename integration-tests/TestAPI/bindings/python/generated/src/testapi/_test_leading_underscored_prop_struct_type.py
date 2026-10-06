from . import _test_leading_underscored_prop_struct_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestLeadingUnderscoredPropStruct(testapi.TestLeadingUnderscoredProp):
    """<!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->"""

    leadingUnderscoreProp_: str

    def __init__(
        self,
        leadingUnderscoreProp_: str,
    ) -> None:
        self.leadingUnderscoreProp_ = leadingUnderscoreProp_

    def __repr__(self) -> str:
        return f'testapi.TestLeadingUnderscoredPropStruct(leadingUnderscoreProp_={self.leadingUnderscoreProp_!r})'
