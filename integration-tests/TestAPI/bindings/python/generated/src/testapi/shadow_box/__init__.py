from __future__ import annotations
from .. import _shadow_box_implementation as _impl
from .. import _testapi_exported as testapi
from ._empty_type import Empty
from ._shade_type import Shade
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "Empty",
    "Shade",
    "darkest",
]

def darkest(
    shades: list[testapi.Shade],
) -> testapi.Shade | None:
    """<!-- FishyJoes.export(darkest) -->"""
    with fishyjoes_runtime.local_handles(shades) as (_shadesHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ShadowBox_darkest(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _shadesHandle,
            ),
            testapi.Shade, types.NoneType
        )
