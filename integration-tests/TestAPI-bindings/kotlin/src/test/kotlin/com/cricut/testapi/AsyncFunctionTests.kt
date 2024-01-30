package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import kotlin.math.abs
import kotlinx.coroutines.*
import kotlinx.coroutines.test.*
import org.junit.jupiter.api.BeforeAll
import kotlin.coroutines.resume
import kotlin.time.Duration.Companion.seconds

internal class AsyncFunctionTests {
    companion object {
        @BeforeAll
        @JvmStatic
        fun beforeAll() {
            println(ProcessHandle.current().pid())
            println()
            // java.lang.Thread.sleep(15000)
        }
    }

    @Test
    fun testConst42() = runTest {
        assertEquals(42, AsyncFunctions.const42())
    }

    @Test
    fun testAbs() = runTest(timeout = 1000000.seconds) {
        val theAbs = AsyncFunctions.abs
        val abs3 = theAbs(-3)
        assertEquals(3, abs3)
    }

    @Test
    fun testIntCompose() = runTest(timeout = 100000.seconds) {
        val intCompose = AsyncFunctions.intCompose
        val composed = intCompose({ it + 1 }, { it * 3 })
        assertEquals(10, composed(3))
        assertEquals(7, composed(2))
    }

    object ComposeError : Error()

    @Test
    fun testExceptionInCompose() = runTest(timeout = 100000.seconds) {
        val composed = AsyncFunctions.intCompose({ throw ComposeError }, { it })
        assertThrows<ComposeError> { composed(3) }
    }

    @Test
    fun testTheRestOfTheFunctions() = runTest {
        assertEquals(8.5, AsyncFunctions.add3Things(3f, 4.5, 1))
        assertEquals(listOf("a", "b", "c", "d"), AsyncFunctions.makeList("a", "b", "c", "d"))
        assertEquals(84, AsyncFunctions.fifthThing("hi", 1, 1.0, "...") { 84 }())
        assertEquals(17, AsyncFunctions.sixthThing("hi", 1, 1.0, "...", { 84 }, 17))
    }

    @Test
    fun testPassingFunctionsToSwift() = runTest(timeout = 100000.seconds) {
        assertEquals("8", AsyncFunctions.exercise0 { 8 })
        assertEquals("3", AsyncFunctions.exercise1 { abs(it) })
        assertEquals("25", AsyncFunctions.exercise2 { f, g -> { f(g(it)) } })
        assertEquals("7.4", AsyncFunctions.exercise3 { a, b, c -> a + b + c })
        assertEquals("""["a", "b", "c", "d"]""", AsyncFunctions.exercise4 { a, b, c, d -> listOf(a, b, c, d) })
        assertEquals("83", AsyncFunctions.exercise5 { _, _, _, _, f -> f })
        assertEquals("42", AsyncFunctions.exercise6 { _, _, _, _, _, i -> i })
    }

    @Test
    fun testSwiftThrows(): Unit = runTest {
        val result = runCatching {
            AsyncFunctions.willThrow()
        }
        assertInstanceOf(Error::class.java, result.exceptionOrNull())
        assertEquals("TheError()", result.exceptionOrNull()?.message)
    }
}
