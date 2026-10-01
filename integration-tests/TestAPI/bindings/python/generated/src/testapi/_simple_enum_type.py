from . import _simple_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import simple_enum
import fishyjoes_runtime
import types
import typing

class _BaseSimpleEnum:
    """This is an enum with no associated values"""
    """<!-- FishyJoes.export(SimpleEnum) -->"""

    # TODO: static field favoriteColor
    @property
    def hex(self) -> int:
        """<!-- FishyJoes.export(hex) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_SimpleEnum_hex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @staticmethod
    def pickAColor(
        rawValue: int,
    ) -> testapi.SimpleEnum | None:
        """<!-- FishyJoes.export(pickAColor) -->"""
        with fishyjoes_runtime.local_handles(rawValue) as (_rawValueHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_SimpleEnum_pickAColor(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _rawValueHandle,
                ),
                testapi.simple_enum.Red, testapi.simple_enum.Green, testapi.simple_enum.Blue, types.NoneType
            )

    def hexMethod(
        self,
    ) -> str:
        """<!-- FishyJoes.export(hexMethod) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_SimpleEnum_hexMethod(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )

    @staticmethod
    def resetFavoriteColor(
    ) -> None:
        """<!-- FishyJoes.export(resetFavoriteColor) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_SimpleEnum_resetFavoriteColor(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            types.NoneType
        )

SimpleEnum: typing.TypeAlias = typing.Union[
    simple_enum.Red,
    simple_enum.Green,
    simple_enum.Blue,
]
