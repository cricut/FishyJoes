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
        fun beforeAll() {
            val procId = ProcessHandle.current().pid()
            println("procId: $procId")
            println()
        }
    }
    @Test
    fun testProtocols() {
        val a = AProtocolImplementation(foo = "Garply", baz = false)        
        println("a.foo: ${a.foo}, baz: ${a.baz}")
        val b = a.bar(x = 2, y = 128)
        b.foo = "Wibble"
        println("b.foo: ${b.foo}, b.baz: ${b.baz}")
        val c = a.hasADefaultImplementation(x = 9, y = 10)
        println("c: $c")
        var d = b.hasADefaultImplementation(x = 2, y = 12)
        println("d: $d")
    }
}
