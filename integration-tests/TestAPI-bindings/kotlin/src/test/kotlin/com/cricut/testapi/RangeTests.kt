package com.cricut.testapi

import com.cricut.fishyjoes.runtime.SwiftClosedRange
import com.cricut.fishyjoes.runtime.SwiftRange
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class RangeTests {
    @Test
    fun testRangeValues() {
        assertEquals(Ranges.uInt8Range, SwiftRange(UByte.MIN_VALUE, UByte.MAX_VALUE))
        assertEquals(Ranges.uInt16Range, SwiftRange(UShort.MIN_VALUE, UShort.MAX_VALUE))
        assertEquals(Ranges.uInt32Range, SwiftRange(UInt.MIN_VALUE, UInt.MAX_VALUE))
        assertEquals(Ranges.uInt64Range, SwiftRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(Ranges.uIntRange, SwiftRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(Ranges.int8Range, SwiftRange(Byte.MIN_VALUE, Byte.MAX_VALUE))
        assertEquals(Ranges.int16Range, SwiftRange(Short.MIN_VALUE, Short.MAX_VALUE))
        assertEquals(Ranges.int32Range, SwiftRange(Int.MIN_VALUE, Int.MAX_VALUE))
        assertEquals(Ranges.int64Range, SwiftRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(Ranges.intRange, SwiftRange(Long.MIN_VALUE, Long.MAX_VALUE))
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
        assertEquals(ClosedRanges.uInt8Range, SwiftClosedRange(UByte.MIN_VALUE, UByte.MAX_VALUE))
        assertEquals(ClosedRanges.uInt16Range, SwiftClosedRange(UShort.MIN_VALUE, UShort.MAX_VALUE))
        assertEquals(ClosedRanges.uInt32Range, SwiftClosedRange(UInt.MIN_VALUE, UInt.MAX_VALUE))
        assertEquals(ClosedRanges.uInt64Range, SwiftClosedRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(ClosedRanges.uIntRange, SwiftClosedRange(ULong.MIN_VALUE, ULong.MAX_VALUE))
        assertEquals(ClosedRanges.int8Range, SwiftClosedRange(Byte.MIN_VALUE, Byte.MAX_VALUE))
        assertEquals(ClosedRanges.int16Range, SwiftClosedRange(Short.MIN_VALUE, Short.MAX_VALUE))
        assertEquals(ClosedRanges.int32Range, SwiftClosedRange(Int.MIN_VALUE, Int.MAX_VALUE))
        assertEquals(ClosedRanges.int64Range, SwiftClosedRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(ClosedRanges.intRange, SwiftClosedRange(Long.MIN_VALUE, Long.MAX_VALUE))
        assertEquals(ClosedRanges.floatRange, SwiftClosedRange(-Float.MAX_VALUE, Float.MAX_VALUE))
        assertEquals(ClosedRanges.doubleRange, SwiftClosedRange(-Double.MAX_VALUE, Double.MAX_VALUE))
        assertEquals(ClosedRanges.stringRange, SwiftClosedRange("A", "Z"))
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

        assertEquals(ClosedRanges.echoUInt32Range(SwiftClosedRange(ub)), SwiftClosedRange(ub))
        assertEquals(ClosedRanges.echoUInt32Range(SwiftClosedRange(us)), SwiftClosedRange(us))
        assertEquals(ClosedRanges.echoUInt32Range(SwiftClosedRange(ui)), SwiftClosedRange(ui))
        assertEquals(ClosedRanges.echoUIntRange(SwiftClosedRange(uj)), SwiftClosedRange(uj))
        assertEquals(ClosedRanges.echoInt32Range(SwiftClosedRange(b)), SwiftClosedRange(b))
        assertEquals(ClosedRanges.echoInt32Range(SwiftClosedRange(s)), SwiftClosedRange(s))
        assertEquals(ClosedRanges.echoInt32Range(SwiftClosedRange(i)), SwiftClosedRange(i))
        assertEquals(ClosedRanges.echoIntRange(SwiftClosedRange(j)), SwiftClosedRange(j))
        assertEquals(ClosedRanges.echoFloatRange(SwiftClosedRange(f)), SwiftClosedRange(f))
        assertEquals(ClosedRanges.echoDoubleRange(SwiftClosedRange(d)), SwiftClosedRange(d))
        assertEquals(ClosedRanges.echoStringRange(SwiftClosedRange(l)), SwiftClosedRange(l))
    }
}
