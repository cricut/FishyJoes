from __future__ import annotations

import typing

import fishyjoes_runtime
from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib

# MARK: C APIs

iota_get_Foundation_AttributedString_characters: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_characters'))

iota_get_Foundation_AttributedString_endIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_endIndex'))

iota_get_Foundation_AttributedString_runs: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_runs'))

iota_get_Foundation_AttributedString_startIndex: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_startIndex'))

iota_get_Foundation_AttributedString_string: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_string'))

iota_get_Foundation_AttributedString_substring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_substring'))

iota_get_Foundation_AttributedString_unicodeScalars: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_unicodeScalars'))

iota_Foundation_AttributedString_substringForRange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_substringForRange'))

iota_Foundation_AttributedString_append: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_append'))

iota_Foundation_AttributedString_appendSubstring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_appendSubstring'))

iota_Foundation_AttributedString_insert: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_insert'))

iota_Foundation_AttributedString_insertSubstring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_insertSubstring'))

iota_Foundation_AttributedString_replaceSubrange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_replaceSubrange'))

iota_Foundation_AttributedString_replaceSubrangeWithSubstring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_replaceSubrangeWithSubstring'))

iota_Foundation_AttributedString_removeSubrange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_removeSubrange'))

iota_Foundation_AttributedString_setAttributes: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_setAttributes'))

iota_Foundation_AttributedString_setAttributesForRange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_setAttributesForRange'))

iota_Foundation_AttributedString_mergeAttributes: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    bool,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_mergeAttributes'))

iota_Foundation_AttributedString_mergeAttributesForRange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    bool,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_mergeAttributesForRange'))

iota_Foundation_AttributedString_replaceAttributes: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_replaceAttributes'))

iota_Foundation_AttributedString_replaceAttributesForRange: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], None] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_replaceAttributesForRange'))

iota_Foundation_AttributedString_createEmpty: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_createEmpty'))

iota_Foundation_AttributedString_create: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_create'))

iota_Foundation_AttributedString_createFromSubstring: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_createFromSubstring'))

iota_Foundation_AttributedString_equals: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], bool] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_Foundation_AttributedString_equals'))

iota_get_Foundation_AttributedString_hash: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], int] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_fishyjoes_runtime_lib, '__iota_get_Foundation_AttributedString_hash'))

# MARK: C callback implementations

@fishyjoes_runtime.callback('FishyJoes_ReferenceConstructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.AttributedString(ref))

# MARK: setup
