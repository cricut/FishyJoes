from typing import Callable, TypeAlias

from fishyjoes_runtime._fishyjoesruntime_c_api import *
from fishyjoes_runtime.ffi_types import *
from fishyjoes_runtime.runtime import FishyJoesRuntime, _consume_ref, _create_ref, _peek_ref, catch_by_out_ref, \
    raise_by_out_ref


class SwiftReference:
    _reference: Pointer

    def __init__(self, reference: ConsumedSwiftRef) -> None:
        self._reference = reference

    def internal_ref(self) -> UnownedSwiftRef:
        return UnownedSwiftRef(self._reference)

    def __repr__(self) -> str:
        str_ref = FishyJoesCommonRuntime_AnyBox_toString(FishyJoesRuntime.shared.env_ref, self._reference)
        return _consume_ref(ConsumedRef(str_ref), str)

    def __del__(self) -> None:
        if self._reference == ffi.NULL:
            return
        FishyJoesCommonRuntime_AnyBox_releaseRef(FishyJoesRuntime.shared.env_ref, self._reference)
        self._reference = ffi.NULL


# MARK: C APIs
FishyJoesCommonRuntime_AnyBox_toString: \
    Callable[[EnvRef, Pointer], CreatedRef] = \
    raise_by_out_ref(getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_AnyBox_toString"))

FishyJoesCommonRuntime_AnyBox_releaseRef: \
    Callable[[EnvRef, Pointer], None] = \
    raise_by_out_ref(getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_AnyBox_releaseRef"))

ReferenceConstructorFn: TypeAlias = Callable[[ConsumedSwiftRef, OutCreatedRef], CreatedRef]
ReferencePointerGetterFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], UnownedSwiftRef]

FishyJoesCommonRuntime_AnyBox_setup: \
    Callable[[EnvRef, ReferenceConstructorFn, ReferencePointerGetterFn], None] = \
    getattr(_fishyjoes_runtime_lib, "FishyJoesCommonRuntime_AnyBox_setup")


# MARK: C callback implementations

@callback("FishyJoes_ReferenceConstructorFn")
@catch_by_out_ref(default=CreatedRef(ffi.NULL))
def _reference_constructor(swift_ref: ConsumedSwiftRef) -> CreatedRef:
    return _create_ref(SwiftReference(swift_ref))


@callback("FishyJoes_ReferencePointerGetterFn")
@catch_by_out_ref(default=UnownedSwiftRef(ffi.NULL))
def _reference_pointer_getter(obj: UnownedRef) -> UnownedSwiftRef:
    return _peek_ref(obj, SwiftReference).internal_ref()


# MARK: setup

def setup_references() -> None:
    FishyJoesCommonRuntime_AnyBox_setup(
        FishyJoesRuntime.shared.env_ref,
        _reference_constructor,
        _reference_pointer_getter,
    )
