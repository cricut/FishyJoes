from __future__ import annotations
from . import _test_leading_underscored_prop_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import abc
import fishyjoes_runtime
import types
import typing

class TestLeadingUnderscoredProp(abc.ABC):
    """<!-- FishyJoes.export(TestLeadingUnderscoredProp) -->"""

    @property
    def leading_underscore_prop_(self) -> str:
        """<!-- FishyJoes.export(_leadingUnderscoreProp) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestLeadingUnderscoredProp_leading_underscore_prop_(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)
