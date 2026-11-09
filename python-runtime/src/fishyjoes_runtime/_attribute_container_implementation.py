from __future__ import annotations

import typing

import fishyjoes_runtime
from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_FishyJoesCommonRuntime_AttributeContainer_merge: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    bool,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_merge'))

iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty'))

iota_FishyJoesCommonRuntime_AttributeContainer_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_equals'))

iota_get_FishyJoesCommonRuntime_AttributeContainer_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.AttributeContainer(ref))

# MARK: setup
