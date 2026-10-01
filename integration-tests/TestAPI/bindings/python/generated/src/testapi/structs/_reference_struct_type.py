from . import _reference_struct_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ReferenceStruct(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->"""

    @property
    def immutable(self) -> str:
        """<!-- FishyJoes.export(immutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Structs_ReferenceStruct_immutable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def mutable(self) -> str:
        """<!-- FishyJoes.export(mutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Structs_ReferenceStruct_mutable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @mutable.setter
    def mutable(self, new_value: str) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_Structs_ReferenceStruct_mutable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def hashCode(self) -> int:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Structs_ReferenceStruct_hash(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @staticmethod
    def create(
    ) -> testapi.structs.ReferenceStruct:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Structs_ReferenceStruct_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.structs.ReferenceStruct
        )

    def asyncGetMutable(
        self,
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(asyncGetMutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, testapi.structs.ReferenceStruct): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle,):
            return _impl.iota_TestAPI_Structs_ReferenceStruct_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: testapi.structs.ReferenceStruct,
        rhs: testapi.structs.ReferenceStruct | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_TestAPI_Structs_ReferenceStruct_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )
