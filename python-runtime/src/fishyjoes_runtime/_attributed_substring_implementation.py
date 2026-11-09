from __future__ import annotations

import typing

import fishyjoes_runtime
from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_get_Foundation_AttributedSubstring_base: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_base'))

iota_get_Foundation_AttributedSubstring_characters: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_characters'))

iota_get_Foundation_AttributedSubstring_endIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_endIndex'))

iota_get_Foundation_AttributedSubstring_runs: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_runs'))

iota_get_Foundation_AttributedSubstring_startIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_startIndex'))

iota_get_Foundation_AttributedSubstring_string: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_string'))

iota_get_Foundation_AttributedSubstring_substring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_substring'))

iota_get_Foundation_AttributedSubstring_unicodeScalars: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_unicodeScalars'))

iota_Foundation_AttributedSubstring_substringForRange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedSubstring_substringForRange'))

iota_Foundation_AttributedSubstring_createEmpty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedSubstring_createEmpty'))

iota_Foundation_AttributedSubstring_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedSubstring_equals'))

iota_get_Foundation_AttributedSubstring_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedSubstring_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.AttributedSubstring(ref))

# MARK: setup
