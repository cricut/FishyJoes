from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

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
        
    

    @property
    def corge(self) -> str:
        """
        <!-- FishyJoes.export(corge) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestProtocolClass_corge", "object", ("object", self))
    

    @corge.setter
    def corge(self, value: str) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_TestProtocolClass_corge", "void", ("object", self), ("object", value))
    

    @property
    def flarp(self) -> str | None:
        """
        <!-- FishyJoes.export(flarp) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestProtocolClass_flarp", "object", ("object", self))
    

    @flarp.setter
    def flarp(self, value: str | None) -> None:
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_set_TestAPI_TestProtocolClass_flarp", "void", ("object", self), ("object", value))
    

    @property
    def frobby(self) -> list[int]:
        """
        <!-- FishyJoes.export(frobby) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestProtocolClass_frobby", "object", ("object", self))
    

    def foo(self) -> None:
        """
        <!-- FishyJoes.export(foo) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_foo", "void", ("object", self))
    

    def bar(self) -> int:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_bar", "object", ("object", self))
    

    def baz(self, qux: int) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_baz", "void", ("object", self), ("object", qux))
    

    def garply(self, str: str) -> str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_garply", "object", ("object", self), ("object", str))
    

    def xyzzy(self, thud: int, grault: list[int]) -> str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_xyzzy", "object", ("object", self), ("object", thud), ("object", grault))
    

    def plugh(self, fred: tuple[int, int, list[str]]) -> tuple[int, int, str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_plugh", "object", ("object", self), ("object", fred))
    

    @staticmethod
    def init(corge: str, flarp: str | None = None) -> TestProtocolClass:
        """
        <!-- FishyJoes.export(init) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_init", "object", ("object", corge), ("object", flarp))
    

    def wombat(self, zxc: int | None) -> int | None:
        """
        <!-- FishyJoes.export(wombat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_wombat", "object", ("object", self), ("object", zxc))
    

    def spqr(self, pippo: AssociatedDataEnum) -> int:
        """
        <!-- FishyJoes.export(spqr) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolClass_spqr", "object", ("object", self), ("object", pippo))
    
