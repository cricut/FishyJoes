from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TestProtocolStruct:
    """
    <!-- FishyJoes.export(TestProtocolStruct) -->
    Generated FishyJoes Python value type.
    """
    corge: str

    @property
    def frobby(self) -> list[int]:
        """
        <!-- FishyJoes.export(frobby) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_TestProtocolStruct_frobby", "object", ("object", self))
    

    def foo(self) -> None:
        """
        <!-- FishyJoes.export(foo) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_foo", "void", ("object", self))
    

    def bar(self) -> bool:
        """
        <!-- FishyJoes.export(bar) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_bar", "bool", ("object", self)))
    

    def baz(self, qux: bool) -> None:
        """
        <!-- FishyJoes.export(baz) -->
        """
        _ensure_runtime_loaded()
        _get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_baz", "void", ("object", self), ("bool", qux))
    

    def garply(self, str: str) -> str:
        """
        <!-- FishyJoes.export(garply) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_garply", "object", ("object", self), ("object", str))
    

    def xyzzy(self, thud: int, grault: list[float]) -> str:
        """
        <!-- FishyJoes.export(xyzzy) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_xyzzy", "object", ("object", self), ("int", thud), ("object", grault))
    

    def plugh(self, fred: tuple[bool, float, list[str]]) -> tuple[bool, int, str]:
        """
        <!-- FishyJoes.export(plugh) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_TestProtocolStruct_plugh", "object", ("object", self), ("object", fred))
    
