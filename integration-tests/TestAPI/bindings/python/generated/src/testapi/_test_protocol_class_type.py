from . import _test_protocol_class_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestProtocolClass(fishyjoes_runtime.SwiftReference, testapi.TestMethodsProtocol, testapi.TestOptionalsProtocol, testapi.TestPropertiesProtocol):
    """<!-- FishyJoes.exportReference(TestProtocolClass) -->"""

    @property
    def corge(self) -> str:
        """<!-- FishyJoes.export(corge) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestProtocolClass_corge(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str)

    @corge.setter
    def corge(self, new_value: str) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_TestProtocolClass_corge(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def flarp(self) -> str | None:
        """<!-- FishyJoes.export(flarp) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestProtocolClass_flarp(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str, types.NoneType)

    @flarp.setter
    def flarp(self, new_value: str | None) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_TestProtocolClass_flarp(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def frobby(self) -> list[int]:
        """<!-- FishyJoes.export(frobby) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestProtocolClass_frobby(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), list)

    @property
    def hashCode(self) -> int:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_TestProtocolClass_hash(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    def foo(
        self,
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolClass_foo(
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
                _impl.iota_TestAPI_TestProtocolClass_bar(
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
                _impl.iota_TestAPI_TestProtocolClass_baz(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _quxHandle,
                ),
                types.NoneType
            )

    def garply(
        self,
        str_: str,
    ) -> str:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self, str_) as (_selfHandle, _strHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolClass_garply(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _strHandle,
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
                _impl.iota_TestAPI_TestProtocolClass_xyzzy(
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
                _impl.iota_TestAPI_TestProtocolClass_plugh(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fredHandle,
                ),
                tuple
            )

    @staticmethod
    def init(
        corge: str,
        *,
        flarp: str | None = None,
    ) -> testapi.TestProtocolClass:
        """<!-- FishyJoes.export(init) -->"""
        with fishyjoes_runtime.local_handles(corge, flarp) as (_corgeHandle, _flarpHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolClass_init(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _corgeHandle,
                    _flarpHandle,
                ),
                testapi.TestProtocolClass
            )

    def wombat(
        self,
        zxc: int | None,
    ) -> float | None:
        """<!-- FishyJoes.export(wombat) -->"""
        with fishyjoes_runtime.local_handles(self, zxc) as (_selfHandle, _zxcHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolClass_wombat(
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
                _impl.iota_TestAPI_TestProtocolClass_spqr(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _pippoHandle,
                ),
                int
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, testapi.TestProtocolClass): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle,):
            return _impl.iota_TestAPI_TestProtocolClass_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: testapi.TestProtocolClass,
        rhs: testapi.TestProtocolClass | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_TestAPI_TestProtocolClass_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )
