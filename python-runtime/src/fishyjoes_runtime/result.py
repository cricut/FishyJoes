from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Callable, Never, TypeAlias, assert_never, cast, override

from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from .ffi_types import *
from .runtime import _consume_ref, _create_ref, _peek_ref, catch_by_out_ref


# Interface borrows heavily from the kotlin-runtime implementation, which in turn is based on
# https://github.com/JetBrains/kotlin/blob/6a670dc5f38fc73eb01d754d8f7c158ae0176ceb/libraries/stdlib/src/kotlin/util/Result.kt
class _BaseResult[Success, Failure: BaseException](ABC):

    def get_or_none(self) -> Success | None:
        """
        Returns the encapsulated value if this instance represents success or `None`
        if it is failure.

        This function is a shorthand for `getOrElse { null }` (see [getOrElse]) or
        `fold(onSuccess = { it }, onFailure = { null })` (see [fold]).
        """
        return self.value if isinstance(self, ResultSuccess) else None

    def exception_or_none(self) -> Failure | None:
        """
        Returns the encapsulated exception if this instance represents failure or `None`
        if it is success.

        This function is a shorthand for `fold(onSuccess = { null }, onFailure = { it })` (see [fold]).
        """
        return self.error if isinstance(self, ResultFailure) else None

    @property
    def is_success(self) -> bool:
        """
        Returns `True` if this instance represents a successful outcome.
        In this case [isFailure] returns `False`.
        """
        return isinstance(self, ResultSuccess)

    @property
    def is_failure(self) -> bool:
        """
        Returns `True` if this instance represents a failed outcome.
        In this case [isSuccess] returns `False`.
        """
        return isinstance(self, ResultFailure)

    def get_or_default(self, default: Success) -> Success:
        """
        Returns the encapsulated value if this instance represents success or the
        default argument if it is failure.
        """
        return self.value if isinstance(self, ResultSuccess) else default

    @abstractmethod
    def get_or_raise(self) -> Success:
        """
        Returns the encapsulated value if this instance represents success or raises the encapsulated [Failure] exception
        if it is failure.
        """
        ...

    @abstractmethod
    def map[NewSuccess](self, transform: Callable[[Success], NewSuccess]) -> Result[NewSuccess, Failure]:
        """
        Returns the encapsulated result of the given [transform] function applied to the encapsulated value
        if this instance represents success or the
        original encapsulated [Failure] exception if it is failure.

        Note, that this function reraises any exception thrown by [transform] function.
        """
        ...


@dataclass(frozen=True)
class ResultSuccess[Success](_BaseResult[Success, Never]):
    """The success case of a Swift `Result`, carrying the value."""

    value: Success

    @override
    def get_or_raise(self) -> Success:
        return self.value

    @override
    def map[NewSuccess](self, transform: Callable[[Success], NewSuccess]) -> ResultSuccess[NewSuccess]:
        return ResultSuccess(transform(self.value))


@dataclass(frozen=True)
class ResultFailure[Failure: BaseException](_BaseResult[Never, Failure]):
    """The failure case of a Swift `Result`, carrying the error."""
    error: Failure

    @override
    def get_or_raise(self) -> Never:
        raise self.error

    @override
    def map(self, transform: Callable[[Never], object]) -> ResultFailure[Failure]:
        return self


type Result[Success, Failure: BaseException] = ResultSuccess[Success] | ResultFailure[Failure]
"""
A discriminated union that encapsulates a successful outcome with a value of type [Success]
or a failure of exception type [Failure].
"""

# MARK: C APIs

_FishyJoes_ResultConstructorFn: TypeAlias = Callable[[UnownedRef, int, ConsumedRef, OutCreatedRef], CreatedRef]
_FishyJoes_ResultGetContentsFn: TypeAlias = Callable[[UnownedRef, UnownedRef, Pointer, OutCreatedRef], CreatedRef]

_FishyJoesCommonRuntime_ResultConverter_setup: \
    Callable[
        [EnvRef, UTF16CString, _FishyJoes_ResultGetContentsFn, _FishyJoes_ResultConstructorFn, ConsumedRef], None] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_ResultConverter_setup')


# MARK: C callback implementations

@callback("FishyJoes_ResultConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_result(context: UnownedRef, is_success: int, contents: ConsumedRef) -> CreatedRef:
    # TODO: dynamic type check here probably
    if is_success != 0:
        return _create_ref(ResultSuccess(_consume_ref(contents, object)))
    else:
        return _create_ref(ResultFailure(cast(BaseException, _consume_ref(contents, object))))


@callback("FishyJoes_ResultGetContentsFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _result_getter(context: UnownedRef, result_ref: UnownedRef, out_is_success: Pointer) -> CreatedRef:
    result = _peek_ref(result_ref, ResultSuccess, ResultFailure)
    match result:
        case ResultSuccess(value=contents):
            out_is_success[0] = 1
            return _create_ref(contents)
        case ResultFailure(error=contents):
            out_is_success[0] = 0
            return _create_ref(contents)
    assert_never(result)


# MARK: setup

def FishyJoesCommonRuntime_ResultConverter_setup(envRef: EnvRef, name: UTF16CString, out_exn: OutCreatedRef) -> None:
    _FishyJoesCommonRuntime_ResultConverter_setup(
        envRef,
        name,
        _result_getter,
        _construct_result,
        ConsumedRef(ffi.NULL),
    )
    out_exn[0] = CreatedRef(ffi.NULL)


def setup_results() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
