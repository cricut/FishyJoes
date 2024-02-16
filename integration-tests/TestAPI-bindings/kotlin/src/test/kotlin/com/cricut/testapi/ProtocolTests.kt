package com.cricut.testapi

import kotlinx.coroutines.*
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import java.lang.Exception
import kotlin.test.*

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
    fun testAProtocol() {
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

        assertEquals("4123431 notBazzed", b.hasADefaultImplementation(x = 1238746, y = 918223.898349))
        assertEquals("bazzy 2", b.hasADefaultImplementation(x = 2, y = 0.128768794))

        assertEquals(3.7838466771424932E9, a.hasADefaultImplementation2(a = "923.2185", b = true, c = 0.0898714))
        assertEquals(1.9556754407899822E-5, a.hasADefaultImplementation2(a = "923.2185", b = false, c = 0.0898714))

        assertEquals(0.9589049888649063, b.hasADefaultImplementation2(a = "0.9870923", b = true, c = 1.123123))
        assertEquals(1.686253813623996, b.hasADefaultImplementation2(a = "0.9870923", b = false, c = 1.123123))
    }

    @Test
    fun testProtocolEnum() {
        val a = TestProtocolEnum.Qux
        a.foo()
        assertEquals(true, a.bar())
        a.baz(true)
        assertEquals("garply Navigate a nostril! garpity garp", a.garply("Navigate a nostril!"))
        assertEquals("thud: 42; grault: [1.234, 45.234890198, 892.8]", a.xyzzy(42, arrayListOf(1.234, 45.234890198, 892.80)))
        assertEquals(
            kotlin.Triple<Boolean, Long, kotlin.String>(
                false,
                3,
                "Take a left at your intestines -<*>- Take the second right past Mars"
            ),
            a.plugh(
                kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>(
                    true,
                    3.14159265359,
                    arrayListOf("Take a left at your intestines", "Take the second right past Mars")
                )
            )
        )
    }

    @Test
    fun testProtocolStruct() {
        val a = TestProtocolStruct(corge = "Raft a river of lava-ah!")
        assertEquals("Raft a river of lava-ah!", a.corge)
        a.corge = "Spank a plankton too! (take that)"
        assertEquals("Spank a plankton too! (take that)", a.corge)
        assertEquals(arrayListOf(3.14159265359, 42.0, -1.23456789), a.frob)
        assertEquals(
            kotlin.Triple<Boolean, Long, kotlin.String>(
                true,
                51,
                "Ride on the magic school bus *>-<* You might get baked into a pie"
            ),
            a.plugh(
                kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>(
                    true,
                    42.9,
                    arrayListOf("Ride on the magic school bus", "You might get baked into a pie")
                )
            )
        )
        a.foo()
        assertEquals(false, a.bar())
        a.baz(qux = true)
        assertEquals("garp garpity An octopus in your neighborhood? garpee", a.garply("An octopus in your neighborhood?"))
        assertEquals("thud: 42 | grault: [1.234, 45.234890198, 892.8]", a.xyzzy(42, arrayListOf(1.234, 45.234890198, 892.80)))
    }

    @Test
    fun testProtocolClass() {
        val a = TestProtocolClass.init(corge = "Step inside it's a wilder ride!")
        assertEquals("Step inside it's a wilder ride!", a.corge)
        assertEquals(arrayListOf(42.0, -1.23456789, 3.14159265359), a.frob)
        assertEquals(null, a.flarp)
        a.flarp = "Excellent observation Kiki!"
        assertEquals("Excellent observation Kiki!", a.flarp)
        assertEquals(42.909, a.wombat(null))
        assertEquals(null, a.wombat(zxc = 57))
        assertEquals(7890.2, a.wombat(56))
    }
}
