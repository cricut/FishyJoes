from . import _external_witness__test_methods_protocol_implementation as _impl
from .. import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestMethodsProtocol(fishyjoes_runtime.SwiftReference, testapi.TestMethodsProtocol):
    """<!-- FishyJoes.export(TestMethodsProtocol) -->"""

    def foo(
        self,
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_foo(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                types.NoneType
            )

    def bar(
        self,
    ) -> bool:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_bar(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                bool
            )

    def baz(
        self,
        qux: bool,
    ) -> None:
        """<!-- FishyJoes.export(baz) -->"""
        with fishyjoes_runtime.local_handles(self, qux) as (_selfHandle, _quxHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_baz(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _quxHandle,
                ),
                types.NoneType
            )

    def garply(
        self,
        _0: str,
    ) -> str:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self, _0) as (_selfHandle, __0Handle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_garply(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    __0Handle,
                ),
                str
            )

    def xyzzy(
        self,
        thud: int,
        grault: list[float],
    ) -> str:
        """<!-- FishyJoes.export(xyzzy) -->"""
        with fishyjoes_runtime.local_handles(self, thud, grault) as (_selfHandle, _thudHandle, _graultHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_xyzzy(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _thudHandle,
                    _graultHandle,
                ),
                str
            )

    def plugh(
        self,
        fred: tuple[bool,float,list[str]],
    ) -> tuple[bool,int,str]:
        """<!-- FishyJoes.export(plugh) -->"""
        with fishyjoes_runtime.local_handles(self, fred) as (_selfHandle, _fredHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestMethodsProtocol_plugh(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fredHandle,
                ),
                tuple
            )
