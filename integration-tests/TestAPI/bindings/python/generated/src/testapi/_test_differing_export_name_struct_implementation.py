from __future__ import annotations
from . import _testapi_exported as testapi
from ._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_TestDifferingExportNameStruct_constructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    tata: int
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.TestDifferingExportNameStruct(
        tata = tata,
    ))

@fishyjoes_runtime.callback('TestAPI_TestDifferingExportNameStruct_tataGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=0)
def ffi_get_tata(obj: fishyjoes_runtime.UnownedRef) -> int:
    return fishyjoes_runtime.peek_ref(obj, testapi.TestDifferingExportNameStruct).tata

@fishyjoes_runtime.callback('TestAPI_TestDifferingExportNameStruct_tataSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def ffi_set_tata(obj: fishyjoes_runtime.UnownedRef, newValue: int) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.TestDifferingExportNameStruct).tata = newValue

# MARK: setup

# TODO: setup for testapi.TestDifferingExportNameStruct
