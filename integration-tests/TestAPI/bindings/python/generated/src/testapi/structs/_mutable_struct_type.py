from . import _mutable_struct_implementation as _impl
from .. import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class MutableStruct:
    """<!-- FishyJoes.export(Structs.MutableStruct) -->"""
    i: int

    @staticmethod
    def create(
    ) -> testapi.structs.MutableStruct:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Structs_MutableStruct_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.structs.MutableStruct
        )

    def increment(
        self,
    ) -> None:
        """<!-- FishyJoes.export(increment) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MutableStruct_increment(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                types.NoneType
            )

    def incrementAsync(
        self,
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(incrementAsync) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MutableStruct_incrementAsync(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncGetI(
        self,
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncGetI) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MutableStruct_asyncGetI(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )
