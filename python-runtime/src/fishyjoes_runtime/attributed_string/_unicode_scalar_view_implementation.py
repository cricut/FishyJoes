from __future__ import annotations

import typing

import fishyjoes_runtime
from .._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_UnicodeScalarView_endIndex'))

iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_UnicodeScalarView_startIndex'))

iota_Foundation_AttributedString_UnicodeScalarView_indexBefore: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_UnicodeScalarView_indexBefore'))

iota_Foundation_AttributedString_UnicodeScalarView_indexAfter: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_UnicodeScalarView_indexAfter'))

iota_Foundation_AttributedString_UnicodeScalarView_elementAt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_UnicodeScalarView_elementAt'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.attributed_string.UnicodeScalarView(ref))

# MARK: setup
