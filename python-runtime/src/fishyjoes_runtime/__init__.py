"""Shared Iota runtime for FishyJoes-generated Python binding packages.

Generated wheels depend on this package: each binding constructs a
RuntimeConfig and calls Runtime to load its native libraries and
obtain the runtime namespace its generated modules bind against.
"""
from ._fishyjoesruntime_c_api import callback, eval_once_now, ffi, lazy_once, platform_shared_lib_name
from .ffi_types import CREATED_REF_NULL, ConsumedRef, ConsumedRefArray, ConsumedSwiftRef, CreatedRef, CreatedRefArray, \
    CreatedSwiftRef, EnvRef, OutCreatedRef, Pointer, UTF16CString, UTF8CString, UnownedRef, UnownedRefArray, \
    UnownedSwiftRef
from .loader_future import Future
from .loader_misc import URI
from .result import Result, ResultFailure, ResultSuccess, SwiftException
from .runtime import CStringBag, Runtime, assert_type, catch_by_out_ref, \
    consume_created_ref, consume_ref, create_consumed_ref, create_ref, local_handles, peek_ref, raise_by_out_ref
from .swift_range import Comparable, SwiftClosedRange, SwiftRange
from .swift_reference import SwiftReference

from . import attribute_container, attributed_string, fishyjoes_type_setup
from ._attribute_container_type import AttributeContainer
from ._attributed_string_type import AttributedString
from ._attributed_substring_type import AttributedSubstring

fishyjoes_type_setup.ensure_loaded()

__all__ = [
    "CREATED_REF_NULL", "callback", "eval_once_now", "ffi", "lazy_once", "platform_shared_lib_name",

    "Pointer",
    "CreatedRef", "UnownedRef", "ConsumedRef",
    "CreatedSwiftRef", "UnownedSwiftRef", "ConsumedSwiftRef",
    "OutCreatedRef", "CreatedRefArray", "UnownedRefArray", "ConsumedRefArray",
    "EnvRef", "UTF8CString", "UTF16CString",

    "local_handles",

    "catch_by_out_ref", "raise_by_out_ref",
    "create_ref", "create_consumed_ref", "assert_type", "peek_ref", "consume_ref", "consume_created_ref",

    "URI",
    "Runtime", "CStringBag",
    "SwiftReference",
    "SwiftException",
    "Result", "ResultSuccess", "ResultFailure",
    "SwiftRange", "SwiftClosedRange", "Comparable",
    "Future",

    "AttributedString", "AttributedSubstring", "AttributeContainer",
    "attributed_string", "attribute_container",
]
