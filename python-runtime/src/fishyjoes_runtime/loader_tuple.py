from typing import Callable, TypeAlias

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import *
from fishyjoes_runtime.runtime import _create_consumed_ref, _create_ref, _peek_ref, catch_by_out_ref

# MARK: C APIs

TupleConstructorFn: TypeAlias = Callable[[UnownedRef, UnownedRefArray, OutCreatedRef], CreatedRef]
TupleGetFn: TypeAlias = Callable[[UnownedRef, UnownedRef, OutCreatedRef], CreatedRef]

FishyJoesCommonRuntime_TupleConverter_setup: \
    Callable[[EnvRef, UTF16CString, TupleGetFn, TupleGetFn, TupleGetFn, TupleGetFn, TupleGetFn, TupleGetFn,
              TupleConstructorFn, ConsumedRef], None] = \
    getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_TupleConverter_setup")


# MARK: C callback implementations

@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _tuple_get_common(tuple_size: int, ref: UnownedRef) -> CreatedRef:
    tup = _peek_ref(ref, tuple)
    if len(tup) < tuple_size + 1:
        raise TypeError(f"Expected tuple of length >={tuple_size + 1}, got {tup}")
    return _create_ref(tup[tuple_size])


@callback("FishyJoes_TupleGetFn")
def _tuple_get_0(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(0, ref, out_exn)


@callback("FishyJoes_TupleGetFn")
def _tuple_get_1(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(1, ref, out_exn)


@callback("FishyJoes_TupleGetFn")
def _tuple_get_2(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(2, ref, out_exn)


@callback("FishyJoes_TupleGetFn")
def _tuple_get_3(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(3, ref, out_exn)


@callback("FishyJoes_TupleGetFn")
def _tuple_get_4(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(4, ref, out_exn)


@callback("FishyJoes_TupleGetFn")
def _tuple_get_5(context: UnownedRef, ref: UnownedRef, out_exn: OutCreatedRef) -> CreatedRef:
    return _tuple_get_common(5, ref, out_exn)


@callback("FishyJoes_TupleConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _tuple_constructor(context: UnownedRef, elements: UnownedRefArray) -> CreatedRef:
    dyn_types: tuple[type, ...] = _peek_ref(context, tuple)
    return _create_ref(tuple(_peek_ref(elements[index], dyn_type) for (index, dyn_type) in enumerate(dyn_types)))

# MARK: setup

def FishyJoesCommonRuntime_Tuple2Converter_setup[T0, T1](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_types: tuple[type[T0], type[T1]],
    out_exn: OutCreatedRef,
) -> None:
    FishyJoesCommonRuntime_TupleConverter_setup(
        env_ref,
        utf16_name,
        _tuple_get_0, _tuple_get_1, ffi.NULL, ffi.NULL, ffi.NULL, ffi.NULL,
        _tuple_constructor,
        _create_consumed_ref(dyn_types),
    )
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_Tuple3Converter_setup[T0, T1, T2](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_types: tuple[type[T0], type[T1], type[T2]],
    out_exn: OutCreatedRef,
) -> None:
    FishyJoesCommonRuntime_TupleConverter_setup(
        env_ref,
        utf16_name,
        _tuple_get_0, _tuple_get_1, _tuple_get_2, ffi.NULL, ffi.NULL, ffi.NULL,
        _tuple_constructor,
        _create_consumed_ref(dyn_types),
    )
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_Tuple4Converter_setup[T0, T1, T2, T3](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_types: tuple[type[T0], type[T1], type[T2], type[T3]],
    out_exn: OutCreatedRef,
) -> None:
    FishyJoesCommonRuntime_TupleConverter_setup(
        env_ref,
        utf16_name,
        _tuple_get_0, _tuple_get_1, _tuple_get_2, _tuple_get_3, ffi.NULL, ffi.NULL,
        _tuple_constructor,
        _create_consumed_ref(dyn_types),
    )
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_Tuple5Converter_setup[T0, T1, T2, T3, T4](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_types: tuple[type[T0], type[T1], type[T2], type[T3], type[T4]],
    out_exn: OutCreatedRef,
) -> None:
    FishyJoesCommonRuntime_TupleConverter_setup(
        env_ref,
        utf16_name,
        _tuple_get_0, _tuple_get_1, _tuple_get_2, _tuple_get_3, _tuple_get_4, ffi.NULL,
        _tuple_constructor,
        _create_consumed_ref(dyn_types),
    )
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_Tuple6Converter_setup[T0, T1, T2, T3, T4, T5](
    env_ref: EnvRef,
    utf16_name: UTF16CString,
    dyn_types: tuple[type[T0], type[T1], type[T2], type[T3], type[T4], type[T5]],
    out_exn: OutCreatedRef,
) -> None:
    FishyJoesCommonRuntime_TupleConverter_setup(
        env_ref,
        utf16_name,
        _tuple_get_0, _tuple_get_1, _tuple_get_2, _tuple_get_3, _tuple_get_4, _tuple_get_5,
        _tuple_constructor,
        _create_consumed_ref(dyn_types),
    )
    out_exn[0] = ffi.NULL


def setup_tuples() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
