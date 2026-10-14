from __future__ import annotations
from .. import _structs_implementation as _impl
from .. import _testapi_exported as testapi
from ._memberwise_struct_type import MemberwiseStruct
from ._mutable_struct_type import MutableStruct
from ._reference_struct_type import ReferenceStruct
from ._twenty_one_item_struct_type import TwentyOneItemStruct
from warnings import deprecated
import fishyjoes_runtime
import types
import typing



__all__: list[str] = [
    "MemberwiseStruct",
    "MutableStruct",
    "ReferenceStruct",
    "TwentyOneItemStruct",
]
