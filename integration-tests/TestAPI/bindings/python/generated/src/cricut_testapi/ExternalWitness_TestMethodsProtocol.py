from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class ExternalWitness_TestMethodsProtocol(NativeReference):
    """
    <!-- FishyJoes.export(TestMethodsProtocol) -->
    Generated FishyJoes Python reference wrapper.
    """
    def __init__(self, native_ref: int | None = None) -> None:
        super().__init__(native_ref=native_ref)
    

    def foo(self) -> None:
        """
        <!-- FishyJoes.export(foo) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_foo", "void", ("object", self))
    

    def bar(self) -> int:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_bar", "object", ("object", self))
    

    def baz(self, qux: int) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_baz", "void", ("object", self), ("object", qux))
    

    def garply(self, _0: str) -> str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_garply", "object", ("object", self), ("object", _0))
    

    def xyzzy(self, thud: int, grault: list[int]) -> str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_xyzzy", "object", ("object", self), ("object", thud), ("object", grault))
    

    def plugh(self, fred: tuple[int, int, list[str]]) -> tuple[int, int, str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestMethodsProtocol_plugh", "object", ("object", self), ("object", fred))
    
