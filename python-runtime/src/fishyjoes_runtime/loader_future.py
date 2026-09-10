import asyncio
from typing import Any, Awaitable, Callable, Generator, TypeAlias, final, override, ClassVar

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from fishyjoes_runtime.ffi_types import *
from fishyjoes_runtime.runtime import FishyJoesRuntime, _consume_ref, _create_consumed_ref, _create_ref, _peek_ref, \
    catch_by_out_ref, raise_by_out_ref


@final
class Future[T](Awaitable[T]):
    _future: asyncio.Future[T]
    _loop: asyncio.AbstractEventLoop

    def __init__(self, loop: asyncio.AbstractEventLoop) -> None:
        self._future = loop.create_future()
        self._loop = loop

    @override
    def __await__(self) -> Generator[Any, None, T]:
        return self._future.__await__()

    def resolve(self, result: T) -> None:
        self._loop.call_soon_threadsafe(self._future.set_result, result)

    def reject(self, error: BaseException) -> None:
        self._loop.call_soon_threadsafe(self._future.set_exception, error)

    _thing: ClassVar[Callable[[], None]]


# MARK: C APIs

_FutureCreateFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef, OutCreatedRef], CreatedRef]
_FutureSinkMethod: TypeAlias = Callable[[UnownedRef, UnownedRef, ConsumedSwiftRef, OutCreatedRef], None]
_FutureResolveRejectMethod: TypeAlias = Callable[[UnownedRef, ConsumedRef, ConsumedRef, OutCreatedRef], None]

_FishyJoesCommonRuntime_FutureConverter_setup: \
    Callable[[EnvRef, UTF16CString, _FutureCreateFn, _FutureSinkMethod, _FutureResolveRejectMethod,
              _FutureResolveRejectMethod, ConsumedRef, OutCreatedRef], None] = \
    getattr(_fishyjoes_runtime_lib, "_FishyJoesCommonRuntime_FutureConverter_setup")

_FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler: \
    Callable[[EnvRef, ConsumedSwiftRef, int, ConsumedRef, OutCreatedRef], None] = \
    getattr(_fishyjoes_runtime_lib, "_FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler")


# MARK: C callback implementations

@callback("FutureCreateFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _future_create(context: UnownedRef, out_promise: OutCreatedRef) -> CreatedRef:
    future: Future[Any] = Future(asyncio.get_running_loop())
    out_promise[0] = _create_ref(future)
    return _create_ref(future)


@callback("FutureSinkFn")
@catch_by_out_ref(default=None)
def _future_sink(context: UnownedRef, future_ref: UnownedRef, host_context: ConsumedSwiftRef) -> None:
    future = _peek_ref(future_ref, Future)

    def callback(done_future: asyncio.Future[Any]) -> None:
        exception = done_future.exception()
        is_success = exception is None
        raise_by_out_ref(_FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler)(
            FishyJoesRuntime.shared.env_ref,
            host_context,
            1 if is_success else 0,
            _create_consumed_ref(done_future.result() if is_success else exception),
        )

    future._future.add_done_callback(callback)


@callback("FutureResolveRejectFn")
@catch_by_out_ref(default=None)
def _future_resolve(context: UnownedRef, future_ref: ConsumedRef, result_ref: ConsumedRef) -> None:
    dyn_type = _peek_ref(context, type)
    future = _consume_ref(future_ref, Future)
    result: Any = _consume_ref(result_ref, dyn_type)
    future.resolve(result)


@callback("FutureResolveRejectFn")
@catch_by_out_ref(default=None)
def _future_reject(context: UnownedRef, future_ref: ConsumedRef, failure_ref: ConsumedRef) -> None:
    future = _consume_ref(future_ref, Future)
    # TODO: This will probably crash, will probably need to wrap in an exception
    failure = _consume_ref(failure_ref, BaseException)
    future.reject(failure)

# MARK: setup

def FishyJoesCommonRuntime_FutureConverter_setup[T](env: EnvRef, name: UTF16CString, dyn_type: type[T], out_exn: OutCreatedRef) -> None:
    _FishyJoesCommonRuntime_FutureConverter_setup(
        env,
        name,
        _future_create,
        _future_sink,
        _future_resolve,
        _future_reject,
        _create_consumed_ref(dyn_type),
        out_exn,
    )


def setup_futures() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
