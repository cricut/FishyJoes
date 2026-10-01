from . import _empty_class1_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class EmptyClass1(fishyjoes_runtime.SwiftReference):
    """A reference type with playful members for binding coverage."""
    """<!-- FishyJoes.exportReference(EmptyClass1) -->"""

    @property
    def blarg(self) -> str:
        """A cheerful nonsense string."""
        """<!-- FishyJoes.export(blarg) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyClass_blarg(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def wibbledyWobbledyTimeyWhimey(self) -> str:
        """<!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def hashCode(self) -> int:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_EmptyClass_hash(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @staticmethod
    def create(
    ) -> testapi.EmptyClass1:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_EmptyClass_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.EmptyClass1
        )

    def shme(
        self,
    ) -> str:
        """Returns a short pirate greeting."""
        """<!-- FishyJoes.export(shme) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyClass_shme(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )

    def Gorpers(
        self,
    ) -> str:
        """<!-- FishyJoes.export(Gorpers) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyClass_Gorpers(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, testapi.EmptyClass1): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle,):
            return _impl.iota_TestAPI_EmptyClass_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: testapi.EmptyClass1,
        rhs: testapi.EmptyClass1 | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_TestAPI_EmptyClass_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )
