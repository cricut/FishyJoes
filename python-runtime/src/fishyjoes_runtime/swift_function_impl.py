from dataclasses import dataclass
from typing import Any, Callable, TypeAlias, cast

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import *
from fishyjoes_runtime.runtime import FishyJoesRuntime, _assert_type, _consume_created_ref, _consume_ref, \
    _create_consumed_ref, _create_ref, _peek_ref, catch_by_out_ref, local_handles, raise_by_out_ref
from fishyjoes_runtime.swift_reference import SwiftReference

# MARK: C APIs

_FunctionInvokeFn: TypeAlias = Callable[[UnownedRef, UnownedRef, ConsumedRefArray, OutCreatedRef], CreatedRef]
_FunctionConstructorFn: TypeAlias = Callable[[UnownedRef, ConsumedSwiftRef, OutCreatedRef], CreatedRef]

_FishyJoesCommonRuntime_FunctionConverter_setup: \
    Callable[[EnvRef, UTF16CString, _FunctionConstructorFn, _FunctionInvokeFn, ConsumedRef, OutCreatedRef], None] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_RangeConverter_setup')

_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0: \
    Callable[[EnvRef, UnownedSwiftRef, OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, UnownedRef, OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, UnownedRef, UnownedRef, OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef, OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef,
              OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5')
_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6: \
    Callable[[EnvRef, UnownedSwiftRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef, UnownedRef,
              OutCreatedRef], CreatedRef] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6')


# MARK: C callback implementations

@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function0(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction0(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function1(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction1(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function2(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction2(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function3(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction3(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function4(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction4(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function5(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction5(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_function6(context_ref: UnownedRef, swift_ref: ConsumedSwiftRef) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    return _create_ref(
        SwiftFunction6(swift_ref, context.arg_dyn_types, context.ret_dyn_type, context.type_description),
    )


@callback("FishyJoes_FunctionInvokeFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _invoke_function(context_ref: UnownedRef, fn_ref: UnownedRef, arg_refs: ConsumedRefArray) -> CreatedRef:
    context = _peek_ref(context_ref, _FunctionContext)
    fn = _peek_ref(fn_ref, object)
    if not callable(fn):
        raise ValueError(f"Expected callable, got {fn}")
    args: list[Any] = [_consume_ref(arg_refs[i], arg_dyn_type) for i, arg_dyn_type in enumerate(context.arg_dyn_types)]
    result: Any = _assert_type(fn(*args), context.ret_dyn_type)
    return _create_ref(result)


@dataclass(frozen=True)
class _FunctionContext:
    arg_dyn_types: tuple[type, ...]
    ret_dyn_type: type
    type_description: str


def _invoke0[R](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
) -> R:
    return _consume_created_ref(
        raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0)(
            FishyJoesRuntime.shared.env_ref,
            fn_ref,
        ), ret_dyn_type,
    )


def _invoke1[R, P0](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0,
) -> R:
    with (local_handles(arg0)
          as (arg0_ref,)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref,
            ), ret_dyn_type,
        )


def _invoke2[R, P0, P1](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0, arg1: P1,
) -> R:
    with (local_handles(arg0, arg1)
          as (arg0_ref, arg1_ref)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref, arg1_ref,
            ), ret_dyn_type,
        )


def _invoke3[R, P0, P1, P2](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0, arg1: P1, arg2: P2,
) -> R:
    with (local_handles(arg0, arg1, arg2)
          as (arg0_ref, arg1_ref, arg2_ref)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref, arg1_ref, arg2_ref,
            ), ret_dyn_type,
        )


def _invoke4[R, P0, P1, P2, P3](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0, arg1: P1, arg2: P2, arg3: P3,
) -> R:
    with (local_handles(arg0, arg1, arg2, arg3)
          as (arg0_ref, arg1_ref, arg2_ref, arg3_ref)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref, arg1_ref, arg2_ref, arg3_ref,
            ), ret_dyn_type,
        )


def _invoke5[R, P0, P1, P2, P3, P4](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0, arg1: P1, arg2: P2, arg3: P3, arg4: P4,
) -> R:
    with (local_handles(arg0, arg1, arg2, arg3, arg4)
          as (arg0_ref, arg1_ref, arg2_ref, arg3_ref, arg4_ref)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref, arg1_ref, arg2_ref, arg3_ref, arg4_ref,
            ), ret_dyn_type,
        )


def _invoke6[R, P0, P1, P2, P3, P4, P5](
    fn_ref: UnownedSwiftRef, ret_dyn_type: type[R],
    arg0: P0, arg1: P1, arg2: P2, arg3: P3, arg4: P4, arg5: P5,
) -> R:
    with (local_handles(arg0, arg1, arg2, arg3, arg4, arg5)
          as (arg0_ref, arg1_ref, arg2_ref, arg3_ref, arg4_ref, arg5_ref)):
        return _consume_created_ref(
            raise_by_out_ref(_FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6)(
                FishyJoesRuntime.shared.env_ref,
                fn_ref,
                arg0_ref, arg1_ref, arg2_ref, arg3_ref, arg4_ref, arg5_ref,
            ), ret_dyn_type,
        )


# MARK: Python data
class _SwiftFunctionImpl[Ret, *Args](SwiftReference):
    # Ideally this type would be tuple[*type[Args]], but python doesn't support that.
    arg_dyn_types: tuple[type, ...]
    ret_dyn_type: type
    type_description: str

    def __init__(
        self, reference: ConsumedSwiftRef, arg_dyn_types: tuple[type, ...], ret_dyn_type: type[Ret],
        type_description: str,
    ) -> None:
        super().__init__(reference)
        self.type_description = type_description
        self.arg_dyn_types = arg_dyn_types
        self.ret_dyn_type = ret_dyn_type


class SwiftFunction0[Ret](_SwiftFunctionImpl[Ret]):
    def __call__(self) -> Ret:
        return _invoke0(self.internal_ref(), self.ret_dyn_type)


class SwiftFunction1[Ret, Arg0](_SwiftFunctionImpl[Ret, Arg0]):
    def __call__(self, arg0: Arg0) -> Ret:
        return _invoke1(self.internal_ref(), self.ret_dyn_type, arg0)


class SwiftFunction2[Ret, Arg0, Arg1](_SwiftFunctionImpl[Ret, Arg0, Arg1]):
    def __call__(self, arg0: Arg0, arg1: Arg1) -> Ret:
        return _invoke2(self.internal_ref(), self.ret_dyn_type, arg0, arg1)


class SwiftFunction3[Ret, Arg0, Arg1, Arg2](_SwiftFunctionImpl[Ret, Arg0, Arg1, Arg2]):
    def __call__(self, arg0: Arg0, arg1: Arg1, arg2: Arg2) -> Ret:
        return _invoke3(self.internal_ref(), self.ret_dyn_type, arg0, arg1, arg2)


class SwiftFunction4[Ret, Arg0, Arg1, Arg2, Arg3](_SwiftFunctionImpl[Ret, Arg0, Arg1, Arg2, Arg3]):
    def __call__(self, arg0: Arg0, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Ret:
        return _invoke4(self.internal_ref(), self.ret_dyn_type, arg0, arg1, arg2, arg3)


class SwiftFunction5[Ret, Arg0, Arg1, Arg2, Arg3, Arg4](_SwiftFunctionImpl[Ret, Arg0, Arg1, Arg2, Arg3, Arg4]):
    def __call__(self, arg0: Arg0, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4) -> Ret:
        return _invoke5(self.internal_ref(), self.ret_dyn_type, arg0, arg1, arg2, arg3, arg4)


class SwiftFunction6[Ret, Arg0, Arg1, Arg2, Arg3, Arg4, Arg5](
    _SwiftFunctionImpl[Ret, Arg0, Arg1, Arg2, Arg3, Arg4, Arg5],
):
    def __call__(self, arg0: Arg0, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5) -> Ret:
        return _invoke6(self.internal_ref(), self.ret_dyn_type, arg0, arg1, arg2, arg3, arg4, arg5)


# MARK: setup

def _generic_setup[R](
    env_ref: EnvRef, name: UTF16CString, construct_function: _FunctionConstructorFn,
    arg_dyn_types: tuple[type, ...], ret_dyn_type: type[R], out_exn: OutCreatedRef,
) -> None:
    _FishyJoesCommonRuntime_FunctionConverter_setup(
        env_ref,
        name,
        construct_function,
        _invoke_function,
        _create_consumed_ref(_FunctionContext(arg_dyn_types, ret_dyn_type, str(ffi.string(name)))),
        out_exn,
    )
    out_exn[0] = CreatedRef(ffi.NULL)


def FishyJoesCommonRuntime_Function0Converter_setup[R](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[()], ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function0, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function1Converter_setup[R, P0](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function1, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function2Converter_setup[R, P0, P1](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0], type[P1]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function2, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function3Converter_setup[R, P0, P1, P2](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0], type[P1], type[P2]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function3, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function4Converter_setup[R, P0, P1, P2, P3](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0], type[P1], type[P2], type[P3]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function4, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function5Converter_setup[R, P0, P1, P2, P3, P4](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0], type[P1], type[P2], type[P3], type[P4]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function5, arg_dyn_types, ret_dyn_type, out_exn)


def FishyJoesCommonRuntime_Function6Converter_setup[R, P0, P1, P2, P3, P4, P5](
    env_ref: EnvRef, name: UTF16CString,
    arg_dyn_types: tuple[type[P0], type[P1], type[P2], type[P3], type[P4], type[P5]],
    ret_dyn_type: type[R],
    out_exn: OutCreatedRef,
) -> None:
    _generic_setup(env_ref, name, _construct_function6, arg_dyn_types, ret_dyn_type, out_exn)


# Nothing needs to be set up on the python side for async functions specifically. The needed setup will happen
# in `Future`'s setup and the normal `Function`'s setup
def FishyJoesCommonRuntime_AsyncFunction0Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction1Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction2Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction3Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction4Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction5Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def FishyJoesCommonRuntime_AsyncFunction6Converter_setup(env_ref: EnvRef, out_exn: OutCreatedRef) -> None:
    out_exn[0] = ffi.NULL


def setup_functions() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
