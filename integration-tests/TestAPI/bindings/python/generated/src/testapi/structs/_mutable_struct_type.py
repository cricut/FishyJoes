from __future__ import annotations
from . import _mutable_struct_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

class MutableStruct:
    """<!-- FishyJoes.export(Structs.MutableStruct) -->"""

    i: int
    __slots__: list[str] = [
        'i',
    ]

    def __init__(
        self,
        i: int,
    ) -> None:
        self.i = i

    def __repr__(self) -> str:
        return f'testapi.structs.MutableStruct(...)'

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
            return _impl.iota_TestAPI_Structs_MutableStruct_increment(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )

    def increment_async(
        self,
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(incrementAsync) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MutableStruct_incrementAsync(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                typing.Awaitable
            )

    def async_get_i(
        self,
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(asyncGetI) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Structs_MutableStruct_asyncGetI(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                typing.Awaitable
            )
