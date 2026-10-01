from . import _testapi_exported as testapi
from . import _tree_implementation as _impl
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class Tree:
    """<!-- FishyJoes.export(Tree) -->"""
    value: typing.Final[int]
    children: typing.Final[list[testapi.Tree]]
