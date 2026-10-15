from __future__ import annotations
from .. import _testapi_exported as testapi
from .._c_api import _testapi_lib
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_constructorFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def ffi_constructor(
    a: fishyjoes_runtime.ConsumedRef,
    b: fishyjoes_runtime.ConsumedRef,
    c: fishyjoes_runtime.ConsumedRef,
    d: fishyjoes_runtime.ConsumedRef,
    e: fishyjoes_runtime.ConsumedRef,
    f: fishyjoes_runtime.ConsumedRef,
    g: fishyjoes_runtime.ConsumedRef,
    h: fishyjoes_runtime.ConsumedRef,
    i: fishyjoes_runtime.ConsumedRef,
    j: fishyjoes_runtime.ConsumedRef,
    k: fishyjoes_runtime.ConsumedRef,
    l: fishyjoes_runtime.ConsumedRef,
    m: fishyjoes_runtime.ConsumedRef,
    n: fishyjoes_runtime.ConsumedRef,
    o: fishyjoes_runtime.ConsumedRef,
    p: fishyjoes_runtime.ConsumedRef,
    q: fishyjoes_runtime.ConsumedRef,
    r: fishyjoes_runtime.ConsumedRef,
    s: fishyjoes_runtime.ConsumedRef,
    t: fishyjoes_runtime.ConsumedRef,
    u: fishyjoes_runtime.ConsumedRef
) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(testapi.structs.TwentyOneItemStruct(
        a = fishyjoes_runtime.consume_ref(a, str),
        b = fishyjoes_runtime.consume_ref(b, str),
        c = fishyjoes_runtime.consume_ref(c, str),
        d = fishyjoes_runtime.consume_ref(d, str),
        e = fishyjoes_runtime.consume_ref(e, str),
        f = fishyjoes_runtime.consume_ref(f, str),
        g = fishyjoes_runtime.consume_ref(g, str),
        h = fishyjoes_runtime.consume_ref(h, str),
        i = fishyjoes_runtime.consume_ref(i, str),
        j = fishyjoes_runtime.consume_ref(j, str),
        k = fishyjoes_runtime.consume_ref(k, str),
        l = fishyjoes_runtime.consume_ref(l, str),
        m = fishyjoes_runtime.consume_ref(m, str),
        n = fishyjoes_runtime.consume_ref(n, str),
        o = fishyjoes_runtime.consume_ref(o, str),
        p = fishyjoes_runtime.consume_ref(p, str),
        q = fishyjoes_runtime.consume_ref(q, str),
        r = fishyjoes_runtime.consume_ref(r, str),
        s = fishyjoes_runtime.consume_ref(s, str),
        t = fishyjoes_runtime.consume_ref(t, str),
        u = fishyjoes_runtime.consume_ref(u, str),
    ))

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_aGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_a(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).a)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_aSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_a(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).a = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_bGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_b(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).b)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_bSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_b(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).b = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_cGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_c(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).c)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_cSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_c(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).c = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_dGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_d(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).d)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_dSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_d(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).d = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_eGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_e(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).e)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_eSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_e(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).e = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_fGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_f(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).f)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_fSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_f(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).f = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_gGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_g(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).g)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_gSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_g(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).g = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_hGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_h(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).h)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_hSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_h(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).h = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_iGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_i(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).i)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_iSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_i(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).i = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_jGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_j(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).j)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_jSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_j(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).j = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_kGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_k(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).k)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_kSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_k(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).k = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_lGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_l(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).l)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_lSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_l(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).l = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_mGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_m(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).m)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_mSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_m(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).m = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_nGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_n(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).n)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_nSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_n(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).n = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_oGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_o(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).o)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_oSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_o(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).o = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_pGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_p(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).p)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_pSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_p(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).p = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_qGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_q(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).q)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_qSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_q(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).q = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_rGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_r(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).r)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_rSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_r(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).r = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_sGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_s(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).s)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_sSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_s(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).s = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_tGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_t(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).t)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_tSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_t(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).t = fishyjoes_runtime.consume_ref(newValue, str)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_uGetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)
def _ffi_get_u(obj: fishyjoes_runtime.UnownedRef) -> fishyjoes_runtime.CreatedRef:
    return fishyjoes_runtime.create_ref(fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).u)

@fishyjoes_runtime.callback('TestAPI_Structs_TwentyOneItemStruct_uSetterFn')
@fishyjoes_runtime.catch_by_out_ref(default=None)
def _ffi_set_u(obj: fishyjoes_runtime.UnownedRef, newValue: fishyjoes_runtime.ConsumedRef) -> None:
    fishyjoes_runtime.peek_ref(obj, testapi.structs.TwentyOneItemStruct).u = fishyjoes_runtime.consume_ref(newValue, str)

# MARK: setup

# TODO: setup for testapi.structs.TwentyOneItemStruct
