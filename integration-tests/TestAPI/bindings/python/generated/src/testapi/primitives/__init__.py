from __future__ import annotations
from .. import _primitives_implementation as _impl
from .. import _testapi_exported as testapi
from ._primitive_holder_type import PrimitiveHolder
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "PrimitiveHolder",
    "get_bit_count_int",
    "get_bit_count_u_int",
    "get_default_primitive_holder",
    "get_false_bool",
    "get_many_bool",
    "get_many_double",
    "get_many_float",
    "get_many_int",
    "get_many_int16",
    "get_many_int32",
    "get_many_int64",
    "get_many_int8",
    "get_many_maybe_bool",
    "get_many_maybe_double",
    "get_many_maybe_float",
    "get_many_maybe_int",
    "get_many_maybe_int16",
    "get_many_maybe_int32",
    "get_many_maybe_int64",
    "get_many_maybe_int8",
    "get_many_maybe_uint",
    "get_many_maybe_uint16",
    "get_many_maybe_uint32",
    "get_many_maybe_uint64",
    "get_many_maybe_uint8",
    "get_many_uint",
    "get_many_uint16",
    "get_many_uint32",
    "get_many_uint64",
    "get_many_uint8",
    "get_max_double",
    "get_max_float",
    "get_max_int",
    "get_max_int16",
    "get_max_int32",
    "get_max_int64",
    "get_max_int8",
    "get_max_uint",
    "get_max_uint16",
    "get_max_uint32",
    "get_max_uint64",
    "get_max_uint8",
    "get_min_double",
    "get_min_float",
    "get_min_int",
    "get_min_int16",
    "get_min_int32",
    "get_min_int64",
    "get_min_int8",
    "get_min_uint",
    "get_min_uint16",
    "get_min_uint32",
    "get_min_uint64",
    "get_min_uint8",
    "get_true_bool",
    "get_zero_double",
    "get_zero_float",
    "get_zero_int",
    "get_zero_int16",
    "get_zero_int32",
    "get_zero_int64",
    "get_zero_int8",
    "get_zero_uint",
    "get_zero_uint16",
    "get_zero_uint32",
    "get_zero_uint64",
    "get_zero_uint8",
    "echo_bool",
    "echo_uint8",
    "echo_uint16",
    "echo_uint32",
    "echo_uint64",
    "echo_uint",
    "echo_int8",
    "echo_int16",
    "echo_int32",
    "echo_int64",
    "echo_int",
    "echo_float",
    "echo_double",
    "maybe_echo_bool",
    "maybe_echo_uint8",
    "maybe_echo_uint16",
    "maybe_echo_uint32",
    "maybe_echo_uint64",
    "maybe_echo_uint",
    "maybe_echo_int8",
    "maybe_echo_int16",
    "maybe_echo_int32",
    "maybe_echo_int64",
    "maybe_echo_int",
    "maybe_echo_float",
    "maybe_echo_double",
    "bool_overflow",
    "value_mapper",
]

def get_bit_count_int() -> int:
    """<!-- FishyJoes.export(bitCountInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_bitCountInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_bit_count_u_int() -> int:
    """<!-- FishyJoes.export(bitCountUInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_bitCountUInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_default_primitive_holder() -> testapi.primitives.PrimitiveHolder:
    """<!-- FishyJoes.export(defaultPrimitiveHolder) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_defaultPrimitiveHolder(fishyjoes_runtime.Runtime.shared.env_ref), testapi.primitives.PrimitiveHolder)

def get_false_bool() -> bool:
    """<!-- FishyJoes.export(falseBool) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_falseBool(fishyjoes_runtime.Runtime.shared.env_ref), bool)

