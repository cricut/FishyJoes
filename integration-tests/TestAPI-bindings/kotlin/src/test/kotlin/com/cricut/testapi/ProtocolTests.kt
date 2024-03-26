package com.cricut.testapi

import kotlinx.coroutines.*
import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.DisplayNameGenerator.Simple
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test
import java.lang.Exception
import kotlin.math.abs
import kotlin.math.pow
import kotlin.time.Duration.Companion.seconds

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
        assertEquals(42.909, a.wombat(null))
        assertEquals(null, a.wombat(zxc = 57))
        assertEquals(7890.2, a.wombat(56))

        assertEquals(23947889, a.spqr(AssociatedDataEnum.Thing(23947889)))
        assertEquals(89708973, a.spqr(AssociatedDataEnum.Other("zxc", 89708973)))
        assertEquals(45, a.spqr(AssociatedDataEnum.Bar("shme", AssociatedDataEnum.NoValue)))
        assertEquals(42, a.spqr(AssociatedDataEnum.NoValue))
        assertEquals(1, a.spqr(AssociatedDataEnum.SimpleEnum(SimpleEnum.Blue)))

        a.foo()
        assertEquals(true, a.bar())
        a.baz(false)
        assertEquals("garplify Surfin' on a sine wave parguino", a.garply("Surfin' on a sine wave"))
        assertEquals("thud: 42 \\|/ grault: [1.234, 45.234890198, 892.8]", a.xyzzy(42, arrayListOf(1.234, 45.234890198, 892.80)))
        assertEquals(
            kotlin.Triple<Boolean, Long, kotlin.String>(
                true,
                83,
                "Please let this be a normal field trip _-^= I knew I should've stayed home today"
            ),
            a.plugh(
                kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>(
                    true,
                    92.47,
                    arrayListOf("Please let this be a normal field trip", "I knew I should've stayed home today")
                )
            )
        )

        val b = TestProtocolClass.init(corge = "Step inside it's a wilder ride!", flarp = "Excellent observation Kiki!")
        assertEquals("Excellent observation Kiki!", b.flarp)
    }

    @Test
    fun testProtocolKotlinImpl() {
        val a = ProtocolKotlinImpl(foo = "oof!", baz = false)
        assertEquals("oof!", a.foo)
        a.foo = "ofo!"
        assertEquals("ofo!", a.foo)
        assertEquals(false, a.baz)
        val b = a.hasADefaultImplementation(x = 2389, y = 17.23)
        assertEquals("bazzy 52558 / 27 = 1946", b)
        val c = a.hasADefaultImplementation2(a = "With the Frizz? No way!", b = false, c = 8923.8293)
        assertEquals(-3.14159265359, c)
    }

    @Test
    fun testAsyncForeignSideFunctions() = runTest(timeout = 1000000.seconds) {
        val a = TestAsyncForeignSideFunctionsStruct(
            const42 = { 49 },
            iabs = { x: Long ->
                abs(x)
            },
            intCompose = { f: suspend (Long) -> Long, g: suspend (Long) -> Long ->
                { x: Long ->
                    f(g(x))
                }
            },
            add3Things = { x: Float, y: Double, z: Long ->
                x.toDouble() + y + z.toDouble()
            },
            makeList = { a: String, b: String, c: String, d: String ->
                listOf(a, b, c, d)
            },
            fifthThing = { a: String, b: Long, c: Double, d: String, e: suspend () -> Long ->
                e
            },
            six = { a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long ->
                f
            }
        )
        assertEquals(49, a.const42())
        assertEquals(4, a.iabs(-4))
        val b = a.intCompose({x: Long -> x * 3}, {y: Long -> y * 5})
        assertEquals(b(92), 1380)
        val c = a.add3Things(3.14F, 3.14159, 128)
        assertEquals(c, 134.28159010490418)
        val d = a.makeList("By", "your", "powers", "combined")
        assertEquals(d, listOf("By", "your", "powers", "combined"))
        val e = a.fifthThing("I, am", Long.MAX_VALUE, Double.MIN_VALUE, "Captain Planet!") { 42 }
        assertEquals(e(), 42)
        val f = a.six("Big, bad", 24, 3.14159265359, "Beetleborgs", { 43 }, Long.MIN_VALUE)
        assertEquals(f, Long.MIN_VALUE)
    }

    @Test
    fun testAsyncSwiftSideFunctions() = runTest(timeout = 1000000.seconds) {
        val a = TestAsyncSwiftSideFunctionsClass.init()
        assertEquals(a.const42(), 42)
        assertEquals(a.iabs(-2398),2398)
        val b = a.intCompose({x: Long -> x * 3}, {y: Long -> y * 5})
        assertEquals(b(92), 1380)
        val d = a.makeList("By", "your", "powers", "combined")
        assertEquals(d, listOf("By", "your", "powers", "combined"))
        val e = a.fifthThing("I, am", Long.MAX_VALUE, Double.MIN_VALUE, "Captain Planet!") { 42 }
        assertEquals(e(), 42)
        val f = a.six("Big, bad", 24, 3.14159265359, "Beetleborgs", { 43 }, Long.MIN_VALUE)
        assertEquals(f, Long.MIN_VALUE)
    }

    data class ProtocolKotlinImpl(
        override var foo: kotlin.String,
        override val baz: Boolean
    ): AProtocol {
        override fun bar(x: Long, y: Long): AProtocol {
            val div = x / y
            val a = ProtocolKotlinImpl(foo = "$x / $y = $div", baz = x != y)
            return a
        }

        override fun hasADefaultImplementation(x: Long, y: Double): String {
            val x_prime = x * 22
            val y_prime = y / 2.0382
            return super.hasADefaultImplementation(x_prime, y_prime)
        }

        override fun hasADefaultImplementation2(a: String, b: Boolean, c: Double): Double {
            val a_prime = "wibbledy wobbledy $a woo"
            val b_prime = !b
            val c_prime = c * 7.23890
            return super.hasADefaultImplementation2(a_prime, b_prime, c_prime)
        }
    }
}
