package com.cricut.testapi

import kotlinx.coroutines.*
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import java.lang.Exception

@kotlinx.coroutines.ExperimentalCoroutinesApi
internal class ProtocolTests {
    companion object {
        @BeforeAll
        @JvmStatic
        // To get procId for attaching lldb debugger to
        fun beforeAll() {
            val procId = ProcessHandle.current().pid()
            println("procId: $procId")
            println()
        }
    }
    @Test
    fun testProtocols() {
        val a = AProtocolImplementation(foo = "Garply", baz = false)
        assertEquals("Garply", a.foo)
        assertEquals(false, a.baz)
        val b = a.bar(x = 2, y = 128)

        assertEquals("130", b.foo)
        assertEquals(true, b.baz)
        b.foo = "Wibble"
        assertEquals("Wibble", b.foo)

        assertEquals("-312 notBazzed", a.hasADefaultImplementation(x = 9, y = -102.1))
        assertEquals("bazzy 3", a.hasADefaultImplementation(x = 2, y = 0.345))
    }
}
