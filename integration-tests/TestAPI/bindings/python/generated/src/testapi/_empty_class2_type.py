from . import _empty_class2_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class EmptyClass2(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(EmptyClass2) -->"""

    @property
    def blorg(self) -> str:
        """<!-- FishyJoes.export(blorg) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyClass2_blorg(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def wibble(self) -> str:
        """<!-- FishyJoes.export(wibble) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_EmptyClass2_wibble(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @property
    def hashCode(self) -> int:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_EmptyClass2_hash(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @staticmethod
    def make(
    ) -> testapi.EmptyClass2:
        """<!-- FishyJoes.export(make) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_EmptyClass2_make(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.EmptyClass2
        )

    def shmee(
        self,
    ) -> str:
        """<!-- FishyJoes.export(shmee) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyClass2_shmee(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                str
            )

    def gorp(
        self,
    ) -> str:
        """<!-- FishyJoes.export(gorp) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_EmptyClass2_gorp(
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
        if not isinstance(other, testapi.EmptyClass2): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle,):
            return _impl.iota_TestAPI_EmptyClass2_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: testapi.EmptyClass2,
        rhs: testapi.EmptyClass2 | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_TestAPI_EmptyClass2_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )
