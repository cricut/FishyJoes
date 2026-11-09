import asyncio
import inspect
from asyncio import AbstractEventLoop
from contextlib import AbstractContextManager
from typing import Any, Awaitable, Callable, ClassVar, ContextManager, List, Literal, Self, cast, final, overload, \
    override

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
                args[-1][0] = create_ref(error)
                return default

        return wrapped

    return decorator

def raise_by_out_ref[*Args, Ret](inner: Callable[[*Args, OutCreatedRef], Ret]) -> Callable[[*Args], Ret]:
    """ call `inner`, which takes in an out-exception-parameter, and convert any passed exceptions to a python `raise`
    """

    # Pyrefly has some trouble with the variadics in this function. Some checks skipped to bypass its bugs

    def wrapped(*args: *Args) -> Ret:
        with ffi.new("created_host_ref *") as out_exn_ptr:
            out_exn = OutCreatedRef(out_exn_ptr)
            result = inner(*args, out_exn) # pyrefly: ignore
            if out_exn[0] != ffi.NULL:
                error = consume_ref(out_exn[0], object)
                raise error if isinstance(error, BaseException) else RuntimeError(str(error))
            return result
    return wrapped # pyrefly: ignore


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


def create_ref(obj: object) -> CreatedRef:
    if obj is None:
        return CreatedRef(ffi.NULL)
    handle = CreatedRef(ffi.new_handle(obj))
    _python_handles_referenced_by_swift.add(handle)
    return handle


def create_consumed_ref(obj: object) -> ConsumedRef:
    return ConsumedRef(create_ref(obj))


# Overloads are later used to approximate ideal signature:
# def assert_type[*Ts](obj: object, *types: *type[Ts]) -> Union[*Ts]
def _assert_type[T](obj: object, *types: type[T] | SpecialDynTypeMarker) -> T:
    if types == ("Callable",):
        if not callable(obj):
            raise Exception(f"Expected {types}, got {obj}")
    elif types == ("Awaitable",):
        if not inspect.isawaitable(obj):
            raise Exception(f"Expected {types}, got {obj}")
    elif not isinstance(obj, cast(type[Any], types)):
        raise Exception(f"Expected {types}, got {obj}")
    return cast(T, obj)

# Overloads are later used to approximate ideal signature:
# def peek_ref[*Ts](ref: UnownedRef, *types: *type[Ts]) -> Union[*Ts]
def _peek_ref[T](ref: UnownedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    if ref == ffi.NULL:
        res = None
    else:
        res = ffi.from_handle(ffi.cast('void *', ref))
    return _assert_type(res, *types)

# Overloads are later used to approximate ideal signature:
# def consume_ref[*Ts](ref: ConsumedRef, *types: *type[Ts]) -> Union[*Ts]
def _consume_ref[T](ref: ConsumedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    obj = _peek_ref(UnownedRef(ref), *types)
    if ref != ffi.NULL:
        _python_handles_referenced_by_swift.remove(CreatedRef(ref))
    return obj

# Overloads are later used to approximate ideal signature:
# def consume_created_ref[*Ts](ref: ConsumedRef, *types: *type[Ts]) -> Union[*Ts]
def _consume_created_ref[T](ref: CreatedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    obj = _peek_ref(UnownedRef(ref), *types)
    if ref != ffi.NULL:
        _python_handles_referenced_by_swift.remove(CreatedRef(ref))
    return obj


# Weird string type syntax from https://github.com/python/typing/issues/2276
@final
class CStringBag(AbstractContextManager["CStringBag"]):
    """A context manager for keeping C-strings alive for a scoped duration
    """
    _refs: List[FFI.CData]

    def __init__(self) -> None:
        self._refs = []

    def utf16(self, string: str) -> UTF16CString:
        ref = UTF16CString(ffi.new("char16_t[]", string))
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


class Runtime:
    shared: ClassVar[Runtime]

    env_ref: EnvRef

    fallback_event_loop: AbstractEventLoop | None = None
    """ This is a temporary workaround. Set this to your main asyncio runloop if async functions are needed"""

    def __init__(self, env_ref: EnvRef) -> None:
        self.env_ref = env_ref

    def get_event_loop(self) -> AbstractEventLoop:
        try:
            return asyncio.get_running_loop()
        except RuntimeError:
            if self.fallback_event_loop is not None:
                return self.fallback_event_loop
            raise

# Overloads to deal with various shortcomings:
#  - mypy doesn't like Type[Callable]: https://github.com/python/mypy/issues/11071
#  - mypy has trouble inferring the implicit parameter T when variadics are involved
@overload
def assert_type(obj: object, type0: Literal["Callable"], /) -> Callable[[Any], Any]: ...
@overload
def assert_type(obj: object, type0: Literal["Awaitable"], /) -> Awaitable[Any]: ...
@overload
def assert_type[T](obj: object, *types: type[T]) -> T: ...
def assert_type[T](obj: object, *types: type[T] | SpecialDynTypeMarker) -> T:
    return _assert_type(obj, *types)

@overload
def peek_ref(ref: UnownedRef, type0: Literal["Callable"], /) -> Callable[..., Any]: ...
@overload
def peek_ref(ref: UnownedRef, type0: Literal["Awaitable"], /) -> Awaitable[Any]: ...
@overload
def peek_ref[T0](ref: UnownedRef, type0: type[T0], /) -> T0: ...
@overload
def peek_ref[T0, T1](ref: UnownedRef, type0: type[T0], type1: type[T1], /) -> T0 | T1: ...
@overload
def peek_ref[T0, T1, T2](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], /) -> T0 | T1 | T2: ...
@overload
def peek_ref[T0, T1, T2, T3](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], /) -> T0 | T1 | T2 | T3: ...
@overload
def peek_ref[T0, T1, T2, T3, T4](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], /) -> T0 | T1 | T2 | T3 | T4: ...
@overload
def peek_ref[T0, T1, T2, T3, T4, T5](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], /) -> T0 | T1 | T2 | T3 | T4 | T5: ...

# HACK: stop type checking after too many parameters (mypy workaround)
@overload
def peek_ref[T0, T1, T2, T3, T4, T5, T6, R](ref: UnownedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], type6: type[T6], /, *types: Any) -> R: ...  # type: ignore[type-var]

@overload
def peek_ref[T](ref: UnownedRef, *types: type[T]) -> T: ...

def peek_ref[T](ref: UnownedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    return _peek_ref(ref, *types)


@overload
def consume_ref(ref: ConsumedRef, type0: Literal["Callable"], /) -> Callable[..., Any]: ...
@overload
def consume_ref(ref: ConsumedRef, type0: Literal["Awaitable"], /) -> Awaitable[Any]: ...
@overload
def consume_ref[T0](ref: ConsumedRef, type0: type[T0], /) -> T0: ...
@overload
def consume_ref[T0, T1](ref: ConsumedRef, type0: type[T0], type1: type[T1], /) -> T0 | T1: ...
@overload
def consume_ref[T0, T1, T2](ref: ConsumedRef, type0: type[T0], type1: type[T1], type2: type[T2], /) -> T0 | T1 | T2: ...
@overload
def consume_ref[T0, T1, T2, T3](ref: ConsumedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], /) -> T0 | T1 | T2 | T3: ...
@overload
def consume_ref[T0, T1, T2, T3, T4](ref: ConsumedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], /) -> T0 | T1 | T2 | T3 | T4: ...
@overload
def consume_ref[T0, T1, T2, T3, T4, T5](ref: ConsumedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], /) -> T0 | T1 | T2 | T3 | T4 | T5: ...

# HACK: stop type checking after too many parameters (mypy workaround)
@overload
def consume_ref[T0, T1, T2, T3, T4, T5, T6, R](ref: ConsumedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], type6: type[T6], /, *types: Any) -> R: ...  # type: ignore[type-var]

@overload
def consume_ref[T](ref: ConsumedRef, *types: type[T]) -> T: ...

def consume_ref[T](ref: ConsumedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    return _consume_ref(ref, *types)


@overload
def consume_created_ref(ref: CreatedRef, type0: Literal["Callable"], /) -> Callable[..., Any]: ...
@overload
def consume_created_ref(ref: CreatedRef, type0: Literal["Awaitable"], /) -> Awaitable[Any]: ...
@overload
def consume_created_ref[T0](ref: CreatedRef, type0: type[T0], /) -> T0: ...
@overload
def consume_created_ref[T0, T1](ref: CreatedRef, type0: type[T0], type1: type[T1], /) -> T0 | T1: ...
@overload
def consume_created_ref[T0, T1, T2](ref: CreatedRef, type0: type[T0], type1: type[T1], type2: type[T2], /) -> T0 | T1 | T2: ...
@overload
def consume_created_ref[T0, T1, T2, T3](ref: CreatedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], /) -> T0 | T1 | T2 | T3: ...
@overload
def consume_created_ref[T0, T1, T2, T3, T4](ref: CreatedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], /) -> T0 | T1 | T2 | T3 | T4: ...
@overload
def consume_created_ref[T0, T1, T2, T3, T4, T5](ref: CreatedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], /) -> T0 | T1 | T2 | T3 | T4 | T5: ...

# HACK: stop type checking after too many parameters (mypy workaround)
@overload
def consume_created_ref[T0, T1, T2, T3, T4, T5, T6, R](ref: CreatedRef, type0: type[T0], type1: type[T1], type2: type[T2], type3: type[T3], type4: type[T4], type5: type[T5], type6: type[T6], /, *types: Any) -> R: ...  # type: ignore[type-var]

@overload
def consume_created_ref[T](ref: CreatedRef, *types: type[T]) -> T: ...

def consume_created_ref[T](ref: CreatedRef, *types: type[T] | SpecialDynTypeMarker) -> T:
    return _consume_created_ref(ref, *types)
