from __future__ import annotations

import typing

import fishyjoes_runtime
from .._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier'))

iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier'))

iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link'))

iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link'))

iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty'))

iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer'))

iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals'))

iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.attribute_container.FoundationAttributes(ref))

# MARK: setup
