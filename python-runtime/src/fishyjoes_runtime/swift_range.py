from dataclasses import dataclass
from typing import Callable, Protocol, Self, TypeAlias

from ._fishyjoesruntime_c_api import _fishyjoes_runtime_lib, callback, ffi
from .ffi_types import ConsumedRef, CreatedRef, EnvRef, OutCreatedRef, UTF16CString, UnownedRef
from .runtime import catch_by_out_ref, create_consumed_ref, create_ref, peek_ref


class Comparable(Protocol):
    def __lt__(self, other: Self) -> bool: ...

    def __gt__(self, other: Self) -> bool: ...

    def __le__(self, other: Self) -> bool: ...

    def __ge__(self, other: Self) -> bool: ...


@dataclass(frozen=True)
class SwiftRange[Bound: Comparable]:
    """A Swift `Range`; `upper_bound` is excluded."""

    lower_bound: Bound
    upper_bound: Bound

    def __contains__(self, item: Bound) -> bool:
        return self.lower_bound <= item < self.upper_bound


@dataclass(frozen=True)
class SwiftClosedRange[Bound: Comparable]:
    """A Swift `ClosedRange`; `upper_bound` is included."""

    lower_bound: Bound
    upper_bound: Bound

    def __contains__(self, item: Bound) -> bool:
        return self.lower_bound <= item <= self.upper_bound


# MARK: C APIs

_RangeGetBoundFn: TypeAlias = Callable[[UnownedRef, UnownedRef, OutCreatedRef], CreatedRef]
_RangeConstructorFn: TypeAlias = Callable[[UnownedRef, UnownedRef, UnownedRef, OutCreatedRef], CreatedRef]

_FishyJoesCommonRuntime_RangeConverter_setup: \
    Callable[[EnvRef, UTF16CString, _RangeGetBoundFn, _RangeGetBoundFn, _RangeConstructorFn, ConsumedRef], None] = \
    getattr(_fishyjoes_runtime_lib, 'FishyJoesCommonRuntime_RangeConverter_setup')


# MARK: C callback implementations

@callback("FishyJoes_RangeGetBoundFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _get_lower_bound(context: UnownedRef, ref: UnownedRef) -> CreatedRef:
    return create_ref(peek_ref(ref, SwiftRange, SwiftClosedRange).lower_bound)


@callback("FishyJoes_RangeGetBoundFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _get_upper_bound(context: UnownedRef, ref: UnownedRef) -> CreatedRef:
    return create_ref(peek_ref(ref, SwiftRange, SwiftClosedRange).upper_bound)


@callback("FishyJoes_RangeConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_range(context: UnownedRef, lower_bound_ref: UnownedRef, upper_bound_ref: UnownedRef) -> CreatedRef:
    dyn_type: type[Comparable] = peek_ref(context, type)
    lower_bound = peek_ref(lower_bound_ref, dyn_type)
    upper_bound = peek_ref(upper_bound_ref, dyn_type)
    result = SwiftRange(lower_bound, upper_bound)
    return create_ref(result)


@callback("FishyJoes_RangeConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _construct_closed_range(
    context: UnownedRef, lower_bound_ref: UnownedRef, upper_bound_ref: UnownedRef,
) -> CreatedRef:
    dyn_type: type[Comparable] = peek_ref(context, type)
    lower_bound = peek_ref(lower_bound_ref, dyn_type)
    upper_bound = peek_ref(upper_bound_ref, dyn_type)
    result = SwiftClosedRange(lower_bound, upper_bound)
    return create_ref(result)


# MARK: setup

def FishyJoesCommonRuntime_RangeConverter_setup[T: Comparable](env_ref: EnvRef, name: UTF16CString, dyn_type: type[T], out_exn: OutCreatedRef) -> None:
    _FishyJoesCommonRuntime_RangeConverter_setup(
        env_ref,
        name,
        _get_lower_bound,
        _get_upper_bound,
        _construct_range,
        create_consumed_ref(dyn_type),
    )
    out_exn[0] = CreatedRef(ffi.NULL)


def FishyJoesCommonRuntime_ClosedRangeConverter_setup[T: Comparable](
    env_ref: EnvRef, name: UTF16CString, dyn_type: type[T], out_exn: OutCreatedRef,
) -> None:
    _FishyJoesCommonRuntime_RangeConverter_setup(
        env_ref,
        name,
        _get_lower_bound,
        _get_upper_bound,
        _construct_closed_range,
        create_consumed_ref(dyn_type),
    )
    out_exn[0] = CreatedRef(ffi.NULL)


def setup_ranges() -> None:
    # Generic types need to be set up as instantiated types, so nothing to do here.
    pass
