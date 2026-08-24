"""Shared Iota runtime for FishyJoes-generated Python binding packages.

Generated wheels depend on this package: each binding constructs a
RuntimeConfig and calls Runtime to load its native libraries and
obtain the runtime namespace its generated modules bind against.
"""

from fishyjoes_runtime._fishyjoesruntime_c_api import ffi
from fishyjoes_runtime.loader_collections import setup_collections
from fishyjoes_runtime.loader_environment import setup_environment
from fishyjoes_runtime.loader_future import setup_futures
from fishyjoes_runtime.loader_misc import setup_misc
from fishyjoes_runtime.loader_primitives import setup_primitives
from fishyjoes_runtime.loader_tuple import setup_tuples
from fishyjoes_runtime.result import Result, ResultFailure, ResultSuccess, setup_results
from fishyjoes_runtime.runtime import FishyJoesRuntime
from fishyjoes_runtime.swift_function_impl import setup_functions
from fishyjoes_runtime.swift_range import SwiftClosedRange, SwiftRange, setup_ranges
from fishyjoes_runtime.swift_reference import SwiftReference, setup_references


def _runtime_setup() -> None:
    FishyJoesRuntime.shared = FishyJoesRuntime(setup_environment())
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


ffi.init_once(_runtime_setup, "fishyjoes_runtime_setup")

__all__ = [
    "FishyJoesRuntime",
    "SwiftReference",
    "Result", "ResultSuccess", "ResultFailure",
    "SwiftRange", "SwiftClosedRange",
]
