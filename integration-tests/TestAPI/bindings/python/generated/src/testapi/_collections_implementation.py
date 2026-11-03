from __future__ import annotations
from . import _testapi_exported as testapi
from . import collections
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

iota_get_TestAPI_Collections_arrayOfBigTuples: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_arrayOfBigTuples'))

iota_get_TestAPI_Collections_arrayOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_arrayOfInt'))

iota_get_TestAPI_Collections_defaultCollectionHolder: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_defaultCollectionHolder'))

iota_get_TestAPI_Collections_dictionaryOfIntToInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_dictionaryOfIntToInt'))

iota_get_TestAPI_Collections_maybeArrayOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeArrayOfInt'))

iota_get_TestAPI_Collections_maybeArrayOfMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeArrayOfMaybeInt'))

iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt'))

iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt'))

iota_get_TestAPI_Collections_maybeSetOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeSetOfInt'))

iota_get_TestAPI_Collections_maybeSetOfMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_maybeSetOfMaybeInt'))

iota_get_TestAPI_Collections_setOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_get_TestAPI_Collections_setOfInt'))

iota_TestAPI_Collections_echoArrayOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoArrayOfInt'))

iota_TestAPI_Collections_echoSetOfInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoSetOfInt'))

iota_TestAPI_Collections_echoDictionaryOfIntToInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoDictionaryOfIntToInt'))

iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt'))

iota_TestAPI_Collections_echoMaybeSetOfMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoMaybeSetOfMaybeInt'))

iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt'))

iota_TestAPI_Collections_collectionMapper: typing.Callable[[
    fishyjoes_runtime.EnvRef,
    fishyjoes_runtime.UnownedRef,
    fishyjoes_runtime.UnownedRef,
], fishyjoes_runtime.CreatedRef] = \
    fishyjoes_runtime.raise_by_out_ref(getattr(_testapi_lib, '__iota_TestAPI_Collections_collectionMapper'))

# MARK: C callback implementations

# MARK: setup

# TODO: setup for testapi.Collections
