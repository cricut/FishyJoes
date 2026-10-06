from . import _testapi_exported as testapi
from . import _tree_implementation as _impl
import fishyjoes_runtime
import types
import typing

class Tree:
    """<!-- FishyJoes.export(Tree) -->"""

    value: typing.Final[int]
    children: typing.Final[list[testapi.Tree]]

    def __init__(
        self,
        value: int,
        children: list[testapi.Tree],
    ) -> None:
        self.value = value
        self.children = children

    def __repr__(self) -> str:
        return f'testapi.Tree(value={self.value!r}, children={self.children!r})'
