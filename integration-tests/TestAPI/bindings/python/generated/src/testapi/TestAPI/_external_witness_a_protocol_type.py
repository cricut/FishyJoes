from . import _external_witness_a_protocol_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_AProtocol(fishyjoes_runtime.SwiftReference, testapi.AProtocol):
    """<!-- FishyJoes.export(AProtocol) -->"""

    @property
    def baz(self) -> bool:
        """<!-- FishyJoes.export(baz) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AProtocol_baz(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), bool)

    @property
    def foo(self) -> str:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_AProtocol_foo(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    def bar(
        self,
        x: int,
        y: int,
    ) -> testapi.AProtocol:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocol_bar(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _xHandle,
                    _yHandle,
                ),
                testapi.AProtocol
            )
