from __future__ import annotations
from . import _test_protocol_struct_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TestProtocolStruct(testapi.TestMethodsProtocol, testapi.TestPropertiesProtocol):
    """<!-- FishyJoes.export(TestProtocolStruct) -->"""

    corge: str

    def __init__(
        self,
        corge: str,
    ) -> None:
        self.corge = corge

    def __repr__(self) -> str:
        return f'testapi.TestProtocolStruct(corge={self.corge!r})'

    @property
    @typing.override
    def frobby(self) -> list[int]:
        """<!-- FishyJoes.export(frobby) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_TestProtocolStruct_frobby(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), list)

    @typing.override
    def foo(
        self,
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_foo(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                types.NoneType
            )

    @typing.override
    def bar(
        self,
    ) -> bool:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_bar(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                bool
            )

    @typing.override
    def baz(
        self,
        qux: bool,
    ) -> None:
        """<!-- FishyJoes.export(baz) -->"""
        with fishyjoes_runtime.local_handles(self, qux) as (_selfHandle, _quxHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_baz(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _quxHandle,
                ),
                types.NoneType
            )

    @typing.override
    def garply(
        self,
        _0: str,
    ) -> str:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self, _0) as (_selfHandle, __0Handle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_garply(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    __0Handle,
                ),
                str
            )

    @typing.override
    def xyzzy(
        self,
        thud: int,
        grault: list[float],
    ) -> str:
        """<!-- FishyJoes.export(xyzzy) -->"""
        with fishyjoes_runtime.local_handles(self, thud, grault) as (_selfHandle, _thudHandle, _graultHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_xyzzy(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _thudHandle,
                    _graultHandle,
                ),
                str
            )

    @typing.override
    def plugh(
        self,
        fred: tuple[bool,float,list[str]],
    ) -> tuple[bool,int,str]:
        """<!-- FishyJoes.export(plugh) -->"""
        with fishyjoes_runtime.local_handles(self, fred) as (_selfHandle, _fredHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolStruct_plugh(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fredHandle,
                ),
                tuple
            )
