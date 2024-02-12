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
        val a = AProtocolImplementation(foo = "Foo", baz = true)
        println("a.foo: ${a.foo}, baz: ${a.baz}")
        val b = a.bar(x = 2, y = 128)
        println("b.foo: ${b.foo}, b.baz: ${b.baz}")
        val c = b.hasADefaultImplementation()
        println("c: $c")
        val d = a.hasADefaultImplementation()
        println("d: $d")
    }
}
