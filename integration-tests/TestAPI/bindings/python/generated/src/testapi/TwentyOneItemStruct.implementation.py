# MARK: C APIs

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    a: TODO[ffiConsumedName],
    b: TODO[ffiConsumedName],
    c: TODO[ffiConsumedName],
    d: TODO[ffiConsumedName],
    e: TODO[ffiConsumedName],
    f: TODO[ffiConsumedName],
    g: TODO[ffiConsumedName],
    h: TODO[ffiConsumedName],
    i: TODO[ffiConsumedName],
    j: TODO[ffiConsumedName],
    k: TODO[ffiConsumedName],
    l: TODO[ffiConsumedName],
    m: TODO[ffiConsumedName],
    n: TODO[ffiConsumedName],
    o: TODO[ffiConsumedName],
    p: TODO[ffiConsumedName],
    q: TODO[ffiConsumedName],
    r: TODO[ffiConsumedName],
    s: TODO[ffiConsumedName],
    t: TODO[ffiConsumedName],
    u: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(TwentyOneItemStruct(
        a=consumeRef(a),
        b=consumeRef(b),
        c=consumeRef(c),
        d=consumeRef(d),
        e=consumeRef(e),
        f=consumeRef(f),
        g=consumeRef(g),
        h=consumeRef(h),
        i=consumeRef(i),
        j=consumeRef(j),
        k=consumeRef(k),
        l=consumeRef(l),
        m=consumeRef(m),
        n=consumeRef(n),
        o=consumeRef(o),
        p=consumeRef(p),
        q=consumeRef(q),
        r=consumeRef(r),
        s=consumeRef(s),
        t=consumeRef(t),
        u=consumeRef(u),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_a(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).a)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_a(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).a = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_b(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).b)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_b(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).b = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_c(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).c)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_c(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).c = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_d(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).d)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_d(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).d = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_e(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).e)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_e(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).e = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_f(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).f)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_f(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).f = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_g(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).g)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_g(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).g = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_h(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).h)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_h(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).h = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).i)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).i = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_j(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).j)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_j(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).j = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_k(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).k)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_k(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).k = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_l(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).l)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_l(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).l = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_m(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).m)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_m(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).m = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_n(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).n)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_n(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).n = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_o(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).o)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_o(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).o = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_p(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).p)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_p(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).p = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).q = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_r(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).r)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_r(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).r = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_s(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).s)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_s(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).s = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_t(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).t)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_t(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).t = consumeRef(newValue, str)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_u(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, TwentyOneItemStruct).u)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_u(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, TwentyOneItemStruct).u = consumeRef(newValue, str)

# MARK: setup
