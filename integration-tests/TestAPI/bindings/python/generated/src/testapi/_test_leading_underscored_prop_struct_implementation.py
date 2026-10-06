from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._test_leading_underscored_prop_struct_type import TestLeadingUnderscoredPropStruct
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    leadingUnderscoreProp_: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TestLeadingUnderscoredPropStruct(
        leadingUnderscoreProp_ = fishyjoes_runtime.consume_ref(leadingUnderscoreProp_, str),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_leadingUnderscoreProp_(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, TestLeadingUnderscoredPropStruct).leadingUnderscoreProp_)

@fishyjoes_runtime.callback('TODO[setter_type]')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_leadingUnderscoreProp_(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef):
    fishyjoes_runtime.peek_ref(obj, TestLeadingUnderscoredPropStruct).leadingUnderscoreProp_ = fishyjoes_runtime.consume_ref(newValue, str)

# MARK: setup

# TODO: setup for testapi.TestLeadingUnderscoredPropStruct
