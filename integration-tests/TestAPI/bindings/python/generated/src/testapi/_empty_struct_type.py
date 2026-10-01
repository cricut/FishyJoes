from . import _empty_struct_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class EmptyStruct:
    """<!-- FishyJoes.export(EmptyStruct) -->"""

    @property
    def tatiana(self) -> str:
        """<!-- FishyJoes.export(tatiana) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyStruct_tatiana(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def tutu(self) -> int:
        """<!-- FishyJoes.export(tutu) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyStruct_tutu(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @staticmethod
    def create(
    ) -> testapi.EmptyStruct:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_EmptyStruct_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.EmptyStruct
        )

    def aap(
        self,
    ) -> str:
        """<!-- FishyJoes.export(aap) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyStruct_aap(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )

    def zxccxz(
        self,
    ) -> str:
        """<!-- FishyJoes.export(zxccxz) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyStruct_zxccxz(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )
