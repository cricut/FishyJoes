from . import _memberwise_struct_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class MemberwiseStruct:
    """A plain value type with one immutable and one mutable field."""
    """<!-- FishyJoes.export(Structs.MemberwiseStruct) -->"""

    _immutable: str
    @property
    def immutable(self) -> str:
        return self._immutable

    mutable: str

    def __init__(
        self,
        immutable: str,
        mutable: str,
    ) -> None:
        self._immutable = immutable
        self.mutable = mutable

    def __repr__(self) -> str:
        return f'testapi.structs.MemberwiseStruct(immutable={self._immutable!r}, mutable={self.mutable!r})'

    @staticmethod
    def create(
    ) -> testapi.structs.MemberwiseStruct:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Structs_MemberwiseStruct_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.structs.MemberwiseStruct
        )

    def asyncGetMutable(
        self,
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(asyncGetMutable) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )
