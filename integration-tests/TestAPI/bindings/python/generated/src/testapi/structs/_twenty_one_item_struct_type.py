from __future__ import annotations
from . import _twenty_one_item_struct_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class TwentyOneItemStruct:
    """<!-- FishyJoes.export(Structs.TwentyOneItemStruct) -->"""

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
    __slots__: list[str] = [
        'a',
        'b',
        'c',
        'd',
        'e',
        'f',
        'g',
        'h',
        'i',
        'j',
        'k',
        'l',
        'm',
        'n',
        'o',
        'p',
        'q',
        'r',
        's',
        't',
        'u',
    ]

    def __init__(
        self,
        a: str,
        b: str,
        c: str,
        d: str,
        e: str,
        f: str,
        g: str,
        h: str,
        i: str,
        j: str,
        k: str,
        l: str,
        m: str,
        n: str,
        o: str,
        p: str,
        q: str,
        r: str,
        s: str,
        t: str,
        u: str,
    ) -> None:
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
        self.j = j
        self.k = k
        self.l = l
        self.m = m
        self.n = n
        self.o = o
        self.p = p
        self.q = q
        self.r = r
        self.s = s
        self.t = t
        self.u = u

    def __repr__(self) -> str:
        return f'testapi.structs.TwentyOneItemStruct(...)'

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        return isinstance(other, TwentyOneItemStruct) and \
            self.a == other.a and \
            self.b == other.b and \
            self.c == other.c and \
            self.d == other.d and \
            self.e == other.e and \
            self.f == other.f and \
            self.g == other.g and \
            self.h == other.h and \
            self.i == other.i and \
            self.j == other.j and \
            self.k == other.k and \
            self.l == other.l and \
            self.m == other.m and \
            self.n == other.n and \
            self.o == other.o and \
            self.p == other.p and \
            self.q == other.q and \
            self.r == other.r and \
            self.s == other.s and \
            self.t == other.t and \
            self.u == other.u and \
            True

    def __hash__(
        self,
    ) -> int:
        return hash((self.a, self.b, self.c, self.d, self.e, self.f, self.g, self.h, self.i, self.j, self.k, self.l, self.m, self.n, self.o, self.p, self.q, self.r, self.s, self.t, self.u))
