package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import kotlin.math.abs
import kotlinx.coroutines.*
import java.lang.Exception

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
        runBlocking {
            val value: Long = Functions.async42Func()
            assertEquals(42, value)
        }
    }

    @Test
    fun testAsyncYieldingFunctionCall() {
        runBlocking {
            Functions.asyncYieldFunc()
        }
    }

    @Test
    fun testAsyncSleepFunctionCal() {
        runBlocking {
            Functions.asyncSleepFunc()
        }
    }

    @Test
    fun testAsyncVoidFunctionCall() {
        runBlocking {
            Functions.asyncVoidFunc()
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall0() {
        runBlocking {
            var threw = false
            var value: Long = 42
            var ran = false
            try {
                value = Functions.asyncCallbackFunc0 {
                    ran = true
                    42
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(42, value)
            assertEquals(true, ran)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall1() {
        runBlocking {
            var threw = false
            var value: ULong = 0UL
            val values: MutableList<ULong> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc1 { a ->
                    values.add(a)
                    a
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1UL, value)
            assertEquals(arrayListOf(1UL), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall2() {
        runBlocking {
            var threw = false
            var value: Long = 0
            val values: MutableList<Long> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc2 { a, b ->
                    values.add(a)
                    values.add(b)
                    a+ b
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1 + 2, value)
            assertEquals(arrayListOf(1.toLong(), 2), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall3() {
        runBlocking {
            var threw = false
            var value: Long = 0
            val values: MutableList<Long> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc3 { a, b, c ->
                    values.add(a)
                    values.add(b)
                    values.add(c)
                    a+ b + c
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1 + 2 + 3, value)
            assertEquals(arrayListOf(1.toLong(), 2, 3), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall4() {
        runBlocking {
            var threw = false
            var value: Long = 0
            val values: MutableList<Long> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc4 { a, b, c, d ->
                    values.add(a)
                    values.add(b)
                    values.add(c)
                    values.add(d)
                    a+ b + c + d
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1 + 2 + 3 + 4, value)
            assertEquals(arrayListOf(1.toLong(), 2, 3, 4), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall5() {
        runBlocking {
            var threw = false
            var value: Long = 0
            val values: MutableList<Long> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc5 { a, b, c, d, e ->
                    values.add(a)
                    values.add(b)
                    values.add(c)
                    values.add(d)
                    values.add(e)
                    a+ b + c + d + e
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1 + 2 + 3 + 4 + 5, value)
            assertEquals(arrayListOf(1.toLong(), 2, 3, 4, 5), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCall6() {
        runBlocking {
            var threw = false
            var value: Long = 0
            val values: MutableList<Long> = ArrayList()
            try {
                value = Functions.asyncCallbackFunc6 { a, b, c, d, e, f ->
                    values.add(a)
                    values.add(b)
                    values.add(c)
                    values.add(d)
                    values.add(e)
                    values.add(f)
                    a+ b + c + d + e + f
                }
            } catch (e: Exception) {
                threw = true
            }
            assertEquals(false, threw)
            assertEquals(1 + 2 + 3 + 4 + 5 + 6, value)
            assertEquals(arrayListOf(1.toLong(), 2, 3, 4, 5, 6), values)
        }
    }

    @Test
    fun testAsyncCallbackFunctionCallThrow() {
        assertThrows(Error::class.java) {
            runBlocking {
                Functions.asyncCallbackFunc0 { throw java.lang.Error() }
            }
        }
    }

    @Test
    fun testAsyncDoubleFunctionCall() {
        runBlocking {
            val value = Functions.asyncDoubleFunc(1.0)
            assertEquals(2.0, value)
        }
    }

    @Test
    fun testAsyncMultipleArgsFunctionCall() {
        runBlocking {
            assertEquals(3, Functions.asyncMultipleArgs(1){ 2 })
        }
    }

    @Test
    fun testAsyncThrowingFunctionCall() {
        assertThrows(Error::class.java) {
            runBlocking {
                Functions.asyncThrowingFunc()
            }
        }
    }
}
