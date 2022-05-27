package com.cricut.testapi

import com.cricut.fishyjoes.runtime.Tuple4
import com.cricut.fishyjoes.runtime.Tuple5
import com.cricut.fishyjoes.runtime.Tuple6
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class TupleTests {
    private val tuple2 = Pair(1L, "two")
    private val tuple3 = Triple("one", 2.1, "three")
    private val tuple4 = Tuple4(tuple2, tuple3, "IV", true)
    private val tuple5 = Tuple5("I", 2.toUByte(), tuple4, tuple3, tuple2)
    private val tuple6 = Tuple6("one", 2L, 3.14, tuple4, tuple5, false)

    @Test
    fun testSwiftTuplesToKotlin() {
        assertEquals(tuple2, Tuples.tuple2)
        assertEquals(tuple3, Tuples.tuple3)
        assertEquals(tuple4, Tuples.tuple4)
        assertEquals(tuple5, Tuples.tuple5)
        assertEquals(tuple6, Tuples.tuple6)
    }

    @Test
    fun testKotlinTuplesToSwift() {
        assertTrue(Tuples.checkTuples(
            tuple2, tuple3, tuple4, tuple5, tuple6
        ))
    }

    @Test
    fun testToString() {
        val str2 = "(1, two)"
        val str3 = "(one, 2.1, three)"
        val str4 = "($str2, $str3, IV, true)"
        val str5 = "(I, 2, $str4, $str3, $str2)"
        val str6 = "(one, 2, 3.14, $str4, $str5, false)"
        assertEquals(str2, tuple2.toString())
        assertEquals(str3, tuple3.toString())
        assertEquals(str4, tuple4.toString())
        assertEquals(str5, tuple5.toString())
        assertEquals(str6, tuple6.toString())
    }
}
