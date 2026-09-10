# MARK: C APIs

__iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

__iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty: Callable[[
    fishyjoes_runtime.EnvRef,
    TODO[ffiUnownedName],
    OutCreatedRef
], TODO[ffiCreatedName]] = \
    getattr(_testapi_lib, "TODO")

# MARK: C callback implementations

@fishyjoes_runtime.callback('TODO[ffi_constructor]')
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _ffi_constructor(
    b: TODO[ffiConsumedName],
    bq: TODO[ffiConsumedName],
    ui8: TODO[ffiConsumedName],
    ui8q: TODO[ffiConsumedName],
    ui16: TODO[ffiConsumedName],
    ui16q: TODO[ffiConsumedName],
    ui32: TODO[ffiConsumedName],
    ui32q: TODO[ffiConsumedName],
    ui64: TODO[ffiConsumedName],
    ui64q: TODO[ffiConsumedName],
    ui: TODO[ffiConsumedName],
    uiq: TODO[ffiConsumedName],
    i8: TODO[ffiConsumedName],
    i8q: TODO[ffiConsumedName],
    i16: TODO[ffiConsumedName],
    i16q: TODO[ffiConsumedName],
    i32: TODO[ffiConsumedName],
    i32q: TODO[ffiConsumedName],
    i64: TODO[ffiConsumedName],
    i64q: TODO[ffiConsumedName],
    i: TODO[ffiConsumedName],
    iq: TODO[ffiConsumedName],
    f: TODO[ffiConsumedName],
    fq: TODO[ffiConsumedName],
    d: TODO[ffiConsumedName],
    dq: TODO[ffiConsumedName]
) -> CreatedHostRef:
    createRef(PrimitiveHolder(
        b=consumeRef(b),
        bq=consumeRef(bq),
        ui8=consumeRef(ui8),
        ui8q=consumeRef(ui8q),
        ui16=consumeRef(ui16),
        ui16q=consumeRef(ui16q),
        ui32=consumeRef(ui32),
        ui32q=consumeRef(ui32q),
        ui64=consumeRef(ui64),
        ui64q=consumeRef(ui64q),
        ui=consumeRef(ui),
        uiq=consumeRef(uiq),
        i8=consumeRef(i8),
        i8q=consumeRef(i8q),
        i16=consumeRef(i16),
        i16q=consumeRef(i16q),
        i32=consumeRef(i32),
        i32q=consumeRef(i32q),
        i64=consumeRef(i64),
        i64q=consumeRef(i64q),
        i=consumeRef(i),
        iq=consumeRef(iq),
        f=consumeRef(f),
        fq=consumeRef(fq),
        d=consumeRef(d),
        dq=consumeRef(dq),
    ))

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_b(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).b)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_b(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).b = consumeRef(newValue, bool)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_bq(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).bq)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_bq(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).bq = consumeRef(newValue, bool, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui8(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui8)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui8(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui8 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui8q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui8q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui8q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui8q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui16(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui16)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui16(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui16 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui16q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui16q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui16q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui16q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui32(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui32)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui32(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui32 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui32q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui32q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui32q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui32q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui64(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui64)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui64(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui64 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui64q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui64q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui64q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui64q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_ui(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).ui)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_ui(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).ui = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_uiq(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).uiq)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_uiq(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).uiq = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i8(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i8)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i8(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i8 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i8q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i8q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i8q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i8q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i16(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i16)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i16(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i16 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i16q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i16q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i16q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i16q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i32(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i32)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i32(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i32 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i32q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i32q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i32q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i32q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i64(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i64)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i64(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i64 = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i64q(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i64q)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i64q(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i64q = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_i(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).i)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_i(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).i = consumeRef(newValue, int)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_iq(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).iq)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_iq(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).iq = consumeRef(newValue, int, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_f(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).f)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_f(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).f = consumeRef(newValue, float)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_fq(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).fq)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_fq(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).fq = consumeRef(newValue, float, types.NoneType)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_d(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).d)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_d(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).d = consumeRef(newValue, float)

@fishyjoes_runtime.callback('TODO[getter_type]')
@catch_by_out_ref(default=TODO[ffiDefault])
def _ffi_get_dq(obj: UnownedHostRef) -> TODO[ffiCreatedName]:
    return createRef(peekRef(obj, PrimitiveHolder).dq)

@fishyjoes_runtime.callback('TODO[setter_type]')
@catch_by_out_ref(default=None)
def _ffi_set_dq(obj: UnownedHostRef, newValue: TODO[ffiConsumedName]):
    peekRef(obj, PrimitiveHolder).dq = consumeRef(newValue, float, types.NoneType)

# MARK: setup
