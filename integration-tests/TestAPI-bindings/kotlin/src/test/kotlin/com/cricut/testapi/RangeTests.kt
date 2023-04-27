package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.sql.Date

internal class RangeTests {
    @Test
    fun testRangeValues() {
        assertEquals(Ranges.int8Range, Byte.MIN_VALUE until Byte.MAX_VALUE)
        assertEquals(Ranges.int16Range, Short.MIN_VALUE until Short.MAX_VALUE)
        assertEquals(Ranges.int32Range, Int.MIN_VALUE until Int.MAX_VALUE)
        assertEquals(Ranges.int64Range, Long.MIN_VALUE until Long.MAX_VALUE)
        assertEquals(Ranges.intRange, Long.MIN_VALUE until Long.MAX_VALUE)
        assertEquals(Ranges.uInt8Range, UByte.MIN_VALUE until UByte.MAX_VALUE)
        assertEquals(Ranges.uInt16Range, UShort.MIN_VALUE until UShort.MAX_VALUE)
        assertEquals(Ranges.uInt32Range, UInt.MIN_VALUE until UInt.MAX_VALUE)
        assertEquals(Ranges.uInt64Range, ULong.MIN_VALUE until ULong.MAX_VALUE)
        assertEquals(Ranges.uIntRange, ULong.MIN_VALUE until ULong.MAX_VALUE)
    }

    @Test
    fun testRangeEcho() {
        assertEquals(Ranges.echoInt8Range(Ranges.int8Range), Ranges.int8Range)
        assertEquals(Ranges.echoInt16Range(Ranges.int16Range), Ranges.int16Range)
        assertEquals(Ranges.echoInt32Range(Ranges.int32Range), Ranges.int32Range)
        assertEquals(Ranges.echoInt64Range(Ranges.int64Range), Ranges.int64Range)
        assertEquals(Ranges.echoIntRange(Ranges.intRange), Ranges.intRange)
        assertEquals(Ranges.echoUInt8Range(Ranges.uInt8Range), Ranges.uInt8Range)
        assertEquals(Ranges.echoUInt16Range(Ranges.uInt16Range), Ranges.uInt16Range)
        assertEquals(Ranges.echoUInt32Range(Ranges.uInt32Range), Ranges.uInt32Range)
        assertEquals(Ranges.echoUInt64Range(Ranges.uInt64Range), Ranges.uInt64Range)
        assertEquals(Ranges.echoUIntRange(Ranges.uIntRange), Ranges.uIntRange)
    }

    @Test
    fun testClosedRangeValues() {
        assertEquals(ClosedRanges.int8Range, Byte.MIN_VALUE..Byte.MAX_VALUE)
        assertEquals(ClosedRanges.int16Range, Short.MIN_VALUE..Short.MAX_VALUE)
        assertEquals(ClosedRanges.int32Range, Int.MIN_VALUE..Int.MAX_VALUE)
        assertEquals(ClosedRanges.int64Range, Long.MIN_VALUE..Long.MAX_VALUE)
        assertEquals(ClosedRanges.intRange, Long.MIN_VALUE..Long.MAX_VALUE)
        assertEquals(ClosedRanges.uInt8Range, UByte.MIN_VALUE..UByte.MAX_VALUE)
        assertEquals(ClosedRanges.uInt16Range, UShort.MIN_VALUE..UShort.MAX_VALUE)
        assertEquals(ClosedRanges.uInt32Range, UInt.MIN_VALUE..UInt.MAX_VALUE)
        assertEquals(ClosedRanges.uInt64Range, ULong.MIN_VALUE..ULong.MAX_VALUE)
        assertEquals(ClosedRanges.uIntRange, ULong.MIN_VALUE..ULong.MAX_VALUE)
        assertEquals(ClosedRanges.floatRange, -Float.MAX_VALUE..Float.MAX_VALUE)
        assertEquals(ClosedRanges.doubleRange, -Double.MAX_VALUE..Double.MAX_VALUE)
        assertEquals(ClosedRanges.stringRange, "A".."Z")
    }

    @Test
    fun testClosedRangeEcho() {
        assertEquals(ClosedRanges.echoInt8Range(ClosedRanges.int8Range), ClosedRanges.int8Range)
        assertEquals(ClosedRanges.echoInt16Range(ClosedRanges.int16Range), ClosedRanges.int16Range)
        assertEquals(ClosedRanges.echoInt32Range(ClosedRanges.int32Range), ClosedRanges.int32Range)
        assertEquals(ClosedRanges.echoInt64Range(ClosedRanges.int64Range), ClosedRanges.int64Range)
        assertEquals(ClosedRanges.echoIntRange(ClosedRanges.intRange), ClosedRanges.intRange)
        assertEquals(ClosedRanges.echoUInt8Range(ClosedRanges.uInt8Range), ClosedRanges.uInt8Range)
        assertEquals(ClosedRanges.echoUInt16Range(ClosedRanges.uInt16Range), ClosedRanges.uInt16Range)
        assertEquals(ClosedRanges.echoUInt32Range(ClosedRanges.uInt32Range), ClosedRanges.uInt32Range)
        assertEquals(ClosedRanges.echoUInt64Range(ClosedRanges.uInt64Range), ClosedRanges.uInt64Range)
        assertEquals(ClosedRanges.echoUIntRange(ClosedRanges.uIntRange), ClosedRanges.uIntRange)
        assertEquals(ClosedRanges.echoFloatRange(ClosedRanges.floatRange), ClosedRanges.floatRange)
        assertEquals(ClosedRanges.echoDoubleRange(ClosedRanges.doubleRange), ClosedRanges.doubleRange)
        assertEquals(ClosedRanges.echoStringRange(ClosedRanges.stringRange), ClosedRanges.stringRange)

        val b = 1.toByte()..2.toByte()
        val s = 1.toShort()..2.toShort()
        val i = 1.toInt()..2.toInt()
        val j = 1.toLong()..2.toLong()
        val ub = 1.toUByte()..2.toUByte()
        val us = 1.toUShort()..2.toUShort()
        val ui = 1.toUInt()..2.toUInt()
        val uj = 1.toULong()..2.toULong()
        val f = 1.0F..2.0F
        val d = 1.0..2.0
        val l = "A".."Z"

        assertEquals(ClosedRanges.echoInt32Range(b), b)
        assertEquals(ClosedRanges.echoInt32Range(s), s)
        assertEquals(ClosedRanges.echoInt32Range(i), i)
        assertEquals(ClosedRanges.echoInt64Range(j), j)
        assertEquals(ClosedRanges.echoUInt32Range(ub), ub)
        assertEquals(ClosedRanges.echoUInt32Range(us), us)
        assertEquals(ClosedRanges.echoUInt32Range(ui), ui)
        assertEquals(ClosedRanges.echoUInt64Range(uj), uj)
        assertEquals(ClosedRanges.echoFloatRange(f), f)
        assertEquals(ClosedRanges.echoDoubleRange(d), d)
        assertEquals(ClosedRanges.echoStringRange(l), l)

        // TODO: Empty ranges?
//        val empty = 0..-1
//        assert(empty.isEmpty())
//        assert(ClosedRanges.echoInt32Range(empty).isEmpty())
    }
}
