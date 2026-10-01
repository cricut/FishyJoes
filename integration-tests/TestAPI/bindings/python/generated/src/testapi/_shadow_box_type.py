from . import _shadow_box_implementation as _impl
from . import _testapi_exported as testapi
from . import shadow_box
import fishyjoes_runtime
import types
import typing

class _BaseShadowBox:
    """<!-- FishyJoes.export(ShadowBox) -->"""

    @property
    def allShades(self) -> list[testapi.Shade]:
        """<!-- FishyJoes.export(allShades) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ShadowBox_allShades(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), list)

    @staticmethod
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

ShadowBox: typing.TypeAlias = typing.Union[
    shadow_box.Shade,
    shadow_box.Empty,
]
