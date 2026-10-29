from __future__ import annotations
from ._test_methods_protocol_type import TestMethodsProtocol # early import to make cycles work correctly
from . import _test_protocol_enum_implementation as _impl
from . import _testapi_exported as testapi
from . import test_protocol_enum
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

class _BaseTestProtocolEnum(TestMethodsProtocol):
    """<!-- FishyJoes.export(TestProtocolEnum) -->"""

    @typing.override
    def foo(
        self,
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_TestProtocolEnum_foo(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )

    @typing.override
    def bar(
        self,
    ) -> bool:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_TestProtocolEnum_bar(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )

    @typing.override
    def baz(
        self,
        qux: bool,
    ) -> None:
        """<!-- FishyJoes.export(baz) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_TestProtocolEnum_baz(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                qux,
            )

    @typing.override
    def garply(
        self,
        _0: str,
    ) -> str:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self, _0) as (_selfHandle, __0Handle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolEnum_garply(
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
        with fishyjoes_runtime.local_handles(self, grault) as (_selfHandle, _graultHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestProtocolEnum_xyzzy(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    thud,
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
                _impl.iota_TestAPI_TestProtocolEnum_plugh(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fredHandle,
                ),
                tuple
            )

# String type syntax used to avoid circular import problems at runtime
TestProtocolEnum: typing.TypeAlias = typing.Union[
    'test_protocol_enum.Qux',
]
