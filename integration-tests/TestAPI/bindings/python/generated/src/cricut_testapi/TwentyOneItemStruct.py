from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

@dataclass(slots=True)
class TwentyOneItemStruct:
    """
    <!-- FishyJoes.export(Structs.TwentyOneItemStruct) -->
    Generated FishyJoes Python value type.
    """
    a: str
    b: str
    c: str
    d: str
    e: str
    f: str
    g: str
    h: str
    i: str
    j: str
    k: str
    l: str
    m: str
    n: str
    o: str
    p: str
    q: str
    r: str
    s: str
    t: str
    u: str
