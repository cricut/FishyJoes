from . import _external_witness__test_leading_underscored_prop_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestLeadingUnderscoredProp(fishyjoes_runtime.SwiftReference, testapi.TestLeadingUnderscoredProp):
    """<!-- FishyJoes.export(TestLeadingUnderscoredProp) -->"""

    @property
    def leadingUnderscoreProp_(self) -> str:
        """<!-- FishyJoes.export(_leadingUnderscoreProp) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)
