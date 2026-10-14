from __future__ import annotations
from .. import _closed_ranges_implementation as _impl
from .. import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

__all__: list[str] = [
    "get_double_range",
    "get_float_range",
    "get_int16_range",
    "get_int32_range",
    "get_int64_range",
    "get_int8_range",
    "get_int_range",
    "get_string_range",
    "get_uint16_range",
    "get_uint32_range",
    "get_uint64_range",
    "get_uint8_range",
    "get_uint_range",
    "echo_uint8_range",
    "echo_uint16_range",
    "echo_uint32_range",
    "echo_uint64_range",
    "echo_uint_range",
    "echo_int8_range",
    "echo_int16_range",
    "echo_int32_range",
    "echo_int64_range",
    "echo_int_range",
    "echo_float_range",
    "echo_double_range",
    "echo_string_range",
]

def get_double_range() -> fishyjoes_runtime.SwiftClosedRange[float]:
    """<!-- FishyJoes.export(doubleRange) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_double_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_float_range() -> fishyjoes_runtime.SwiftClosedRange[float]:
    """<!-- FishyJoes.export(floatRange) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_float_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_int16_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(int16Range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_int16_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_int32_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(int32Range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_int32_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_int64_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(int64Range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_int64_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_int8_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(int8Range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_int8_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_int_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(intRange) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_int_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_string_range() -> fishyjoes_runtime.SwiftClosedRange[str]:
    """<!-- FishyJoes.export(stringRange) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_string_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_uint16_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(uInt16Range, python: uint16_range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_uint16_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_uint32_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(uInt32Range, python: uint32_range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_uint32_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_uint64_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(uInt64Range, python: uint64_range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_uint64_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_uint8_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(uInt8Range, python: uint8_range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_uint8_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def get_uint_range() -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(uIntRange, python: uint_range) -->"""
    return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_ClosedRanges_uint_range(fishyjoes_runtime.Runtime.shared.env_ref), fishyjoes_runtime.SwiftClosedRange)

def echo_uint8_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoUInt8Range, python: echo_uint8_range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoUInt8Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_uint16_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoUInt16Range, python: echo_uint16_range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoUInt16Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_uint32_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoUInt32Range, python: echo_uint32_range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoUInt32Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_uint64_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoUInt64Range, python: echo_uint64_range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoUInt64Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_uint_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoUIntRange, python: echo_uint_range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoUIntRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_int8_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoInt8Range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoInt8Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_int16_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoInt16Range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoInt16Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_int32_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoInt32Range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoInt32Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_int64_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoInt64Range) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoInt64Range(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_int_range(
    range_: fishyjoes_runtime.SwiftClosedRange[int],
) -> fishyjoes_runtime.SwiftClosedRange[int]:
    """<!-- FishyJoes.export(echoIntRange) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoIntRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_float_range(
    range_: fishyjoes_runtime.SwiftClosedRange[float],
) -> fishyjoes_runtime.SwiftClosedRange[float]:
    """<!-- FishyJoes.export(echoFloatRange) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoFloatRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_double_range(
    range_: fishyjoes_runtime.SwiftClosedRange[float],
) -> fishyjoes_runtime.SwiftClosedRange[float]:
    """<!-- FishyJoes.export(echoDoubleRange) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoDoubleRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )

def echo_string_range(
    range_: fishyjoes_runtime.SwiftClosedRange[str],
) -> fishyjoes_runtime.SwiftClosedRange[str]:
    """<!-- FishyJoes.export(echoStringRange) -->"""
    with fishyjoes_runtime.local_handles(range_) as (_rangeHandle,):
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_ClosedRanges_echoStringRange(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _rangeHandle,
            ),
            fishyjoes_runtime.SwiftClosedRange
        )
