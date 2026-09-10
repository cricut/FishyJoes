@dataclasses.dataclass
class Tree:
    """<!-- FishyJoes.export(Tree) -->"""
    value: Final[int]
    children: Final[list[testapi.Tree]]
