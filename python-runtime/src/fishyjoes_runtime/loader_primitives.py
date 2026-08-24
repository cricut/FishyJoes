from fishyjoes_runtime._fishyjoesruntime_c_api import callback
from fishyjoes_runtime.ffi_types import CreatedRef
from typing import Callable, TypeAlias

from fishyjoes_runtime._fishyjoesruntime_c_api import _fishyjoes_runtime_lib
from fishyjoes_runtime.ffi_types import EnvRef, OutCreatedRef, UnownedRef
from fishyjoes_runtime.runtime import FishyJoesRuntime, _create_ref, _peek_ref, catch_by_out_ref, local_handles

# MARK: C APIs

BoolValueFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], bool]
IntValueFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], int]
FloatValueFn: TypeAlias = Callable[[UnownedRef, OutCreatedRef], float]

IntConstructor: TypeAlias = Callable[[int], CreatedRef]
FloatConstructor: TypeAlias = Callable[[float], CreatedRef]

Swift_Bool_setup: \
    Callable[[EnvRef, UnownedRef, UnownedRef, BoolValueFn], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Bool_setup")

Swift_Int8_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Int8_setup")

Swift_Int16_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Int16_setup")

Swift_Int32_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Int32_setup")

Swift_Int64_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Int64_setup")

Swift_Int_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Int_setup")

Swift_UInt8_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_UInt8_setup")

Swift_UInt16_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_UInt16_setup")

Swift_UInt32_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_UInt32_setup")

Swift_UInt64_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_UInt64_setup")

Swift_UInt_setup: \
    Callable[[EnvRef, IntValueFn, IntConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_UInt_setup")

Swift_Float_setup: \
    Callable[[EnvRef, FloatValueFn, FloatConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Float_setup")

Swift_Double_setup: \
    Callable[[EnvRef, FloatValueFn, FloatConstructor], None] = \
    getattr(_fishyjoes_runtime_lib, "Swift_Double_setup")


# MARK: C callback implementations

# NOTE: even though the function bodies of many of these are identical, they have different C signatures, and need to remain separate
@callback("FishyJoes_BoolValueFn")
@catch_by_out_ref(default=False)
def _bool_value_extract(obj: UnownedRef) -> bool:
    return _peek_ref(obj, bool)


@callback("FishyJoes_Int8ValueFn")
@catch_by_out_ref(default=0)
def _int8_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_Int16ValueFn")
@catch_by_out_ref(default=0)
def _int16_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_Int32ValueFn")
@catch_by_out_ref(default=0)
def _int32_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_Int64ValueFn")
@catch_by_out_ref(default=0)
def _int64_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_IntValueFn")
@catch_by_out_ref(default=0)
def _int_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_UInt8ValueFn")
@catch_by_out_ref(default=0)
def _uint8_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_UInt16ValueFn")
@catch_by_out_ref(default=0)
def _uint16_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_UInt32ValueFn")
@catch_by_out_ref(default=0)
def _uint32_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_UInt64ValueFn")
@catch_by_out_ref(default=0)
def _uint64_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_UIntValueFn")
@catch_by_out_ref(default=0)
def _uint_value_extract(obj: UnownedRef) -> int:
    return _peek_ref(obj, int)


@callback("FishyJoes_FloatValueFn")
@catch_by_out_ref(default=0.0)
def _float_value_extract(obj: UnownedRef) -> float:
    return _peek_ref(obj, float, int)


@callback("FishyJoes_DoubleValueFn")
@catch_by_out_ref(default=0.0)
def _double_value_extract(obj: UnownedRef) -> float:
    return _peek_ref(obj, float, int)


@callback("FishyJoes_Int8ConstructorFn")
def _int8_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_Int16ConstructorFn")
def _int16_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_Int32ConstructorFn")
def _int32_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_Int64ConstructorFn")
def _int64_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_IntConstructorFn")
def _int_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_UInt8ConstructorFn")
def _uint8_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_UInt16ConstructorFn")
def _uint16_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_UInt32ConstructorFn")
def _uint32_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_UInt64ConstructorFn")
def _uint64_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_UIntConstructorFn")
def _uint_constructor(value: int) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_FloatConstructorFn")
def _float_constructor(value: float) -> CreatedRef:
    return _create_ref(value)


@callback("FishyJoes_DoubleConstructorFn")
def _double_constructor(value: float) -> CreatedRef:
    return _create_ref(value)


# MARK: setup

def setup_primitives() -> None:
    env_ref = FishyJoesRuntime.shared.env_ref
    with local_handles(True, False) as (true_ref, false_ref):
        Swift_Bool_setup(env_ref, true_ref, false_ref, _bool_value_extract)
    Swift_Int8_setup(env_ref, _int8_value_extract, _int8_constructor)
    Swift_Int16_setup(env_ref, _int16_value_extract, _int16_constructor)
    Swift_Int32_setup(env_ref, _int32_value_extract, _int32_constructor)
    Swift_Int64_setup(env_ref, _int64_value_extract, _int64_constructor)
    Swift_Int_setup(env_ref, _int_value_extract, _int_constructor)
    Swift_UInt8_setup(env_ref, _uint8_value_extract, _uint8_constructor)
    Swift_UInt16_setup(env_ref, _uint16_value_extract, _uint16_constructor)
    Swift_UInt32_setup(env_ref, _uint32_value_extract, _uint32_constructor)
    Swift_UInt64_setup(env_ref, _uint64_value_extract, _uint64_constructor)
    Swift_UInt_setup(env_ref, _uint_value_extract, _uint_constructor)
    Swift_Float_setup(env_ref, _float_value_extract, _float_constructor)
    Swift_Double_setup(env_ref, _double_value_extract, _double_constructor)
