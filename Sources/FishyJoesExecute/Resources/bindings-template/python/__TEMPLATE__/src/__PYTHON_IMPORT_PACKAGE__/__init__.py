# __AUTOGEN_WARNING__

from . import _native
from . import _exports
from ._diagnostics import diagnostics
from ._native import ResultFailure, ResultSuccess, SwiftClosedRange, SwiftRange
from ._exports import *

SUPPORTED = _native.SUPPORTED


__all__ = ["SUPPORTED", "ResultFailure", "ResultSuccess", "SwiftClosedRange", "SwiftRange", "diagnostics"] + _exports.__all__
