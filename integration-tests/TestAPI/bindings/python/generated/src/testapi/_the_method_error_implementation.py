from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from ._the_method_error_type import TheMethodError
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_new]')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(TheMethodError(ref))

# MARK: setup

# TODO: setup for testapi.TheMethodError
