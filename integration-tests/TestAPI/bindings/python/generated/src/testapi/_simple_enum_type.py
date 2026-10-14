from __future__ import annotations
from . import _simple_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import simple_enum
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class _BaseSimpleEnum:
    """This is an enum with no associated values"""
    """<!-- FishyJoes.export(SimpleEnum) -->"""

    @property
    def hex(self) -> int:
        """<!-- FishyJoes.export(hex) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_SimpleEnum_hex(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    def hex_method(
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

# String type syntax used to avoid circular import problems at runtime
SimpleEnum: typing.TypeAlias = typing.Union[
    'simple_enum.Red',
    'simple_enum.Green',
    'simple_enum.Blue',
]
