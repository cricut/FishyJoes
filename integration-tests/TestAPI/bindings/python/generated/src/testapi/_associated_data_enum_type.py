from . import _associated_data_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import associated_data_enum
import fishyjoes_runtime
import types
import typing

class _BaseAssociatedDataEnum:
    """<!-- FishyJoes.export(AssociatedDataEnum) -->"""

    @property
    def intValue(self) -> int:
        """<!-- FishyJoes.export(intValue) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AssociatedDataEnum_intValue(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    # TODO: static field staticThing
    def plus(
        self,
        other: testapi.AssociatedDataEnum,
    ) -> testapi.AssociatedDataEnum:
        """<!-- FishyJoes.export(plus) -->"""
        with fishyjoes_runtime.local_handles(self, other) as (_selfHandle, _otherHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AssociatedDataEnum_plus(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _otherHandle,
                ),
                testapi.associated_data_enum.Thing, testapi.associated_data_enum.Other, testapi.associated_data_enum.Bar, testapi.associated_data_enum.NoValue, testapi.associated_data_enum.None_, testapi.associated_data_enum.SimpleEnum
            )

AssociatedDataEnum: typing.TypeAlias = typing.Union[
    associated_data_enum.Thing,
    associated_data_enum.Other,
    associated_data_enum.Bar,
    associated_data_enum.NoValue,
    associated_data_enum.None_,
    associated_data_enum.SimpleEnum,
]
