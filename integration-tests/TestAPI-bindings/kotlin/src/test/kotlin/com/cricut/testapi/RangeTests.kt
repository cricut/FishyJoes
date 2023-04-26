package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.sql.Date

internal class RangeTests {
    @Test
    fun testRangeValues() {
        val z = false..true
        val b = 1.toByte()..2.toByte()
        val s = 1.toShort()..2.toShort()
        val i = 1.toInt()..2.toInt()
        val j = 1.toLong()..2.toLong()
        val ub = 1.toUByte()..2.toUByte()
        val us = 1.toUShort()..2.toUShort()
        val ui = 1.toUInt()..2.toUInt()
        val uj = 1.toULong()..2.toULong()
        val c = 1.toChar()..2.toChar()
        val d = 1.0..2.0
        val f = 1.0F..2.0F
        val l = Date.valueOf("2000-1-1")..Date.valueOf("2000-1-1")
        assertEquals(Ranges.closedIntRange, -10L..20L)
    }

    @Test
    fun testRangeEcho() {
//        assertEquals(Ranges.echo(ConcreteClosedRange(-10.0, 20.0)), ConcreteClosedRange(-10.0, 20.0))
    }
}