def get_many_bool() -> list[bool]:
    """<!-- FishyJoes.export(manyBool) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyBool(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_double() -> list[float]:
    """<!-- FishyJoes.export(manyDouble) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyDouble(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_float() -> list[float]:
    """<!-- FishyJoes.export(manyFloat) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyFloat(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_int() -> list[int]:
    """<!-- FishyJoes.export(manyInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyInt(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_int16() -> list[int]:
    """<!-- FishyJoes.export(manyInt16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyInt16(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_int32() -> list[int]:
    """<!-- FishyJoes.export(manyInt32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyInt32(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_int64() -> list[int]:
    """<!-- FishyJoes.export(manyInt64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyInt64(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_int8() -> list[int]:
    """<!-- FishyJoes.export(manyInt8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyInt8(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_bool() -> list[bool | None]:
    """<!-- FishyJoes.export(manyMaybeBool) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeBool(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_double() -> list[float | None]:
    """<!-- FishyJoes.export(manyMaybeDouble) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeDouble(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_float() -> list[float | None]:
    """<!-- FishyJoes.export(manyMaybeFloat) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeFloat(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_int() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeInt(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_int16() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeInt16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeInt16(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_int32() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeInt32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeInt32(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_int64() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeInt64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeInt64(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_int8() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeInt8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeInt8(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_uint() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeUInt, python: many_maybe_uint) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeUInt(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_uint16() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeUInt16, python: many_maybe_uint16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeUInt16(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_uint32() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeUInt32, python: many_maybe_uint32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeUInt32(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_uint64() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeUInt64, python: many_maybe_uint64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeUInt64(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_maybe_uint8() -> list[int | None]:
    """<!-- FishyJoes.export(manyMaybeUInt8, python: many_maybe_uint8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyMaybeUInt8(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_uint() -> list[int]:
    """<!-- FishyJoes.export(manyUInt, python: many_uint) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyUInt(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_uint16() -> list[int]:
    """<!-- FishyJoes.export(manyUInt16, python: many_uint16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyUInt16(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_uint32() -> list[int]:
    """<!-- FishyJoes.export(manyUInt32, python: many_uint32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyUInt32(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_uint64() -> list[int]:
    """<!-- FishyJoes.export(manyUInt64, python: many_uint64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyUInt64(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_many_uint8() -> list[int]:
    """<!-- FishyJoes.export(manyUInt8, python: many_uint8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_manyUInt8(fishyjoes_runtime.Runtime.shared.env_ref), list)

def get_max_double() -> float:
    """<!-- FishyJoes.export(maxDouble) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxDouble(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_max_float() -> float:
    """<!-- FishyJoes.export(maxFloat) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxFloat(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_max_int() -> int:
    """<!-- FishyJoes.export(maxInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_int16() -> int:
    """<!-- FishyJoes.export(maxInt16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_int32() -> int:
    """<!-- FishyJoes.export(maxInt32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_int64() -> int:
    """<!-- FishyJoes.export(maxInt64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_int8() -> int:
    """<!-- FishyJoes.export(maxInt8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_uint() -> int:
    """<!-- FishyJoes.export(maxUInt, python: max_uint) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxUInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_uint16() -> int:
    """<!-- FishyJoes.export(maxUInt16, python: max_uint16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxUInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_uint32() -> int:
    """<!-- FishyJoes.export(maxUInt32, python: max_uint32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxUInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_uint64() -> int:
    """<!-- FishyJoes.export(maxUInt64, python: max_uint64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxUInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_max_uint8() -> int:
    """<!-- FishyJoes.export(maxUInt8, python: max_uint8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_maxUInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_double() -> float:
    """<!-- FishyJoes.export(minDouble) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minDouble(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_min_float() -> float:
    """<!-- FishyJoes.export(minFloat) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minFloat(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_min_int() -> int:
    """<!-- FishyJoes.export(minInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_int16() -> int:
    """<!-- FishyJoes.export(minInt16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_int32() -> int:
    """<!-- FishyJoes.export(minInt32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_int64() -> int:
    """<!-- FishyJoes.export(minInt64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_int8() -> int:
    """<!-- FishyJoes.export(minInt8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_uint() -> int:
    """<!-- FishyJoes.export(minUInt, python: min_uint) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minUInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_uint16() -> int:
    """<!-- FishyJoes.export(minUInt16, python: min_uint16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minUInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_uint32() -> int:
    """<!-- FishyJoes.export(minUInt32, python: min_uint32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minUInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_uint64() -> int:
    """<!-- FishyJoes.export(minUInt64, python: min_uint64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minUInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_min_uint8() -> int:
    """<!-- FishyJoes.export(minUInt8, python: min_uint8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_minUInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_true_bool() -> bool:
    """<!-- FishyJoes.export(trueBool) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_trueBool(fishyjoes_runtime.Runtime.shared.env_ref), bool)

def get_zero_double() -> float:
    """<!-- FishyJoes.export(zeroDouble) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroDouble(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_zero_float() -> float:
    """<!-- FishyJoes.export(zeroFloat) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroFloat(fishyjoes_runtime.Runtime.shared.env_ref), float)

def get_zero_int() -> int:
    """<!-- FishyJoes.export(zeroInt) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_int16() -> int:
    """<!-- FishyJoes.export(zeroInt16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_int32() -> int:
    """<!-- FishyJoes.export(zeroInt32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_int64() -> int:
    """<!-- FishyJoes.export(zeroInt64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_int8() -> int:
    """<!-- FishyJoes.export(zeroInt8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_uint() -> int:
    """<!-- FishyJoes.export(zeroUInt, python: zero_uint) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroUInt(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_uint16() -> int:
    """<!-- FishyJoes.export(zeroUInt16, python: zero_uint16) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroUInt16(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_uint32() -> int:
    """<!-- FishyJoes.export(zeroUInt32, python: zero_uint32) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroUInt32(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_uint64() -> int:
    """<!-- FishyJoes.export(zeroUInt64, python: zero_uint64) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroUInt64(fishyjoes_runtime.Runtime.shared.env_ref), int)

def get_zero_uint8() -> int:
    """<!-- FishyJoes.export(zeroUInt8, python: zero_uint8) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Primitives_zeroUInt8(fishyjoes_runtime.Runtime.shared.env_ref), int)

def echo_bool(
    value: bool,
) -> bool:
    """<!-- FishyJoes.export(echoBool) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoBool(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            bool
        )

def echo_uint8(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoUInt8, python: echo_uint8) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoUInt8(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_uint16(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoUInt16, python: echo_uint16) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoUInt16(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_uint32(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoUInt32, python: echo_uint32) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoUInt32(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_uint64(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoUInt64, python: echo_uint64) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoUInt64(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_uint(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoUInt, python: echo_uint) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoUInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_int8(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoInt8) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoInt8(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_int16(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoInt16) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoInt16(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_int32(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoInt32) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoInt32(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_int64(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoInt64) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoInt64(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_int(
    value: int,
) -> int:
    """<!-- FishyJoes.export(echoInt) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int
        )

def echo_float(
    value: float,
) -> float:
    """<!-- FishyJoes.export(echoFloat) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoFloat(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            float
        )

def echo_double(
    value: float,
) -> float:
    """<!-- FishyJoes.export(echoDouble) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_echoDouble(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            float
        )

def maybe_echo_bool(
    value: bool | None,
) -> bool | None:
    """<!-- FishyJoes.export(maybeEchoBool) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoBool(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            bool, types.NoneType
        )

def maybe_echo_uint8(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoUInt8, python: maybe_echo_uint8) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoUInt8(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_uint16(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoUInt16, python: maybe_echo_uint16) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoUInt16(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_uint32(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoUInt32, python: maybe_echo_uint32) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoUInt32(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_uint64(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoUInt64, python: maybe_echo_uint64) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoUInt64(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_uint(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoUInt, python: maybe_echo_uint) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoUInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_int8(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoInt8) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoInt8(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_int16(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoInt16) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoInt16(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_int32(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoInt32) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoInt32(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_int64(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoInt64) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoInt64(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_int(
    value: int | None,
) -> int | None:
    """<!-- FishyJoes.export(maybeEchoInt) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoInt(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            int, types.NoneType
        )

def maybe_echo_float(
    value: float | None,
) -> float | None:
    """<!-- FishyJoes.export(maybeEchoFloat) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoFloat(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            float, types.NoneType
        )

def maybe_echo_double(
    value: float | None,
) -> float | None:
    """<!-- FishyJoes.export(maybeEchoDouble) -->"""
    with fishyjoes_runtime.local_handles(value) as (_valueHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_maybeEchoDouble(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
            ),
            float, types.NoneType
        )

def bool_overflow(
    b0: bool,
    b1: bool,
    b2: bool,
    b3: bool,
    b4: bool,
    b5: bool,
    b6: bool,
    b7: bool,
    b8: bool,
    b9: bool,
    ba: bool,
    bb: bool,
    bc: bool,
    bd: bool,
    be: bool,
    bf: bool,
) -> int:
    """<!-- FishyJoes.export(boolOverflow) -->"""
    with fishyjoes_runtime.local_handles(b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, ba, bb, bc, bd, be, bf) as (_b0Handle, _b1Handle, _b2Handle, _b3Handle, _b4Handle, _b5Handle, _b6Handle, _b7Handle, _b8Handle, _b9Handle, _baHandle, _bbHandle, _bcHandle, _bdHandle, _beHandle, _bfHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_boolOverflow(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _b0Handle,
                _b1Handle,
                _b2Handle,
                _b3Handle,
                _b4Handle,
                _b5Handle,
                _b6Handle,
                _b7Handle,
                _b8Handle,
                _b9Handle,
                _baHandle,
                _bbHandle,
                _bcHandle,
                _bdHandle,
                _beHandle,
                _bfHandle,
            ),
            int
        )

def value_mapper(
    value: int | None,
    mapper: typing.Callable[[int | None], int | None],
) -> int | None:
    """<!-- FishyJoes.export(valueMapper) -->"""
    with fishyjoes_runtime.local_handles(value, mapper) as (_valueHandle, _mapperHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Primitives_valueMapper(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _valueHandle,
                _mapperHandle,
            ),
            int, types.NoneType
        )
