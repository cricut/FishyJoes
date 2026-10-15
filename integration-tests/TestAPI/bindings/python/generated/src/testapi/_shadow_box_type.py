from __future__ import annotations
from . import _shadow_box_implementation as _impl
from . import _testapi_exported as testapi
from . import shadow_box
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class _BaseShadowBox:
    """<!-- FishyJoes.export(ShadowBox) -->"""

    @property
    def all_shades(self) -> list[testapi.Shade]:
        """<!-- FishyJoes.export(allShades) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ShadowBox_allShades(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), list)

# String type syntax used to avoid circular import problems at runtime
ShadowBox: typing.TypeAlias = typing.Union[
    'shadow_box.Shade',
    'shadow_box.Empty',
]
