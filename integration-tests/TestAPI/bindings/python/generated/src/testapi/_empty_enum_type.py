from __future__ import annotations
from . import _empty_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import empty_enum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

EmptyEnum: typing.TypeAlias = typing.Never
