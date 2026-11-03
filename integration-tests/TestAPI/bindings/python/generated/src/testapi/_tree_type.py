from __future__ import annotations
from . import _testapi_exported as testapi
from . import _tree_implementation as _impl
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class Tree:
    """<!-- FishyJoes.export(Tree) -->"""

    value: typing.Final[int]
    children: typing.Final[list[testapi.Tree]]
    __slots__: list[str] = [
        'value',
        'children',
    ]

    def __init__(
        self,
        value: int,
        children: list[testapi.Tree],
    ) -> None:
        self.value = value
        self.children = children

    def __repr__(self) -> str:
        return f'testapi.Tree(...)'

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, Tree) and \
            self.value == other.value and \
            self.children == other.children and \
            True
