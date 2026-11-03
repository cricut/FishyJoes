from __future__ import annotations
from .. import _simple_enum_implementation as _impl
from .. import _testapi_exported as testapi
from .blue import Blue
from .green import Green
from .red import Red
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "Red",
    "Green",
    "Blue",
    "get_favorite_color",
    "set_favorite_color",
    "pick_a_color",
    "reset_favorite_color",
]

def get_favorite_color() -> testapi.SimpleEnum:
    """<!-- FishyJoes.export(favoriteColor) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_SimpleEnum_favoriteColor(fishyjoes_runtime.Runtime.shared.env_ref), testapi.simple_enum.Red, testapi.simple_enum.Green, testapi.simple_enum.Blue)

def set_favorite_color(new_value: testapi.SimpleEnum) -> None:
    with fishyjoes_runtime.local_handles(new_value) as (new_value_handle,):
        _impl.iota_set_TestAPI_SimpleEnum_favoriteColor(fishyjoes_runtime.Runtime.shared.env_ref, new_value_handle)

def pick_a_color(
    raw_value: int,
) -> testapi.SimpleEnum | None:
    """<!-- FishyJoes.export(pickAColor) -->"""
    return fishyjoes_runtime.consume_created_ref(
        _impl.iota_TestAPI_SimpleEnum_pickAColor(
            fishyjoes_runtime.Runtime.shared.env_ref,
            raw_value,
        ),
        testapi.simple_enum.Red, testapi.simple_enum.Green, testapi.simple_enum.Blue, types.NoneType
    )

def reset_favorite_color(
) -> None:
    """<!-- FishyJoes.export(resetFavoriteColor) -->"""
    return _impl.iota_TestAPI_SimpleEnum_resetFavoriteColor(
        fishyjoes_runtime.Runtime.shared.env_ref,
    )
