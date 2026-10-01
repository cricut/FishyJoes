from .. import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._external_witness__test_leading_underscored_prop_type import ExternalWitness_TestLeadingUnderscoredProp
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, "TODO"))

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_new]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(ExternalWitness_TestLeadingUnderscoredProp(ref))

# MARK: setup

# TODO: setup for ExternalWitness_TestLeadingUnderscoredProp
