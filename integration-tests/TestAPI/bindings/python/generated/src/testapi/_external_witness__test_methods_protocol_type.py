from __future__ import annotations
from ._test_methods_protocol_type import TestMethodsProtocol # early import to make cycles work correctly
from . import _external_witness__test_methods_protocol_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import collections.abc
import fishyjoes_runtime
import types
import typing

class ExternalWitness_TestMethodsProtocol(fishyjoes_runtime.SwiftReference, TestMethodsProtocol):
    """<!-- FishyJoes.export(TestMethodsProtocol) -->"""

    @typing.override
    def foo(
        self,
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_TestMethodsProtocol_foo(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )

    @typing.override
    def bar(
        self,
    ) -> bool:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_TestMethodsProtocol_bar(
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
            return _impl.iota_TestAPI_TestMethodsProtocol_baz(
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
                _impl.iota_TestAPI_TestMethodsProtocol_garply(
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
                _impl.iota_TestAPI_TestMethodsProtocol_xyzzy(
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
                _impl.iota_TestAPI_TestMethodsProtocol_plugh(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fredHandle,
                ),
                tuple
            )
