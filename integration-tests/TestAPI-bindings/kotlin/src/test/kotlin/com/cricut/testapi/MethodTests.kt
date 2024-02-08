package com.cricut.testapi

import kotlinx.coroutines.*
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import java.lang.Exception

@kotlinx.coroutines.ExperimentalCoroutinesApi
internal class MethodTests {
    @Test
    fun testStaticMethods() {
        assertEquals(123, Methods.staticGet)
        assertEquals(234, Methods.staticGetMethod())

        assertEquals(345, Methods.staticModifiable)
        Methods.staticModifiable = 987
        assertEquals(987, Methods.staticModifiable)

        assertEquals(567, Methods.staticStored)
        Methods.staticStored = 765
        assertEquals(765, Methods.staticStored)
    }

    @Test
    fun testInstanceMethods() {
        val instance = Methods.create()

        assertEquals(1234, instance.instanceGet)
        assertEquals(2345, instance.instanceGetMethod())

        assertEquals(3456, instance.instanceModifiable)
        instance.instanceModifiable = 9876
        assertEquals(9876, instance.instanceModifiable)

        assertEquals(5678, instance.instanceStored)
        instance.instanceStored = 7654
        assertEquals(7654, instance.instanceStored)
    }

    @Nested
    inner class AsyncInstanceTests {
        @Test
        fun testAsyncInstanceMethods() {
            runBlocking {
                val value: Long = Methods.create().async42()
                assertEquals(42, value)
            }
        }

        @Test
        fun testAsyncYieldingFunctionCall() {
            runBlocking {
                Methods.create().asyncYield()
            }
        }

        @Test
        fun testAsyncSleepFunctionCal() {
            runBlocking {
                Methods.create().asyncSleep()
            }
        }

        @Test
        fun testAsyncVoidFunctionCall() {
            runBlocking {
                Methods.create().asyncVoid()
            }
        }

        @Test
        fun testAsyncCallbackFunctionCall0() {
            runBlocking {
                var threw = false
                var value: Long = 42
                var ran = false
                try {
                    value = Methods.create().asyncCallbackFunc0 {
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
        fun testAsyncCallbackFunctionCallThrow() {
            assertThrows(Error::class.java) {
                runBlocking {
                    Methods.create().asyncCallbackFunc0 { throw java.lang.Error() }
                }
            }
        }

        @Test
        fun testAsyncDoubleFunctionCall() {
            runBlocking {
                val value = Methods.create().asyncDouble(1.0)
                assertEquals(2.0, value)
            }
        }

        @Test
        fun testAsyncMultipleArgsFunctionCall() {
            runBlocking {
                assertEquals(3, Methods.create().asyncMultipleArgs(1) { 2 })
            }
        }

        @Test
        fun testAsyncThrowingFunctionCall() {
            assertThrows(Error::class.java) {
                runBlocking {
                    Methods.create().asyncThrowing()
                }
            }
        }
    }

    @Nested
    inner class AsyncStaticTests {
        @Test
        fun testAsyncInstanceMethods() {
            runBlocking {
                val value: Long = Methods.staticAsync42()
                assertEquals(42, value)
            }
        }

        @Test
        fun testAsyncYieldingFunctionCall() {
            runBlocking {
                Methods.staticAsyncYield()
            }
        }

        @Test
        fun testAsyncSleepFunctionCal() {
            runBlocking {
                Methods.staticAsyncSleep()
            }
        }

        @Test
        fun testAsyncVoidFunctionCall() {
            runBlocking {
                Methods.staticAsyncVoid()
            }
        }

        @Test
        fun testAsyncCallbackFunctionCall0() {
            runBlocking {
                var threw = false
                var value: Long = 42
                var ran = false
                try {
                    value = Methods.staticAsyncCallbackFunc0 {
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
        fun testAsyncCallbackFunctionCallThrow() {
            assertThrows(Error::class.java) {
                runBlocking {
                    Methods.staticAsyncCallbackFunc0 { throw java.lang.Error() }
                }
            }
        }

        @Test
        fun testAsyncDoubleFunctionCall() {
            runBlocking {
                val value = Methods.staticAsyncDouble(1.0)
                assertEquals(2.0, value)
            }
        }

        @Test
        fun testAsyncMultipleArgsFunctionCall() {
            runBlocking {
                assertEquals(3, Methods.staticAsyncMultipleArgs(1) { 2 })
            }
        }

        @Test
        fun testAsyncThrowingFunctionCall() {
            assertThrows(Error::class.java) {
                runBlocking {
                    Methods.staticAsyncThrowing()
                }
            }
        }
    }
}
