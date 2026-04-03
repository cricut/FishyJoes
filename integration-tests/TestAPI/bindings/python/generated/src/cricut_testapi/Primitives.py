from __future__ import annotations
from dataclasses import dataclass
import enum
import typing
from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented

class Primitives:
    """
    <!-- FishyJoes.export(Primitives) -->
    Generated FishyJoes Python namespace type.
    """
    @staticmethod
    def bitCountInt() -> int:
        """
        <!-- FishyJoes.export(bitCountInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_bitCountInt", "object")
    

    @staticmethod
    def bitCountUInt() -> int:
        """
        <!-- FishyJoes.export(bitCountUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_bitCountUInt", "object")
    

    @staticmethod
    def defaultPrimitiveHolder() -> PrimitiveHolder:
        """
        <!-- FishyJoes.export(defaultPrimitiveHolder) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_defaultPrimitiveHolder", "object")
    

    @staticmethod
    def falseBool() -> int:
        """
        <!-- FishyJoes.export(falseBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_falseBool", "object")
    

    @staticmethod
    def manyBool() -> list[int]:
        """
        <!-- FishyJoes.export(manyBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyBool", "object")
    

    @staticmethod
    def manyDouble() -> list[int]:
        """
        <!-- FishyJoes.export(manyDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyDouble", "object")
    

    @staticmethod
    def manyFloat() -> list[int]:
        """
        <!-- FishyJoes.export(manyFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyFloat", "object")
    

    @staticmethod
    def manyInt() -> list[int]:
        """
        <!-- FishyJoes.export(manyInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyInt", "object")
    

    @staticmethod
    def manyInt16() -> list[int]:
        """
        <!-- FishyJoes.export(manyInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyInt16", "object")
    

    @staticmethod
    def manyInt32() -> list[int]:
        """
        <!-- FishyJoes.export(manyInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyInt32", "object")
    

    @staticmethod
    def manyInt64() -> list[int]:
        """
        <!-- FishyJoes.export(manyInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyInt64", "object")
    

    @staticmethod
    def manyInt8() -> list[int]:
        """
        <!-- FishyJoes.export(manyInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyInt8", "object")
    

    @staticmethod
    def manyMaybeBool() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeBool", "object")
    

    @staticmethod
    def manyMaybeDouble() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeDouble", "object")
    

    @staticmethod
    def manyMaybeFloat() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeFloat", "object")
    

    @staticmethod
    def manyMaybeInt() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeInt", "object")
    

    @staticmethod
    def manyMaybeInt16() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeInt16", "object")
    

    @staticmethod
    def manyMaybeInt32() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeInt32", "object")
    

    @staticmethod
    def manyMaybeInt64() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeInt64", "object")
    

    @staticmethod
    def manyMaybeInt8() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeInt8", "object")
    

    @staticmethod
    def manyMaybeUInt() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeUInt", "object")
    

    @staticmethod
    def manyMaybeUInt16() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeUInt16", "object")
    

    @staticmethod
    def manyMaybeUInt32() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeUInt32", "object")
    

    @staticmethod
    def manyMaybeUInt64() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeUInt64", "object")
    

    @staticmethod
    def manyMaybeUInt8() -> list[int | None]:
        """
        <!-- FishyJoes.export(manyMaybeUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyMaybeUInt8", "object")
    

    @staticmethod
    def manyUInt() -> list[int]:
        """
        <!-- FishyJoes.export(manyUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyUInt", "object")
    

    @staticmethod
    def manyUInt16() -> list[int]:
        """
        <!-- FishyJoes.export(manyUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyUInt16", "object")
    

    @staticmethod
    def manyUInt32() -> list[int]:
        """
        <!-- FishyJoes.export(manyUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyUInt32", "object")
    

    @staticmethod
    def manyUInt64() -> list[int]:
        """
        <!-- FishyJoes.export(manyUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyUInt64", "object")
    

    @staticmethod
    def manyUInt8() -> list[int]:
        """
        <!-- FishyJoes.export(manyUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_manyUInt8", "object")
    

    @staticmethod
    def maxDouble() -> int:
        """
        <!-- FishyJoes.export(maxDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxDouble", "object")
    

    @staticmethod
    def maxFloat() -> int:
        """
        <!-- FishyJoes.export(maxFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxFloat", "object")
    

    @staticmethod
    def maxInt() -> int:
        """
        <!-- FishyJoes.export(maxInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxInt", "object")
    

    @staticmethod
    def maxInt16() -> int:
        """
        <!-- FishyJoes.export(maxInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxInt16", "object")
    

    @staticmethod
    def maxInt32() -> int:
        """
        <!-- FishyJoes.export(maxInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxInt32", "object")
    

    @staticmethod
    def maxInt64() -> int:
        """
        <!-- FishyJoes.export(maxInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxInt64", "object")
    

    @staticmethod
    def maxInt8() -> int:
        """
        <!-- FishyJoes.export(maxInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxInt8", "object")
    

    @staticmethod
    def maxUInt() -> int:
        """
        <!-- FishyJoes.export(maxUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxUInt", "object")
    

    @staticmethod
    def maxUInt16() -> int:
        """
        <!-- FishyJoes.export(maxUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxUInt16", "object")
    

    @staticmethod
    def maxUInt32() -> int:
        """
        <!-- FishyJoes.export(maxUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxUInt32", "object")
    

    @staticmethod
    def maxUInt64() -> int:
        """
        <!-- FishyJoes.export(maxUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxUInt64", "object")
    

    @staticmethod
    def maxUInt8() -> int:
        """
        <!-- FishyJoes.export(maxUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_maxUInt8", "object")
    

    @staticmethod
    def minDouble() -> int:
        """
        <!-- FishyJoes.export(minDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minDouble", "object")
    

    @staticmethod
    def minFloat() -> int:
        """
        <!-- FishyJoes.export(minFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minFloat", "object")
    

    @staticmethod
    def minInt() -> int:
        """
        <!-- FishyJoes.export(minInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minInt", "object")
    

    @staticmethod
    def minInt16() -> int:
        """
        <!-- FishyJoes.export(minInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minInt16", "object")
    

    @staticmethod
    def minInt32() -> int:
        """
        <!-- FishyJoes.export(minInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minInt32", "object")
    

    @staticmethod
    def minInt64() -> int:
        """
        <!-- FishyJoes.export(minInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minInt64", "object")
    

    @staticmethod
    def minInt8() -> int:
        """
        <!-- FishyJoes.export(minInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minInt8", "object")
    

    @staticmethod
    def minUInt() -> int:
        """
        <!-- FishyJoes.export(minUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minUInt", "object")
    

    @staticmethod
    def minUInt16() -> int:
        """
        <!-- FishyJoes.export(minUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minUInt16", "object")
    

    @staticmethod
    def minUInt32() -> int:
        """
        <!-- FishyJoes.export(minUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minUInt32", "object")
    

    @staticmethod
    def minUInt64() -> int:
        """
        <!-- FishyJoes.export(minUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minUInt64", "object")
    

    @staticmethod
    def minUInt8() -> int:
        """
        <!-- FishyJoes.export(minUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_minUInt8", "object")
    

    @staticmethod
    def trueBool() -> int:
        """
        <!-- FishyJoes.export(trueBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_trueBool", "object")
    

    @staticmethod
    def zeroDouble() -> int:
        """
        <!-- FishyJoes.export(zeroDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroDouble", "object")
    

    @staticmethod
    def zeroFloat() -> int:
        """
        <!-- FishyJoes.export(zeroFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroFloat", "object")
    

    @staticmethod
    def zeroInt() -> int:
        """
        <!-- FishyJoes.export(zeroInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroInt", "object")
    

    @staticmethod
    def zeroInt16() -> int:
        """
        <!-- FishyJoes.export(zeroInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroInt16", "object")
    

    @staticmethod
    def zeroInt32() -> int:
        """
        <!-- FishyJoes.export(zeroInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroInt32", "object")
    

    @staticmethod
    def zeroInt64() -> int:
        """
        <!-- FishyJoes.export(zeroInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroInt64", "object")
    

    @staticmethod
    def zeroInt8() -> int:
        """
        <!-- FishyJoes.export(zeroInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroInt8", "object")
    

    @staticmethod
    def zeroUInt() -> int:
        """
        <!-- FishyJoes.export(zeroUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroUInt", "object")
    

    @staticmethod
    def zeroUInt16() -> int:
        """
        <!-- FishyJoes.export(zeroUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroUInt16", "object")
    

    @staticmethod
    def zeroUInt32() -> int:
        """
        <!-- FishyJoes.export(zeroUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroUInt32", "object")
    

    @staticmethod
    def zeroUInt64() -> int:
        """
        <!-- FishyJoes.export(zeroUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroUInt64", "object")
    

    @staticmethod
    def zeroUInt8() -> int:
        """
        <!-- FishyJoes.export(zeroUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_get_TestAPI_Primitives_zeroUInt8", "object")
    

    @staticmethod
    def echoBool(value: int) -> int:
        """
        <!-- FishyJoes.export(echoBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoBool", "object", ("object", value))
    

    @staticmethod
    def echoUInt8(value: int) -> int:
        """
        <!-- FishyJoes.export(echoUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoUInt8", "object", ("object", value))
    

    @staticmethod
    def echoUInt16(value: int) -> int:
        """
        <!-- FishyJoes.export(echoUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoUInt16", "object", ("object", value))
    

    @staticmethod
    def echoUInt32(value: int) -> int:
        """
        <!-- FishyJoes.export(echoUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoUInt32", "object", ("object", value))
    

    @staticmethod
    def echoUInt64(value: int) -> int:
        """
        <!-- FishyJoes.export(echoUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoUInt64", "object", ("object", value))
    

    @staticmethod
    def echoUInt(value: int) -> int:
        """
        <!-- FishyJoes.export(echoUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoUInt", "object", ("object", value))
    

    @staticmethod
    def echoInt8(value: int) -> int:
        """
        <!-- FishyJoes.export(echoInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoInt8", "object", ("object", value))
    

    @staticmethod
    def echoInt16(value: int) -> int:
        """
        <!-- FishyJoes.export(echoInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoInt16", "object", ("object", value))
    

    @staticmethod
    def echoInt32(value: int) -> int:
        """
        <!-- FishyJoes.export(echoInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoInt32", "object", ("object", value))
    

    @staticmethod
    def echoInt64(value: int) -> int:
        """
        <!-- FishyJoes.export(echoInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoInt64", "object", ("object", value))
    

    @staticmethod
    def echoInt(value: int) -> int:
        """
        <!-- FishyJoes.export(echoInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoInt", "object", ("object", value))
    

    @staticmethod
    def echoFloat(value: int) -> int:
        """
        <!-- FishyJoes.export(echoFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoFloat", "object", ("object", value))
    

    @staticmethod
    def echoDouble(value: int) -> int:
        """
        <!-- FishyJoes.export(echoDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_echoDouble", "object", ("object", value))
    

    @staticmethod
    def maybeEchoBool(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoBool) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoBool", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt8(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoUInt8", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt16(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoUInt16", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt32(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoUInt32", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt64(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoUInt64", "object", ("object", value))
    

    @staticmethod
    def maybeEchoUInt(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoUInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoUInt", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt8(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt8) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoInt8", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt16(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt16) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoInt16", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt32(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt32) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoInt32", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt64(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt64) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoInt64", "object", ("object", value))
    

    @staticmethod
    def maybeEchoInt(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoInt) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoInt", "object", ("object", value))
    

    @staticmethod
    def maybeEchoFloat(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoFloat) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoFloat", "object", ("object", value))
    

    @staticmethod
    def maybeEchoDouble(value: int | None) -> int | None:
        """
        <!-- FishyJoes.export(maybeEchoDouble) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_maybeEchoDouble", "object", ("object", value))
    

    @staticmethod
    def boolOverflow(b0: int, b1: int, b2: int, b3: int, b4: int, b5: int, b6: int, b7: int, b8: int, b9: int, ba: int, bb: int, bc: int, bd: int, be: int, bf: int) -> int:
        """
        <!-- FishyJoes.export(boolOverflow) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_boolOverflow", "object", ("object", b0), ("object", b1), ("object", b2), ("object", b3), ("object", b4), ("object", b5), ("object", b6), ("object", b7), ("object", b8), ("object", b9), ("object", ba), ("object", bb), ("object", bc), ("object", bd), ("object", be), ("object", bf))
    

    @staticmethod
    def valueMapper(value: int | None, mapper: typing.Callable[[int | None], int | None]) -> int | None:
        """
        <!-- FishyJoes.export(valueMapper) -->
        """
        _ensure_runtime_loaded()
        return _get_runtime().invoke("__iota_TestAPI_Primitives_valueMapper", "object", ("object", value), ("object", mapper))
    
