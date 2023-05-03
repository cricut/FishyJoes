package com.cricut.testapi

import com.cricut.fishyjoes.runtime.ClosedRange
import com.cricut.fishyjoes.runtime.OpenRange
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class RangeTests {
    @Test
    fun testRangeValues() {
        assertEquals(Ranges.uInt8Range, OpenRange(UByte.MIN_VALUE, UByte.MAX_VALUE))
        assertEquals(Ranges.uInt16Range, OpenRange(UShort.MIN_VALUE, UShort.MAX_VALUE))
        assertEquals(Ranges.uInt32Range, OpenRange(UInt.MIN_VALUE, UInt.MAX_VALUE))
        assertEquals(Ranges.uInt64Range, OpenRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(Ranges.uIntRange, OpenRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(Ranges.int8Range, OpenRange(Byte.MIN_VALUE, Byte.MAX_VALUE))
        assertEquals(Ranges.int16Range, OpenRange(Short.MIN_VALUE, Short.MAX_VALUE))
        assertEquals(Ranges.int32Range, OpenRange(Int.MIN_VALUE, Int.MAX_VALUE))
        assertEquals(Ranges.int64Range, OpenRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(Ranges.intRange, OpenRange(Long.MIN_VALUE, Long.MAX_VALUE))
    }

    @Test
    fun testRangeEcho() {
        assertEquals(Ranges.echoUInt8Range(Ranges.uInt8Range), Ranges.uInt8Range)
        assertEquals(Ranges.echoUInt16Range(Ranges.uInt16Range), Ranges.uInt16Range)
        assertEquals(Ranges.echoUInt32Range(Ranges.uInt32Range), Ranges.uInt32Range)
        assertEquals(Ranges.echoUInt64Range(Ranges.uInt64Range), Ranges.uInt64Range)
        assertEquals(Ranges.echoUIntRange(Ranges.uIntRange), Ranges.uIntRange)
        assertEquals(Ranges.echoInt8Range(Ranges.int8Range), Ranges.int8Range)
        assertEquals(Ranges.echoInt16Range(Ranges.int16Range), Ranges.int16Range)
        assertEquals(Ranges.echoInt32Range(Ranges.int32Range), Ranges.int32Range)
        assertEquals(Ranges.echoInt64Range(Ranges.int64Range), Ranges.int64Range)
        assertEquals(Ranges.echoIntRange(Ranges.intRange), Ranges.intRange)
    }

    @Test
    fun testClosedRangeValues() {
        assertEquals(ClosedRanges.uInt8Range, ClosedRange(UByte.MIN_VALUE, UByte.MAX_VALUE))
        assertEquals(ClosedRanges.uInt16Range, ClosedRange(UShort.MIN_VALUE, UShort.MAX_VALUE))
        assertEquals(ClosedRanges.uInt32Range, ClosedRange(UInt.MIN_VALUE, UInt.MAX_VALUE))
        assertEquals(ClosedRanges.uInt64Range, ClosedRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(ClosedRanges.uIntRange, ClosedRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(ClosedRanges.int8Range, ClosedRange(Byte.MIN_VALUE, Byte.MAX_VALUE))
        assertEquals(ClosedRanges.int16Range, ClosedRange(Short.MIN_VALUE, Short.MAX_VALUE))
        assertEquals(ClosedRanges.int32Range, ClosedRange(Int.MIN_VALUE, Int.MAX_VALUE))
        assertEquals(ClosedRanges.int64Range, ClosedRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(ClosedRanges.intRange, ClosedRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(ClosedRanges.floatRange, ClosedRange(-Float.MAX_VALUE, Float.MAX_VALUE))
        assertEquals(ClosedRanges.doubleRange, ClosedRange(-Double.MAX_VALUE, Double.MAX_VALUE))
        assertEquals(ClosedRanges.stringRange, ClosedRange("A", "Z"))
    }

    @Test
    fun testClosedRangeEcho() {
        assertEquals(ClosedRanges.echoUInt8Range(ClosedRanges.uInt8Range), ClosedRanges.uInt8Range)
        assertEquals(ClosedRanges.echoUInt16Range(ClosedRanges.uInt16Range), ClosedRanges.uInt16Range)
        assertEquals(ClosedRanges.echoUInt32Range(ClosedRanges.uInt32Range), ClosedRanges.uInt32Range)
        assertEquals(ClosedRanges.echoUInt64Range(ClosedRanges.uInt64Range), ClosedRanges.uInt64Range)
        assertEquals(ClosedRanges.echoUIntRange(ClosedRanges.uIntRange), ClosedRanges.uIntRange)
        assertEquals(ClosedRanges.echoInt8Range(ClosedRanges.int8Range), ClosedRanges.int8Range)
        assertEquals(ClosedRanges.echoInt16Range(ClosedRanges.int16Range), ClosedRanges.int16Range)
        assertEquals(ClosedRanges.echoInt32Range(ClosedRanges.int32Range), ClosedRanges.int32Range)
        assertEquals(ClosedRanges.echoInt64Range(ClosedRanges.int64Range), ClosedRanges.int64Range)
        assertEquals(ClosedRanges.echoIntRange(ClosedRanges.intRange), ClosedRanges.intRange)
        assertEquals(ClosedRanges.echoFloatRange(ClosedRanges.floatRange), ClosedRanges.floatRange)
        assertEquals(ClosedRanges.echoDoubleRange(ClosedRanges.doubleRange), ClosedRanges.doubleRange)
        assertEquals(ClosedRanges.echoStringRange(ClosedRanges.stringRange), ClosedRanges.stringRange)
    }

    @Test
    fun testClosedRangeConversion() {
        val ub = 1.toUByte()..2.toUByte()
        val us = 1.toUShort()..2.toUShort()
        val ui = 1.toUInt()..2.toUInt()
        val uj = 1.toULong()..2.toULong()
        val b = 1.toByte()..2.toByte()
        val s = 1.toShort()..2.toShort()
        val i = 1.toInt()..2.toInt()
        val j = 1.toLong()..2.toLong()
        val f = 1.0F..2.0F
        val d = 1.0..2.0
        val l = "A".."Z"

        assertEquals(ClosedRanges.echoUInt32Range(ClosedRange(ub)), ClosedRange(ub))
        assertEquals(ClosedRanges.echoUInt32Range(ClosedRange(us)), ClosedRange(us))
        assertEquals(ClosedRanges.echoUInt32Range(ClosedRange(ui)), ClosedRange(ui))
        assertEquals(ClosedRanges.echoUIntRange(ClosedRange(uj)), ClosedRange(uj))
        assertEquals(ClosedRanges.echoInt32Range(ClosedRange(b)), ClosedRange(b))
        assertEquals(ClosedRanges.echoInt32Range(ClosedRange(s)), ClosedRange(s))
        assertEquals(ClosedRanges.echoInt32Range(ClosedRange(i)), ClosedRange(i))
        assertEquals(ClosedRanges.echoIntRange(ClosedRange(j)), ClosedRange(j))
        assertEquals(ClosedRanges.echoFloatRange(ClosedRange(f)), ClosedRange(f))
        assertEquals(ClosedRanges.echoDoubleRange(ClosedRange(d)), ClosedRange(d))
        assertEquals(ClosedRanges.echoStringRange(ClosedRange(l)), ClosedRange(l))
    }
}
