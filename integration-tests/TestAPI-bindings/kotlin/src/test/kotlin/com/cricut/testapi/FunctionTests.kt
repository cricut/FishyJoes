package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import kotlin.math.abs
import kotlinx.coroutines.*

internal class FunctionTests {
    @Test
    fun testConst42() {
        assertEquals(42, Functions.const42())
    }

    @Test
    fun testAbs() {
//        println(ProcessHandle.current().pid())
//        java.lang.Thread.sleep(15000)
        assertEquals(3, Functions.abs(-3))
    }

    @Test
    fun testIntCompose() {
        val composed = Functions.intCompose({ it + 1 }, { it * 3 })
        assertEquals(10, composed(3))
        assertEquals(7, composed(2))
    }

    object ComposeError: Error()

    @Test
    fun testExceptionInCompose() {
        val composed = Functions.intCompose({ throw ComposeError }, { it })
        assertThrows<ComposeError> { composed(3) }
    }

    @Test
    fun testTheRestOfTheFunctions() {
        assertEquals(8.5, Functions.add3Things(3f, 4.5, 1))
        assertEquals(listOf("a", "b", "c", "d"), Functions.makeList("a", "b", "c", "d"))
        assertEquals(84, Functions.fifthThing("hi", 1, 1.0, "...", { 84 })())
        assertEquals(17, Functions.sixthThing("hi", 1, 1.0, "...", { 84 }, 17))
    }

    @Test
    fun testPassingFunctionsToSwift() {
        assertEquals("8", Functions.exercise0 { 8 })
        assertEquals("3", Functions.exercise1 { abs(it) })
        assertEquals("25", Functions.exercise2 { f, g -> { f(g(it)) } })
        assertEquals("7.4", Functions.exercise3 { a, b, c -> a + b + c })
        assertEquals("""["a", "b", "c", "d"]""", Functions.exercise4 { a, b, c, d -> listOf(a, b, c, d) })
        assertEquals("83", Functions.exercise5 { _, _, _, _, f -> f })
        assertEquals("42", Functions.exercise6 { _, _, _, _, _, i -> i })
    }

    @Test
    fun testSwiftThrows() {
        assertThrows(Error::class.java) { Functions.willThrow() }
    }

    @Test
    fun testAsyncFunctionCall() {
        kotlinx.coroutines.runBlocking {
            val value: Long = Functions.async42Func()
            assertEquals(42, value)
        }
    }

//    @Test
//    fun testAsyncYieldingFunctionCall() {
//        kotlinx.coroutines.runBlocking {
//            Functions.asyncYieldFunc()
//        }
//    }
//
//    @Test
//    fun testAsyncSleepFunctionCal() {
//        kotlinx.coroutines.runBlocking {
//            Functions.asyncSleepFunc()
//        }
//    }
//
//    @Test
//    fun testAsyncVoidFunctionCall() {
//        kotlinx.coroutines.runBlocking {
//            Functions.asyncVoidFunc()
//        }
//    }
}
