from typing import overload
import asyncio
import threading
from contextlib import AbstractContextManager
from typing import Any, Callable, ClassVar, ContextManager, List, Self, cast, final, override

from cffi import FFI

from fishyjoes_runtime._fishyjoesruntime_c_api import ffi
from fishyjoes_runtime.ffi_types import *

_python_handles_referenced_by_swift: set[CreatedRef] = set()


def catch_by_out_ref[*Args, Ret](*, default: Ret) -> Callable[
    [Callable[[*Args], Ret]], Callable[[*Args, OutCreatedRef], Ret]]:
    """ decorator to turn a function that may raise into a function that passes any exception into an out parameter.
    `default` is used to provide a typesafe, but unused return value when an exception occurs.
    """

    def decorator(inner: Callable[[*Args], Ret]) -> Callable[[*Args, OutCreatedRef], Ret]:
        def wrapped(*args: *tuple[*Args, OutCreatedRef]) -> Ret:
            try:
                return inner(*args[:-1])
            except BaseException as error:
                args[-1][0] = _create_ref(error)
                return default

        return wrapped

    return decorator


def call_with_raise_by_out_ref[Ret](inner: Callable[[OutCreatedRef], Ret]) -> Ret:
    """ call `inner`, which takes in an out-exception-parameter, and convert any passed exceptions to a python `raise`
    """
    with ffi.new("foreignObject *") as out_exn_ptr:
        out_exn = OutCreatedRef(out_exn_ptr)
        result = inner(out_exn)
        if out_exn[0] != ffi.NULL:
            error = _consume_ref(out_exn[0], object)
            raise error if isinstance(error, BaseException) else RuntimeError(str(error))
        return result


def raise_by_out_ref[*Args, Ret](inner: Callable[[*Args, OutCreatedRef], Ret]) -> Callable[[*Args], Ret]:
    # Work-around for a bug in pyrefly
    inner = cast(Any, inner)
    return lambda *args: call_with_raise_by_out_ref(lambda exn: inner(*args, exn))


class local_handles(ContextManager[tuple[UnownedRef, ...]]):
    refs: tuple[UnownedRef, ...]

    def __init__(self, *objects: object) -> None:
        ptrs = (ffi.NULL if obj is None else ffi.new_handle(obj) for obj in objects)
        self.refs = tuple(map(UnownedRef, ptrs))

    @override
    def __enter__(self) -> tuple[UnownedRef, ...]:
        return self.refs

    @override
    def __exit__(self, *exc: Any) -> None:
        del self.refs


def _create_ref(obj: object) -> CreatedRef:
    if object is None:
        return CreatedRef(ffi.NULL)
    handle = CreatedRef(ffi.new_handle(obj))
    _python_handles_referenced_by_swift.add(handle)
    return handle


def _create_consumed_ref(obj: object) -> ConsumedRef:
    return ConsumedRef(_create_ref(obj))


def _assert_type[T](obj: object, *types: type[T]) -> T:
    if not isinstance(obj, types):
        raise Exception(f"Expected {types}, got {obj}")
    return obj


@overload
def _peek_ref[T0](ref: UnownedRef, type0: type[T0], /) -> T0: ...


@overload
def _peek_ref[T0, T1](ref: UnownedRef, type0: type[T0], type1: type[T1], /) -> T0 | T1: ...

@overload
def _peek_ref[T0, T1, T2](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], /) -> T0 | T1 | T2: ...


def _peek_ref[T](ref: UnownedRef, *types: type[T]) -> T:
    if ref == ffi.NULL:
        res = None
    else:
        res = ffi.from_handle(ffi.cast('void *', ref))
    return _assert_type(res, *types)


def _consume_ref[T](ref: ConsumedRef, typ: type[T]) -> T:
    obj = _peek_ref(UnownedRef(ref), typ)
    _python_handles_referenced_by_swift.remove(CreatedRef(ref))
    return obj


def _consume_created_ref[T](ref: CreatedRef, typ: type[T]) -> T:
    return _consume_ref(ConsumedRef(ref), typ)


# Weird string type syntax from https://github.com/python/typing/issues/2276
@final
class CStringBag(AbstractContextManager["CStringBag"]):
    """A context manager for keeping C-strings alive for a scoped duration
    """
    _refs: List[FFI.CData]

    def __init__(self) -> None:
        self._refs = []

    def utf16(self, string: str) -> Pointer:
        code_units = string.encode('utf16') + b'\0\0'
        ref = ffi.new("uint8_t[]", code_units)
        # as long as ref remains referenced, the memory won't be freed
        self._refs.append(ref)
        return ref

    @override
    def __enter__(self) -> Self:
        return self

    @override
    def __exit__(self, exc_type: Any, exc_val: Any, exc_tb: Any) -> None:
        for ref in self._refs:
            ffi.release(ref)
        self._refs = []


class FishyJoesRuntime:
    env_ref: EnvRef
    shared: ClassVar[FishyJoesRuntime]

    def __init__(self, env_ref: EnvRef) -> None:
        self.env_ref = env_ref
