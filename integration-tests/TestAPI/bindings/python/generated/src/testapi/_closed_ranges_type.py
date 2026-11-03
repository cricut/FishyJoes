from __future__ import annotations
from . import _closed_ranges_implementation as _impl
from . import _testapi_exported as testapi
from . import closed_ranges
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

ClosedRanges: typing.TypeAlias = typing.Never
