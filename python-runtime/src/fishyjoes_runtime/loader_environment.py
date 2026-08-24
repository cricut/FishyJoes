from typing import Callable, TypeAlias

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import ConsumedRef, CreatedRef, EnvRef, Pointer, UTF16CString, UTF8CString, UnownedRef
from fishyjoes_runtime.runtime import _consume_ref, _create_ref, _peek_ref, raise_by_out_ref

# MARK: C APIs

EnvNewRefFn: TypeAlias = Callable[[UnownedRef], CreatedRef]
EnvDeleteRefFn: TypeAlias = Callable[[ConsumedRef], None]
EnvNewErrorFn: TypeAlias = Callable[[UTF16CString], CreatedRef]
EnvDescribeFn: TypeAlias = Callable[[UnownedRef], UTF8CString]
EnvScheduleThreadWorkFn: TypeAlias = Callable[[EnvRef, Pointer], None]

FishyJoesCommonRuntime_Env_setup: \
    Callable[[EnvNewRefFn, EnvDeleteRefFn, EnvNewErrorFn, EnvDescribeFn, EnvScheduleThreadWorkFn], EnvRef] = \
    getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_Env_setup")

FishyJoesCommonRuntime_runScheduledWork: \
    Callable[[EnvRef, Pointer], None] = \
    raise_by_out_ref(getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_runScheduledWork"))


# MARK: C callback implementations

@callback("FishyJoes_NewRefFn")
def _env_new_ref(ref: UnownedRef) -> CreatedRef:
    return _create_ref(_peek_ref(ref, object))


@callback("FishyJoes_DeleteRefFn")
def _env_delete_ref(ref: ConsumedRef) -> None:
    _consume_ref(ref, object)


@callback("FishyJoes_NewErrorFn")
def _env_new_error(message: UTF16CString) -> CreatedRef:
    return _create_ref(RuntimeError(message))


@callback("FishyJoes_DescribeFn")
def _env_describe(ref: UnownedRef) -> UTF8CString:
    if ref == ffi.NULL:
        text = "<null>"
    else:
        text = str(_peek_ref(ref, object))
    return UTF8CString(ffi.new("char[]", text.encode("utf-8")))


@callback("FishyJoes_ScheduleThreadWorkFn")
def _env_schedule_thread_work(env_ref: EnvRef, handler_context: Pointer) -> None:
    return FishyJoesCommonRuntime_runScheduledWork(env_ref, handler_context)


# MARK: setup

def setup_environment() -> EnvRef:
    return FishyJoesCommonRuntime_Env_setup(
        _env_new_ref,
        _env_delete_ref,
        _env_new_error,
        _env_describe,
        _env_schedule_thread_work,
    )
