from . import _external_witness__test_optionals_protocol_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestOptionalsProtocol(fishyjoes_runtime.SwiftReference, testapi.TestOptionalsProtocol):
    """<!-- FishyJoes.export(TestOptionalsProtocol) -->"""

    @property
    def flarp(self) -> str | None:
        """<!-- FishyJoes.export(flarp) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestOptionalsProtocol_flarp(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str, types.NoneType)

    def wombat(
        self,
        zxc: int | None,
    ) -> float | None:
        """<!-- FishyJoes.export(wombat) -->"""
        with fishyjoes_runtime.local_handles(self, zxc) as (_selfHandle, _zxcHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestOptionalsProtocol_wombat(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _zxcHandle,
                ),
                float, types.NoneType
            )

    def spqr(
        self,
        pippo: testapi.AssociatedDataEnum,
    ) -> int:
        """<!-- FishyJoes.export(spqr) -->"""
        with fishyjoes_runtime.local_handles(self, pippo) as (_selfHandle, _pippoHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestOptionalsProtocol_spqr(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _pippoHandle,
                ),
                int
            )
