"""FishyJoes runtime for Python bindings to Swift libraries."""

from fishyjoes_runtime.loader import Loader
from fishyjoes_runtime.result import (
    Failure,
    Result,
    ResultHelpers,
    Success,
    failure,
    success,
)
from fishyjoes_runtime.swift_range import (
    IntClosedRange,
    IntRange,
    SwiftClosedRange,
    SwiftRange,
    closed_range_from,
    range_from,
)
from fishyjoes_runtime.swift_reference import SwiftReference
from fishyjoes_runtime.utilities import NullPointerError, SwiftError

__version__ = "0.0.1"

__all__ = [
    # Core
    "Loader",
    # Result type
    "Result",
    "Success",
    "Failure",
    "ResultHelpers",
    "success",
    "failure",
    # Swift types
    "SwiftReference",
    "SwiftRange",
    "SwiftClosedRange",
    "IntRange",
    "IntClosedRange",
    "range_from",
    "closed_range_from",
    # Errors
    "SwiftError",
    "NullPointerError",
    # Version
    "__version__",
]
