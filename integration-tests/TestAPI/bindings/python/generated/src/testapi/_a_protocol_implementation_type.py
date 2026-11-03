from __future__ import annotations
from ._a_protocol_type import AProtocol # early import to make cycles work correctly
from . import _a_protocol_implementation_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class AProtocolImplementation(AProtocol):
    """<!-- FishyJoes.export(AProtocolImplementation) -->"""

    foo: str
    baz: bool
    __slots__: list[str] = [
        'foo',
        'baz',
    ]

    def __init__(
        self,
        foo: str,
        baz: bool,
    ) -> None:
        self.foo = foo
        self.baz = baz

    def __repr__(self) -> str:
        return f'testapi.AProtocolImplementation(...)'

    @typing.override
    def bar(
        self,
        x: int,
        y: int,
    ) -> testapi.AProtocol:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_bar(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    x,
                    y,
                ),
                testapi.AProtocol
            )

    @typing.override
    def has_a_default_implementation(
        self,
        x: int,
        y: float,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_hasADefaultImplementation(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    x,
                    y,
                ),
                str
            )

    @typing.override
    def has_a_default_implementation2(
        self,
        a: str,
        b: bool,
        c: str,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation2) -->"""
        with fishyjoes_runtime.local_handles(self, a, c) as (_selfHandle, _aHandle, _cHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _aHandle,
                    b,
                    _cHandle,
                ),
                str
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, AProtocolImplementation) and \
            self.foo == other.foo and \
            self.baz == other.baz and \
            True
