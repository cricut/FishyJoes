from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .AssociatedDataEnum import AssociatedDataEnum

class TestProtocolClass(NativeReference):
    """
    <!-- FishyJoes.exportReference(TestProtocolClass) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
        if native_ref is not None:
            import weakref
            weakref.finalize(self, _get_runtime().release_native_ref, native_ref)
        
    

    def __eq__(self, other: object) -> bool:
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_equals", "bool", ("object", self), ("object", other)))
    

    def __hash__(self) -> int:
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestProtocolClass_hash", "int32", ("object", self))
    

    @property
    def corge(self) -> builtins.str:
        """
        <!-- FishyJoes.export(corge) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestProtocolClass_corge", "object", ("object", self))
    

    @corge.setter
    def corge(self, value: builtins.str) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_TestProtocolClass_corge", "void", ("object", self), ("object", value))
    

    @property
    def flarp(self) -> builtins.str | None:
        """
        <!-- FishyJoes.export(flarp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestProtocolClass_flarp", "object", ("object", self))
    

    @flarp.setter
    def flarp(self, value: builtins.str | None) -> None:
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_set_TestAPI_TestProtocolClass_flarp", "void", ("object", self), ("object", value))
    

    @property
    def frobby(self) -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(frobby) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_TestProtocolClass_frobby", "object", ("object", self))
    

    def foo(self) -> None:
        """
        <!-- FishyJoes.export(foo) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_foo", "void", ("object", self))
    

    def bar(self) -> builtins.bool:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_bar", "bool", ("object", self)))
    

    def baz(self, qux: builtins.bool) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_baz", "void", ("object", self), ("bool", qux))
    

    def garply(self, str: builtins.str) -> builtins.str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_garply", "object", ("object", self), ("object", str))
    

    def xyzzy(self, thud: builtins.int, grault: builtins.list[builtins.float]) -> builtins.str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_xyzzy", "object", ("object", self), ("int", thud), ("object", grault))
    

    def plugh(self, fred: builtins.tuple[builtins.bool, builtins.float, builtins.list[builtins.str]]) -> builtins.tuple[builtins.bool, builtins.int, builtins.str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_plugh", "object", ("object", self), ("object", fred))
    

    @staticmethod
    def init(corge: builtins.str, flarp: builtins.str | None = None) -> TestProtocolClass:
        """
        <!-- FishyJoes.export(init) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_init", "object", ("object", corge), ("object", flarp))
    

    def wombat(self, zxc: builtins.int | None) -> builtins.float | None:
        """
        <!-- FishyJoes.export(wombat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_wombat", "object", ("object", self), ("object", zxc))
    

    def spqr(self, pippo: AssociatedDataEnum) -> builtins.int:
        """
        <!-- FishyJoes.export(spqr) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_TestProtocolClass_spqr", "int", ("object", self), ("object", pippo))
    

_cls_TestAPI_TestProtocolClass_setup = TestProtocolClass
