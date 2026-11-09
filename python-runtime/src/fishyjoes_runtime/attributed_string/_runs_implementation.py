from __future__ import annotations

import typing

import fishyjoes_runtime
from .._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_get_Foundation_AttributedString_Runs_endIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_Runs_endIndex'))

iota_get_Foundation_AttributedString_Runs_startIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_Runs_startIndex'))

iota_Foundation_AttributedString_Runs_indexBefore: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_Runs_indexBefore'))

iota_Foundation_AttributedString_Runs_indexAfter: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_Runs_indexAfter'))

iota_Foundation_AttributedString_Runs_elementAt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_Runs_elementAt'))

iota_Foundation_AttributedString_Runs_elementAtPosition: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_Runs_elementAtPosition'))

iota_Foundation_AttributedString_Runs_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_Runs_equals'))

iota_get_Foundation_AttributedString_Runs_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_Runs_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.attributed_string.Runs(ref))

# MARK: setup
