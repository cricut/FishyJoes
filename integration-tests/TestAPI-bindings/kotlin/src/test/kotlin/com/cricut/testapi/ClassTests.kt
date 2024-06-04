package com.cricut.testapi

import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class ClassTests {
    @Test
    fun testEmptyClass() {
        val a1 = EmptyClass1.create()
        val a2 = EmptyClass1.create()
        assertEquals("Blarg!", a1.blarg)
        assertEquals("<wibble>*Wobble*", a1.wibbledyWobbledyTimeyWhimey)
        assertEquals("Shme! Hand me my hook.", a1.shme())
        assertEquals("Go Gorp!", a1.Gorpers())

        assertEquals(a1, a2)
        assertEquals(a1.hashCode(), a2.hashCode())

        val b1 = EmptyClass2.make()
        assertEquals("Gralb!", b1.blorg)
        assertEquals("<timey>*Whimey*", b1.wibble)
        assertEquals("Shme? What's that ticking sound?", b1.shmee())
        assertEquals("Stop Sreprog!", b1.gorp())

        assertNotEquals(a1, b1)
        assertNotEquals(a1.hashCode(), b1.hashCode())

        assertEquals("EmptyClass1(blarg = Blarg!, wibbledyWobbledyTimeyWhimey = <wibble>*Wobble*)", a1.toString())
        assertEquals("EmptyClass2(blorg = Gralb!, wibble = <timey>*Whimey*)", b1.toString())
    }
}
