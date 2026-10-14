from __future__ import annotations
from . import _a_protocol_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import abc
import fishyjoes_runtime
import types
import typing

class AProtocol(abc.ABC):
    """<!-- FishyJoes.export(AProtocol) -->"""

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

    def has_a_default_implementation(
        self,
        x: int,
        y: float,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocol_hasADefaultImplementation(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _xHandle,
                    _yHandle,
                ),
                str
            )

    def has_a_default_implementation2(
        self,
        a: str,
        b: bool,
        c: str,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation2) -->"""
        with fishyjoes_runtime.local_handles(self, a, b, c) as (_selfHandle, _aHandle, _bHandle, _cHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_AProtocol_hasADefaultImplementation2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _aHandle,
                    _bHandle,
                    _cHandle,
                ),
                str
            )

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
