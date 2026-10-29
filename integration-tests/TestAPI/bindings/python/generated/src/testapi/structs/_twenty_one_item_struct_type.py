from __future__ import annotations
from . import _twenty_one_item_struct_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import collections.abc
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
