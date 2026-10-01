"""Shared Iota runtime for FishyJoes-generated Python binding packages.

Generated wheels depend on this package: each binding constructs a
RuntimeConfig and calls Runtime to load its native libraries and
obtain the runtime namespace its generated modules bind against.
"""
from ._fishyjoesruntime_c_api import callback, eval_once_now, ffi, lazy_once
from .ffi_types import CREATED_REF_NULL, ConsumedRef, ConsumedRefArray, ConsumedSwiftRef, CreatedRef, CreatedRefArray, \
    CreatedSwiftRef, EnvRef, OutCreatedRef, Pointer, UTF16CString, UTF8CString, UnownedRef, UnownedRefArray, \
    UnownedSwiftRef
from .loader_collections import FishyJoesCommonRuntime_ArrayConverter_setup, \
    FishyJoesCommonRuntime_DictionaryConverter_setup, FishyJoesCommonRuntime_SetConverter_setup, \
    setup_collections
from .loader_environment import setup_environment
from .loader_future import Future, setup_futures
from .loader_misc import setup_misc
from .loader_primitives import setup_primitives
from .loader_tuple import FishyJoesCommonRuntime_Tuple2Converter_setup, FishyJoesCommonRuntime_Tuple3Converter_setup, \
    FishyJoesCommonRuntime_Tuple4Converter_setup, FishyJoesCommonRuntime_Tuple5Converter_setup, \
    FishyJoesCommonRuntime_Tuple6Converter_setup, FishyJoesCommonRuntime_Tuple6Converter_setup, setup_tuples
from .result import Result, ResultFailure, ResultSuccess, setup_results
from .runtime import Runtime, assert_type, call_with_raise_by_out_ref, catch_by_out_ref, consume_created_ref, \
    consume_ref, create_consumed_ref, create_ref, local_handles, peek_ref, raise_by_out_ref
from .swift_function_impl import setup_functions
from .swift_range import SwiftClosedRange, SwiftRange, setup_ranges
from .swift_reference import SwiftReference, setup_references


@lazy_once("fishyjoes_runtime_setup")
def _ensure_loaded() -> None:
    Runtime.shared = Runtime(setup_environment())
    setup_primitives()
    setup_collections()
    setup_tuples()
    setup_ranges()
    setup_results()
    setup_references()
    setup_functions()
    setup_misc()
    # setup_attributed_string()
    setup_futures()

__all__ = [
    "CREATED_REF_NULL", "callback", "eval_once_now", "ffi", "lazy_once",

    "Pointer",
    "CreatedRef", "UnownedRef", "ConsumedRef",
    "CreatedSwiftRef", "UnownedSwiftRef", "ConsumedSwiftRef",
    "OutCreatedRef", "CreatedRefArray", "UnownedRefArray", "ConsumedRefArray",
    "EnvRef", "UTF8CString", "UTF16CString",

    "local_handles",

    "catch_by_out_ref", "call_with_raise_by_out_ref", "raise_by_out_ref",
    "create_ref", "create_consumed_ref", "assert_type", "peek_ref", "consume_ref", "consume_created_ref",

    "Runtime",
    "SwiftReference",
    "Result", "ResultSuccess", "ResultFailure",
    "SwiftRange", "SwiftClosedRange",
    "Future",
]
