from . import _shade_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class Shade:
    """A type whose name matches a case of ``ShadowBox``. Inside ShadowBox's"""
    """generated Python class body, the case-type attribute (`Shade: ClassVar[...]`)"""
    """shadows this type's import, so annotations meaning this type must resolve"""
    """through a module-level alias in the generated stub."""
    """<!-- FishyJoes.export(Shade) -->"""

    darkness: float

    def __init__(
        self,
        darkness: float,
    ) -> None:
        self.darkness = darkness

    def __repr__(self) -> str:
        return f'testapi.Shade(darkness={self.darkness!r})'
