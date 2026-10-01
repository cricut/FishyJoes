from . import _test_leading_underscored_prop_struct_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class TestLeadingUnderscoredPropStruct(testapi.TestLeadingUnderscoredProp):
    """<!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->"""
    _leadingUnderscoreProp: str
