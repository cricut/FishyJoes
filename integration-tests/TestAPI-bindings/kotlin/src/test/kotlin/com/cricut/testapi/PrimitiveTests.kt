package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class PrimitiveTests {
    @Test
    fun testPrimitiveValues() {
        assertEquals(Primitives.falseBool, false)
        assertEquals(Primitives.trueBool, true)
        assertEquals(Primitives.zeroUInt8, 0.toUByte())
        assertEquals(Primitives.minUInt8, UByte.MIN_VALUE)
        assertEquals(Primitives.maxUInt8, UByte.MAX_VALUE)
        assertEquals(Primitives.zeroUInt16, 0.toUShort())
        assertEquals(Primitives.minUInt16, UShort.MIN_VALUE)
        assertEquals(Primitives.maxUInt16, UShort.MAX_VALUE)
        assertEquals(Primitives.zeroUInt32, 0.toUInt())
        assertEquals(Primitives.minUInt32, UInt.MIN_VALUE)
        assertEquals(Primitives.maxUInt32, UInt.MAX_VALUE)
        // TODO: UInt64
//        assertEquals(Primitives.zeroUInt64, 0.toULong())
//        assertEquals(Primitives.minUInt64, ULong.MIN_VALUE)
//        assertEquals(Primitives.maxUInt64, ULong.MAX_VALUE)
        assertEquals(Primitives.zeroInt8, 0.toByte())
        assertEquals(Primitives.minInt8, Byte.MIN_VALUE)
        assertEquals(Primitives.maxInt8, Byte.MAX_VALUE)
        assertEquals(Primitives.zeroInt16, 0.toShort())
        assertEquals(Primitives.minInt16, Short.MIN_VALUE)
        assertEquals(Primitives.maxInt16, Short.MAX_VALUE)
        assertEquals(Primitives.zeroInt32, 0.toInt())
        assertEquals(Primitives.minInt32, Int.MIN_VALUE)
        assertEquals(Primitives.maxInt32, Int.MAX_VALUE)
        // TODO: Int64
//        assertEquals(Primitives.zeroInt64, 0.toLong())
//        assertEquals(Primitives.minInt64, Long.MIN_VALUE)
//        assertEquals(Primitives.maxInt64, Long.MAX_VALUE)
        assertEquals(Primitives.zeroFloat, 0.0f)
        assertEquals(Primitives.minFloat, -Float.MAX_VALUE)
        assertEquals(Primitives.maxFloat, Float.MAX_VALUE)
        assertEquals(Primitives.zeroDouble, 0.0)
        assertEquals(Primitives.minDouble, -Double.MAX_VALUE)
        assertEquals(Primitives.maxDouble, Double.MAX_VALUE)
    }

    @Test
    fun testArraysOfPrimitiveValues() {
        assert(Primitives.manyBool.zip(arrayOf(false, true)).all { it.first == it.second })
        assert(Primitives.manyUInt8.zip(arrayOf(0.toUByte(), UByte.MIN_VALUE, UByte.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyUInt16.zip(arrayOf(0.toUShort(), UShort.MIN_VALUE, UShort.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyUInt32.zip(arrayOf(0.toUInt(), UInt.MIN_VALUE, UInt.MAX_VALUE)).all { it.first == it.second })
        // TODO: UInt64
//        assert(Primitives.manyUInt64.zip(arrayOf(0.toULong(), ULong.MIN_VALUE, ULong.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyInt8.zip(arrayOf(0.toByte(), Byte.MIN_VALUE, Byte.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyInt16.zip(arrayOf(0.toShort(), Short.MIN_VALUE, Short.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyInt32.zip(arrayOf(0.toInt(), Int.MIN_VALUE, Int.MAX_VALUE)).all { it.first == it.second })
        // TODO: Int64
//        assert(Primitives.manyInt64.zip(arrayOf(0.toLong(), Long.MIN_VALUE, Long.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyFloat.zip(arrayOf(0.toFloat(), -Float.MAX_VALUE, Float.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyDouble.zip(arrayOf(0.toDouble(), -Double.MAX_VALUE, Double.MAX_VALUE)).all { it.first == it.second })
    }

    @Test
    fun testArraysOfOptionalPrimitiveValues() {
        assert(Primitives.manyMaybeBool.zip(arrayOf(null, false, true)).all { it.first == it.second })
        assert(Primitives.manyMaybeUInt8.zip(arrayOf(null, 0.toUByte(), UByte.MIN_VALUE, UByte.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeUInt16.zip(arrayOf(null, 0.toUShort(), UShort.MIN_VALUE, UShort.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeUInt32.zip(arrayOf(null, 0.toUInt(), UInt.MIN_VALUE, UInt.MAX_VALUE)).all { it.first == it.second })
        // TODO: UInt64
//        assert(Primitives.manyMaybeUInt64.zip(arrayOf(null, 0.toULong(), ULong.MIN_VALUE, ULong.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeInt8.zip(arrayOf(null, 0.toByte(), Byte.MIN_VALUE, Byte.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeInt16.zip(arrayOf(null, 0.toShort(), Short.MIN_VALUE, Short.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeInt32.zip(arrayOf(null, 0.toInt(), Int.MIN_VALUE, Int.MAX_VALUE)).all { it.first == it.second })
        // TODO: Int64
//        assert(Primitives.manyMaybeInt64.zip(arrayOf(null, 0.toLong(), Long.MIN_VALUE, Long.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeFloat.zip(arrayOf(null, 0.toFloat(), -Float.MAX_VALUE, Float.MAX_VALUE)).all { it.first == it.second })
        assert(Primitives.manyMaybeDouble.zip(arrayOf(null, 0.toDouble(), -Double.MAX_VALUE, Double.MAX_VALUE)).all { it.first == it.second })
    }

    @Test
    fun testFunctionsTakingAndReturningPrimitiveTypes() {
        assertEquals(Primitives.echoBool(false), false)
        assertEquals(Primitives.echoBool(true), true)
        assertEquals(Primitives.echoUInt8(0.toUByte()), 0.toUByte())
        assertEquals(Primitives.echoUInt8(UByte.MIN_VALUE), UByte.MIN_VALUE)
        assertEquals(Primitives.echoUInt8(UByte.MAX_VALUE), UByte.MAX_VALUE)
        assertEquals(Primitives.echoUInt16(0.toUShort()), 0.toUShort())
        assertEquals(Primitives.echoUInt16(UShort.MIN_VALUE), UShort.MIN_VALUE)
        assertEquals(Primitives.echoUInt16(UShort.MAX_VALUE), UShort.MAX_VALUE)
        assertEquals(Primitives.echoUInt32(0.toUInt()), 0.toUInt())
        assertEquals(Primitives.echoUInt32(UInt.MIN_VALUE), UInt.MIN_VALUE)
        assertEquals(Primitives.echoUInt32(UInt.MAX_VALUE), UInt.MAX_VALUE)
        // TODO: UInt64
//        assertEquals(Primitives.echoUInt64(0.toULong()), 0.toULong())
//        assertEquals(Primitives.echoUInt64(ULong.MIN_VALUE), ULong.MIN_VALUE)
//        assertEquals(Primitives.echoUInt64(ULong()), ULong())
        assertEquals(Primitives.echoInt8(0.toByte()), 0.toByte())
        assertEquals(Primitives.echoInt8(Byte.MIN_VALUE), Byte.MIN_VALUE)
        assertEquals(Primitives.echoInt8(Byte.MAX_VALUE), Byte.MAX_VALUE)
        assertEquals(Primitives.echoInt16(0.toShort()), 0.toShort())
        assertEquals(Primitives.echoInt16(Short.MIN_VALUE), Short.MIN_VALUE)
        assertEquals(Primitives.echoInt16(Short.MAX_VALUE), Short.MAX_VALUE)
        assertEquals(Primitives.echoInt32(0.toInt()), 0.toInt())
        assertEquals(Primitives.echoInt32(Int.MIN_VALUE), Int.MIN_VALUE)
        assertEquals(Primitives.echoInt32(Int.MAX_VALUE), Int.MAX_VALUE)
        // TODO: Int64
//        assertEquals(Primitives.echoInt64(null), null)
//        assertEquals(Primitives.echoInt64(0.toLong()), 0.toLong())
//        assertEquals(Primitives.echoInt64(Long.MIN_VALUE), Long.MIN_VALUE)
//        assertEquals(Primitives.echoInt64(Long.MAX_VALUE), Long.MAX_VALUE)
        assertEquals(Primitives.echoFloat(0.0f), 0.0f)
        assertEquals(Primitives.echoFloat(-Float.MAX_VALUE), -Float.MAX_VALUE)
        assertEquals(Primitives.echoFloat(Float.MAX_VALUE), Float.MAX_VALUE)
        assertEquals(Primitives.echoDouble(0.0), 0.0)
        assertEquals(Primitives.echoDouble(-Double.MAX_VALUE), -Double.MAX_VALUE)
        assertEquals(Primitives.echoDouble(Double.MAX_VALUE), Double.MAX_VALUE)
    }

    @Test
    fun testFunctionsTakingReturningOptionalPrimitiveTypes() {
        assertEquals(Primitives.maybeEchoBool(null), null)
        assertEquals(Primitives.maybeEchoBool(false), false)
        assertEquals(Primitives.maybeEchoBool(true), true)
        assertEquals(Primitives.maybeEchoUInt8(null), null)
        assertEquals(Primitives.maybeEchoUInt8(0.toUByte()), 0.toUByte())
        assertEquals(Primitives.maybeEchoUInt8(UByte.MIN_VALUE), UByte.MIN_VALUE)
        assertEquals(Primitives.maybeEchoUInt8(UByte.MAX_VALUE), UByte.MAX_VALUE)
        assertEquals(Primitives.maybeEchoUInt16(null), null)
        assertEquals(Primitives.maybeEchoUInt16(0.toUShort()), 0.toUShort())
        assertEquals(Primitives.maybeEchoUInt16(UShort.MIN_VALUE), UShort.MIN_VALUE)
        assertEquals(Primitives.maybeEchoUInt16(UShort.MAX_VALUE), UShort.MAX_VALUE)
        assertEquals(Primitives.maybeEchoUInt32(null), null)
        assertEquals(Primitives.maybeEchoUInt32(0.toUInt()), 0.toUInt())
        assertEquals(Primitives.maybeEchoUInt32(UInt.MIN_VALUE), UInt.MIN_VALUE)
        assertEquals(Primitives.maybeEchoUInt32(UInt.MAX_VALUE), UInt.MAX_VALUE)
        // TODO: UInt64
//        assertEquals(Primitives.maybeEchoUInt64(null), null)
//        assertEquals(Primitives.maybeEchoUInt64(0.toULong()), 0.toULong())
//        assertEquals(Primitives.maybeEchoUInt64(ULong.MIN_VALUE), ULong.MIN_VALUE)
//        assertEquals(Primitives.maybeEchoUInt64(ULong()), ULong())
        assertEquals(Primitives.maybeEchoInt8(null), null)
        assertEquals(Primitives.maybeEchoInt8(0.toByte()), 0.toByte())
        assertEquals(Primitives.maybeEchoInt8(Byte.MIN_VALUE), Byte.MIN_VALUE)
        assertEquals(Primitives.maybeEchoInt8(Byte.MAX_VALUE), Byte.MAX_VALUE)
        assertEquals(Primitives.maybeEchoInt16(null), null)
        assertEquals(Primitives.maybeEchoInt16(0.toShort()), 0.toShort())
        assertEquals(Primitives.maybeEchoInt16(Short.MIN_VALUE), Short.MIN_VALUE)
        assertEquals(Primitives.maybeEchoInt16(Short.MAX_VALUE), Short.MAX_VALUE)
        assertEquals(Primitives.maybeEchoInt32(null), null)
        assertEquals(Primitives.maybeEchoInt32(0.toInt()), 0.toInt())
        assertEquals(Primitives.maybeEchoInt32(Int.MIN_VALUE), Int.MIN_VALUE)
        assertEquals(Primitives.maybeEchoInt32(Int.MAX_VALUE), Int.MAX_VALUE)
        // TODO: Int64
//        assertEquals(Primitives.maybeEchoInt64(null), null)
//        assertEquals(Primitives.maybeEchoInt64(0.toLong()), 0.toLong())
//        assertEquals(Primitives.maybeEchoInt64(Long.MIN_VALUE), Long.MIN_VALUE)
//        assertEquals(Primitives.maybeEchoInt64(Long.MAX_VALUE), Long.MAX_VALUE)
        assertEquals(Primitives.maybeEchoFloat(null), null)
        assertEquals(Primitives.maybeEchoFloat(0.0f), 0.0f)
        assertEquals(Primitives.maybeEchoFloat(-Float.MAX_VALUE), -Float.MAX_VALUE)
        assertEquals(Primitives.maybeEchoFloat(Float.MAX_VALUE), Float.MAX_VALUE)
        assertEquals(Primitives.maybeEchoDouble(null), null)
        assertEquals(Primitives.maybeEchoDouble(0.0), 0.0)
        assertEquals(Primitives.maybeEchoDouble(-Double.MAX_VALUE), -Double.MAX_VALUE)
        assertEquals(Primitives.maybeEchoDouble(Double.MAX_VALUE), Double.MAX_VALUE)
    }
}
