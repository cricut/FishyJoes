package com.cricut.testapi

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test
import kotlin.math.abs
import kotlin.time.Duration.Companion.seconds

@kotlinx.coroutines.ExperimentalCoroutinesApi
internal class ProtocolTests {
    companion object {
        const val DEBUG_PRINTS = false
        @BeforeAll
        @JvmStatic
        // To get procId for attaching lldb debugger to
        fun beforeAll() {
            val procId = ProcessHandle.current().pid()
            if (DEBUG_PRINTS) {
                println("procId: $procId")
            }
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

        assertEquals("3783846677.1424932", a.hasADefaultImplementation2(a = "923.2185", b = true, c = "0.0898714"))
        assertEquals("1.9556754407899822e-05", a.hasADefaultImplementation2(a = "923.2185", b = false, c = "0.0898714"))

        assertEquals("0.9589049888649063", b.hasADefaultImplementation2(a = "0.9870923", b = true, c = "1.123123"))
        assertEquals("1.686253813623996", b.hasADefaultImplementation2(a = "0.9870923", b = false, c = "1.123123"))
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
        val expectedA = listOf(3L, 42L, -1L);
        a.frobby.forEachIndexed { i, v ->
            assertEquals(expectedA[i], v)
        }
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
        val expectedA = listOf(42L, -1L, 3L);
        a.frobby.forEachIndexed { i, v ->
            assertEquals(expectedA[i], v)
        }
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
        val c = a.hasADefaultImplementation2(a = "With the Frizz? No way!", b = false, c = "8923.8293")
        assertEquals("-3.14159265359", c)
    }

    fun testAsyncForeignSideFunctionsCore(a: TestAsyncFunctions) =  runTest(timeout = 1000000.seconds) {
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

        val result = runCatching {
            a.willThrow()
        }
        assertInstanceOf(Error::class.java, result.exceptionOrNull())
        assertEquals("Spoon!", result.exceptionOrNull()?.message)

        val g = a.exercise0(e)
        assertEquals("84", g)
        val h = a.exercise1(b)
        assertEquals("-105", h)
        val i = a.exercise2 { a: suspend (Long) -> Long, b: suspend (Long) ->
            Long -> { z: Long ->
                a(3) + b(3) + z
            }
        }
        assertEquals("36", i)
        val j = a.exercise3 { fl: Float, d: Double, l: Long -> (fl / d) + 9 * l }
        assertEquals("18.227272727272727", j)
        val k = a.exercise4 { a: String, b: String, c: String, d: String -> listOf(d, c, b, a) }
        assertEquals("[jam, the, up, Pump]", k)
        val l = a.exercise5(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long -> { (a.toDouble() + b.toDouble() + c + d.toDouble() + e()).toLong() } } )
        assertEquals("754", l)
        val m = a.exercise6(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long -> (a.toDouble() + b.toDouble() + c + d.toDouble() + e() + f).toLong() } )
        assertEquals("852", m)
        var o = 1
        val n = a.thunkTwiceMaker {
            o += 1
            if (DEBUG_PRINTS) {
                println("Thunker in paradise")
            }
        }
        n()
        assertEquals(3, o)
        val p = a.defaultExercise6(fn =
        {
                a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long ->
            (a.toDouble() + b.toDouble() + c + d.toDouble() + e() + f).toLong()
        }
        )
        assertEquals("962", p)
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
            },
            willThrow = {
                throw(Error("Spoon!"))
            },
            exercise0Fun = {fn: suspend () -> Long ->
                "${fn()*2}"
            },
            exercise1Fun = {fn: suspend (Long) -> Long ->
                "${fn(-7)}"
            },
            exercise2Fun = {fn: (suspend (Long) -> Long, suspend (Long) -> Long) -> suspend (Long) -> Long ->
                "${fn({a: Long -> a + 1}, {b: Long -> b * 3})(23)}"
            },
            exercise3Fun = {fn: suspend (Float, Double, Long) -> Double -> "${fn(1.0F, 4.4, 2)}" },
            exercise4Fun = {fn: suspend (a: String, b: String, c: String, d: String) -> List<String> -> "${fn("Pump", "up", "the", "jam")}"},
            exercise5Fun = {fn: suspend (a: String, b: Long, c: Double, d: String, e: suspend () -> Long) -> suspend () -> Long -> "${fn("78", 6, 4.2, "12", { 654 })()}" },
            exercise6Fun = {fn: suspend (a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long) -> Long -> "${fn("78", 6, 4.2, "12", { 654 }, 98)}" },
            thunkTwiceMakerFun = {fn: suspend () -> kotlin.Unit ->
                {
                    fn()
                    fn()
                }
            }
        )
        testAsyncForeignSideFunctionsCore(a)
    }

    @Test
    fun testAsyncForeignSideFunctionsWitness() = runTest(timeout = 1000000.seconds) {
        val _a = TestAsyncForeignSideFunctionsStruct(
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
            },
            willThrow = {
                throw(Error("Spoon!"))
            },
            exercise0Fun = {fn: suspend () -> Long ->
                "${fn()*2}"
            },
            exercise1Fun = {fn: suspend (Long) -> Long ->
                "${fn(-7)}"
            },
            exercise2Fun = {fn: (suspend (Long) -> Long, suspend (Long) -> Long) -> suspend (Long) -> Long ->
                "${fn({a: Long -> a + 1}, {b: Long -> b * 3})(23)}"
            },
            exercise3Fun = {fn: suspend (Float, Double, Long) -> Double -> "${fn(1.0F, 4.4, 2)}" },
            exercise4Fun = {fn: suspend (a: String, b: String, c: String, d: String) -> List<String> -> "${fn("Pump", "up", "the", "jam")}"},
            exercise5Fun = {fn: suspend (a: String, b: Long, c: Double, d: String, e: suspend () -> Long) -> suspend () -> Long -> "${fn("78", 6, 4.2, "12", { 654 })()}" },
            exercise6Fun = {fn: suspend (a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long) -> Long -> "${fn("78", 6, 4.2, "12", { 654 }, 98)}" },
            thunkTwiceMakerFun = {fn: suspend () -> kotlin.Unit ->
                {
                    fn()
                    fn()
                }
            }
        )
        val a = _a.witness()
        testAsyncForeignSideFunctionsCore(a)
    }

    fun testAsyncSwiftSideFunctionsCore(a: TestAsyncFunctions) = runTest(timeout = 1000000.seconds) {
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

        val result = runCatching {
            a.willThrow()
        }
        assertInstanceOf(Error::class.java, result.exceptionOrNull())
        assertEquals("TheAsyncError()", result.exceptionOrNull()?.message)

        val g = a.exercise0(e)
        assertEquals(g, "42")
        val h = a.exercise1(b)
        assertEquals(h, "-45")
        val i = a.exercise2 { a: suspend (Long) -> Long, b: suspend (Long) ->
            Long -> { z: Long ->
                a(3) + b(3) + z
            }
        }
        assertEquals("21", i)
        val j = a.exercise3 { fl, d, l -> (fl / d) + 9 * l }
        assertEquals("18.227272727272727", j)
        val k = a.exercise4 { a: String, b: String, c: String, d: String -> listOf(d, c, b, a) }
        assertEquals("[\"d\", \"c\", \"b\", \"a\"]", k)
        val l = a.exercise5(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long -> { (b.toDouble() + c + e()).toLong() } } )
        assertEquals("93", l)
        val m = a.exercise6(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long -> (b.toDouble() + c + e() + f).toLong() } )
        assertEquals("135", m)
        var o = 3.14159265359
        val n = a.thunkTwiceMaker {
            o = o * o
            if (DEBUG_PRINTS) {
                println("Thunkmaster thex")
            }
        }
        n()
        assertEquals(97.4090910340281, o)
        val p = a.defaultExercise6(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long -> (a.toDouble() + b.toDouble() + c + d.toDouble() + e() + f).toLong() } )
        assertEquals("962", p)
    }
    @Test
    fun testAsyncSwiftSideFunctions() = runTest(timeout = 1000000.seconds) {
        val a = TestAsyncSwiftSideFunctionsClass.init()
        testAsyncSwiftSideFunctionsCore(a)
    }

    @Test
    fun testAsyncSwiftSideFunctionsWitness() = runTest(timeout = 1000000.seconds) {
        val _a = TestAsyncSwiftSideFunctionsClass.init()
        val a = _a.witness()
        testAsyncSwiftSideFunctionsCore(a)
    }

    fun testAsyncFunctionsImplCore(a: TestAsyncFunctions) = runTest(timeout = 1000000.seconds) {
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

        val result = runCatching {
            a.willThrow()
        }
        assertInstanceOf(Error::class.java, result.exceptionOrNull())
        assertEquals("Spoon!", result.exceptionOrNull()?.message)

        val g = a.exercise0 { 42 }
        assertEquals("84", g)
        val h = a.exercise1(b)
        assertEquals("-105", h)
        val i = a.exercise2 { a: suspend (Long) -> Long, b: suspend (Long) ->
        Long -> { z: Long ->
            a(3) + b(3) + z
        }
        }
        assertEquals("36", i)
        val j = a.exercise3 { fl: Float, d: Double, l: Long -> (fl / d) + 9 * l }
        assertEquals("18.227272727272727", j)
        val k = a.exercise4 { a: String, b: String, c: String, d: String -> listOf(d, c, b, a) }
        assertEquals("[jam, the, up, Pump]", k)
        val l = a.exercise5(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long -> { (a.toDouble() + b.toDouble() + c + d.toDouble() + e()).toLong() } } )
        assertEquals("754", l)
        val m = a.exercise6(fn = {a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long -> (a.toDouble() + b.toDouble() + c + d.toDouble() + e() + f).toLong() } )
        assertEquals("852", m)
        var o = 1
        val n = a.thunkTwiceMaker {
            o += 1
            if (DEBUG_PRINTS) {
                println("Days of Thunker!")
            }
        }
        n()
        assertEquals(3, o)
        val p = a.defaultExercise6(fn =
        {
                a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long ->
            (a.toDouble() + b.toDouble() + c + d.toDouble() + e() + f).toLong()
        }
        )
        assertEquals("962", p)
    }
    @Test
    fun testAsyncFunctionsImpl() = runTest(timeout = 1000000.seconds) {
        val a = TestAsyncFunctionsImpl()
        testAsyncFunctionsImplCore(a)
    }

    @Test
    fun testAsyncFunctionsImplWitness() = runTest(timeout = 1000000.seconds) {
        val _a = TestAsyncFunctionsImpl()
        val a = _a.witness()
        testAsyncFunctionsImplCore(a)
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

        override fun hasADefaultImplementation2(a: String, b: Boolean, c: String): String {
            val a_prime = "wibbledy wobbledy $a woo"
            val b_prime = !b
            val c_prime = (c.toDouble() * 7.23890).toString()
            return super.hasADefaultImplementation2(a_prime, b_prime, c_prime)
        }
    }

    class TestAsyncFunctionsImpl : TestAsyncFunctions {
        override val const42: suspend () -> Long
            get() = {
                49
            }
        override val iabs: suspend (Long) -> Long
            get() = {
                abs(it)
            }
        override val intCompose: (suspend (Long) -> Long, suspend (Long) -> Long) -> suspend (Long) -> Long
            get() = { f: suspend (Long) -> Long, g: suspend (Long) -> Long ->
                { x: Long ->
                    f(g(x))
                }
            }
        override val add3Things: suspend (Float, Double, Long) -> Double
            get() = { x: Float, y: Double, z: Long ->
                x.toDouble() + y + z.toDouble()
            }
        override val makeList: suspend (String, String, String, String) -> List<String>
            get() = { a: String, b: String, c: String, d: String ->
                listOf(a, b, c, d)
            }
        override val fifthThing: suspend (String, Long, Double, String, suspend () -> Long) -> suspend () -> Long
            get() = { a: String, b: Long, c: Double, d: String, e: suspend () -> Long ->
                e
            }
        override val six: suspend (String, Long, Double, String, suspend () -> Long, Long) -> Long
            get() = { a: String, b: Long, c: Double, d: String, e: suspend () -> Long, f: Long ->
                f
            }
        override val willThrow: suspend () -> Long
            get() = {
                throw(Error("Spoon!"))
            }
        override suspend fun exercise0(fn: suspend () -> Long): String {
            return "${fn()*2}"
        }

        override suspend fun exercise1(fn: suspend (Long) -> Long): String {
            return "${fn(-7)}"
        }

        override suspend fun exercise2(fn: (suspend (Long) -> Long, suspend (Long) -> Long) -> suspend (Long) -> Long): String {
            return "${fn({a: Long -> a + 1}, {b: Long -> b * 3})(23)}"
        }

        override suspend fun exercise3(fn: suspend (Float, Double, Long) -> Double): String {
            return "${fn(1.0F, 4.4, 2)}"
        }

        override suspend fun exercise4(fn: suspend (String, String, String, String) -> List<String>): String {
            return "${fn("Pump", "up", "the", "jam")}"
        }

        override suspend fun exercise5(fn: suspend (String, Long, Double, String, suspend () -> Long) -> suspend () -> Long): String {
            return "${fn("78", 6, 4.2, "12", { 654 })()}"
        }

        override suspend fun exercise6(fn: suspend (String, Long, Double, String, suspend () -> Long, Long) -> Long): String {
            return "${fn("78", 6, 4.2, "12", { 654 }, 98)}"
        }

        override fun thunkTwiceMaker(thunk: suspend () -> Unit): suspend () -> Unit {
            return {
                thunk()
                thunk()
            }
        }

        override fun witness(): TestAsyncFunctions {
            return TestAsyncFunctionsImpl()
        }
    }

    @Test
    fun testDefaultComputedPropertiesImpl() = runTest(timeout = 1000000.seconds) {
        val a = TestDefaultComputedPropertiesImpl()
        val b = a.noot
        println("b $b")
        val c = a.plutonic
        val d = c
    }
    class TestDefaultComputedPropertiesImpl : TestDefaultComputedProperties {
        override val noot: Long
            get() = 42
    }
}
