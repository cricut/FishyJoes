from __future__ import annotations
from dataclasses import dataclass
import builtins
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented
if typing.TYPE_CHECKING: from .PrimitiveHolder import PrimitiveHolder

class Primitives:
    """
    <!-- FishyJoes.export(Primitives) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def bitCountInt() -> builtins.int:
        """
        <!-- FishyJoes.export(bitCountInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_bitCountInt", "int")
    

    @staticmethod
    def bitCountUInt() -> builtins.int:
        """
        <!-- FishyJoes.export(bitCountUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_bitCountUInt", "int")
    

    @staticmethod
    def defaultPrimitiveHolder() -> PrimitiveHolder:
        """
        <!-- FishyJoes.export(defaultPrimitiveHolder) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_defaultPrimitiveHolder", "object")
    

    @staticmethod
    def falseBool() -> builtins.bool:
        """
        <!-- FishyJoes.export(falseBool) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_get_TestAPI_Primitives_falseBool", "bool"))
    

    @staticmethod
    def manyBool() -> builtins.list[builtins.bool]:
        """
        <!-- FishyJoes.export(manyBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyBool", "object")
    

    @staticmethod
    def manyDouble() -> builtins.list[builtins.float]:
        """
        <!-- FishyJoes.export(manyDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyDouble", "object")
    

    @staticmethod
    def manyFloat() -> builtins.list[builtins.float]:
        """
        <!-- FishyJoes.export(manyFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyFloat", "object")
    

    @staticmethod
    def manyInt() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyInt", "object")
    

    @staticmethod
    def manyInt16() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyInt16", "object")
    

    @staticmethod
    def manyInt32() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyInt32", "object")
    

    @staticmethod
    def manyInt64() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyInt64", "object")
    

    @staticmethod
    def manyInt8() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyInt8", "object")
    

    @staticmethod
    def manyMaybeBool() -> builtins.list[builtins.bool | None]:
        """
        <!-- FishyJoes.export(manyMaybeBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeBool", "object")
    

    @staticmethod
    def manyMaybeDouble() -> builtins.list[builtins.float | None]:
        """
        <!-- FishyJoes.export(manyMaybeDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeDouble", "object")
    

    @staticmethod
    def manyMaybeFloat() -> builtins.list[builtins.float | None]:
        """
        <!-- FishyJoes.export(manyMaybeFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeFloat", "object")
    

    @staticmethod
    def manyMaybeInt() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeInt", "object")
    

    @staticmethod
    def manyMaybeInt16() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeInt16", "object")
    

    @staticmethod
    def manyMaybeInt32() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeInt32", "object")
    

    @staticmethod
    def manyMaybeInt64() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeInt64", "object")
    

    @staticmethod
    def manyMaybeInt8() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeInt8", "object")
    

    @staticmethod
    def manyMaybeUInt() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeUInt", "object")
    

    @staticmethod
    def manyMaybeUInt16() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeUInt16", "object")
    

    @staticmethod
    def manyMaybeUInt32() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeUInt32", "object")
    

    @staticmethod
    def manyMaybeUInt64() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeUInt64", "object")
    

    @staticmethod
    def manyMaybeUInt8() -> builtins.list[builtins.int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyMaybeUInt8", "object")
    

    @staticmethod
    def manyUInt() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyUInt", "object")
    

    @staticmethod
    def manyUInt16() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyUInt16", "object")
    

    @staticmethod
    def manyUInt32() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyUInt32", "object")
    

    @staticmethod
    def manyUInt64() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyUInt64", "object")
    

    @staticmethod
    def manyUInt8() -> builtins.list[builtins.int]:
        """
        <!-- FishyJoes.export(manyUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_manyUInt8", "object")
    

    @staticmethod
    def maxDouble() -> builtins.float:
        """
        <!-- FishyJoes.export(maxDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxDouble", "double")
    

    @staticmethod
    def maxFloat() -> builtins.float:
        """
        <!-- FishyJoes.export(maxFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxFloat", "float")
    

    @staticmethod
    def maxInt() -> builtins.int:
        """
        <!-- FishyJoes.export(maxInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxInt", "int")
    

    @staticmethod
    def maxInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(maxInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxInt16", "int16")
    

    @staticmethod
    def maxInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(maxInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxInt32", "int32")
    

    @staticmethod
    def maxInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(maxInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxInt64", "int64")
    

    @staticmethod
    def maxInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(maxInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxInt8", "int8")
    

    @staticmethod
    def maxUInt() -> builtins.int:
        """
        <!-- FishyJoes.export(maxUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxUInt", "uint")
    

    @staticmethod
    def maxUInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(maxUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxUInt16", "uint16")
    

    @staticmethod
    def maxUInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(maxUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxUInt32", "uint32")
    

    @staticmethod
    def maxUInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(maxUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxUInt64", "uint64")
    

    @staticmethod
    def maxUInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(maxUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_maxUInt8", "uint8")
    

    @staticmethod
    def minDouble() -> builtins.float:
        """
        <!-- FishyJoes.export(minDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minDouble", "double")
    

    @staticmethod
    def minFloat() -> builtins.float:
        """
        <!-- FishyJoes.export(minFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minFloat", "float")
    

    @staticmethod
    def minInt() -> builtins.int:
        """
        <!-- FishyJoes.export(minInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minInt", "int")
    

    @staticmethod
    def minInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(minInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minInt16", "int16")
    

    @staticmethod
    def minInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(minInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minInt32", "int32")
    

    @staticmethod
    def minInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(minInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minInt64", "int64")
    

    @staticmethod
    def minInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(minInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minInt8", "int8")
    

    @staticmethod
    def minUInt() -> builtins.int:
        """
        <!-- FishyJoes.export(minUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minUInt", "uint")
    

    @staticmethod
    def minUInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(minUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minUInt16", "uint16")
    

    @staticmethod
    def minUInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(minUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minUInt32", "uint32")
    

    @staticmethod
    def minUInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(minUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minUInt64", "uint64")
    

    @staticmethod
    def minUInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(minUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_minUInt8", "uint8")
    

    @staticmethod
    def trueBool() -> builtins.bool:
        """
        <!-- FishyJoes.export(trueBool) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_get_TestAPI_Primitives_trueBool", "bool"))
    

    @staticmethod
    def zeroDouble() -> builtins.float:
        """
        <!-- FishyJoes.export(zeroDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroDouble", "double")
    

    @staticmethod
    def zeroFloat() -> builtins.float:
        """
        <!-- FishyJoes.export(zeroFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroFloat", "float")
    

    @staticmethod
    def zeroInt() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroInt", "int")
    

    @staticmethod
    def zeroInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroInt16", "int16")
    

    @staticmethod
    def zeroInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroInt32", "int32")
    

    @staticmethod
    def zeroInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroInt64", "int64")
    

    @staticmethod
    def zeroInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroInt8", "int8")
    

    @staticmethod
    def zeroUInt() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroUInt", "uint")
    

    @staticmethod
    def zeroUInt16() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroUInt16", "uint16")
    

    @staticmethod
    def zeroUInt32() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroUInt32", "uint32")
    

    @staticmethod
    def zeroUInt64() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroUInt64", "uint64")
    

    @staticmethod
    def zeroUInt8() -> builtins.int:
        """
        <!-- FishyJoes.export(zeroUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_get_TestAPI_Primitives_zeroUInt8", "uint8")
    

    @staticmethod
    def echoBool(value: builtins.bool) -> builtins.bool:
        """
        <!-- FishyJoes.export(echoBool) -->
        """
        _ensure_runtime_loaded()
        return bool(_get_runtime().call_symbol("__iota_TestAPI_Primitives_echoBool", "bool", ("bool", value)))
    

    @staticmethod
    def echoUInt8(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoUInt8", "uint8", ("uint8", value))
    

    @staticmethod
    def echoUInt16(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoUInt16", "uint16", ("uint16", value))
    

    @staticmethod
    def echoUInt32(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoUInt32", "uint32", ("uint32", value))
    

    @staticmethod
    def echoUInt64(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoUInt64", "uint64", ("uint64", value))
    

    @staticmethod
    def echoUInt(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoUInt", "uint", ("uint", value))
    

    @staticmethod
    def echoInt8(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoInt8", "int8", ("int8", value))
    

    @staticmethod
    def echoInt16(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoInt16", "int16", ("int16", value))
    

    @staticmethod
    def echoInt32(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoInt32", "int32", ("int32", value))
    

    @staticmethod
    def echoInt64(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoInt64", "int64", ("int64", value))
    

    @staticmethod
    def echoInt(value: builtins.int) -> builtins.int:
        """
        <!-- FishyJoes.export(echoInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoInt", "int", ("int", value))
    

    @staticmethod
    def echoFloat(value: builtins.float) -> builtins.float:
        """
        <!-- FishyJoes.export(echoFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoFloat", "float", ("float", value))
    

    @staticmethod
    def echoDouble(value: builtins.float) -> builtins.float:
        """
        <!-- FishyJoes.export(echoDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_echoDouble", "double", ("double", value))
    

    @staticmethod
    def maybeEchoBool(value: builtins.bool | None) -> builtins.bool | None:
        """
        <!-- FishyJoes.export(maybeEchoBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoBool", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt8(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoUInt8", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt16(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoUInt16", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt32(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoUInt32", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt64(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoUInt64", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoUInt", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt8(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoInt8", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt16(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoInt16", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt32(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoInt32", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt64(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoInt64", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt(value: builtins.int | None) -> builtins.int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoInt", "object", ("object", value))
    

    @staticmethod
    def maybeEchoFloat(value: builtins.float | None) -> builtins.float | None:
        """
        <!-- FishyJoes.export(maybeEchoFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoFloat", "object", ("object", value))
    

    @staticmethod
    def maybeEchoDouble(value: builtins.float | None) -> builtins.float | None:
        """
        <!-- FishyJoes.export(maybeEchoDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_maybeEchoDouble", "object", ("object", value))
    

    @staticmethod
    def boolOverflow(b0: builtins.bool, b1: builtins.bool, b2: builtins.bool, b3: builtins.bool, b4: builtins.bool, b5: builtins.bool, b6: builtins.bool, b7: builtins.bool, b8: builtins.bool, b9: builtins.bool, ba: builtins.bool, bb: builtins.bool, bc: builtins.bool, bd: builtins.bool, be: builtins.bool, bf: builtins.bool) -> builtins.int:
        """
        <!-- FishyJoes.export(boolOverflow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_boolOverflow", "int", ("bool", b0), ("bool", b1), ("bool", b2), ("bool", b3), ("bool", b4), ("bool", b5), ("bool", b6), ("bool", b7), ("bool", b8), ("bool", b9), ("bool", ba), ("bool", bb), ("bool", bc), ("bool", bd), ("bool", be), ("bool", bf))
    

    @staticmethod
    def valueMapper(value: builtins.int | None, mapper: typing.Callable[[builtins.int | None], builtins.int | None]) -> builtins.int | None:
        """
        <!-- FishyJoes.export(valueMapper) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().call_symbol("__iota_TestAPI_Primitives_valueMapper", "object", ("object", value), ("object", mapper))
    
