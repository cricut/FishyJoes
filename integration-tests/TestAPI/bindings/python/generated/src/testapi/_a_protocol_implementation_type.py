from . import _a_protocol_implementation_implementation as _impl
from . import _testapi_exported as testapi
import dataclasses
import fishyjoes_runtime
import types
import typing

@dataclasses.dataclass
class AProtocolImplementation(testapi.AProtocol):
    """<!-- FishyJoes.export(AProtocolImplementation) -->"""
    foo: str
    baz: bool

    def bar(
        self,
        x: int,
        y: int,
    ) -> testapi.AProtocol:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_bar(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _xHandle,
                    _yHandle,
                ),
                testapi.AProtocol
            )

    def hasADefaultImplementation(
        self,
        x: int,
        y: float,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_hasADefaultImplementation(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _xHandle,
                    _yHandle,
                ),
                str
            )

    def hasADefaultImplementation2(
        self,
        a: str,
        b: bool,
        c: str,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation2) -->"""
        with fishyjoes_runtime.local_handles(self, a, b, c) as (_selfHandle, _aHandle, _bHandle, _cHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _aHandle,
                    _bHandle,
                    _cHandle,
                ),
                str
            )
