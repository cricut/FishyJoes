package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.util.*
import kotlin.random.Random

internal class DefaultArgumentsTests {
    @Test
    fun testDefaultArguments() {
        assertEquals("42 52 3.14", DefaultArguments.echoDefaults(x = null))
        assertEquals("42 52 3.14", DefaultArguments.echoDefaults(x = null, y = null))
        assertEquals("1 52 3.14", DefaultArguments.echoDefaults(x = 1))
        assertEquals("1 52 42.0", DefaultArguments.echoDefaults(x = 1, z = 42.0))
        assertEquals("42 8 3.14", DefaultArguments.echoDefaults(x = null, y = 8))
        assertEquals("1 2 4.8", DefaultArguments.echoDefaults(x = 1, z = 4.8, y = 2))
    }

    @Test
    fun testDefaultArgumentsBinaryCompatibility() {
        // Ensure that all 3 methods are present at runtime
        val method1 = DefaultArguments.Companion::class.java.getDeclaredMethod(
            "echoDefaults",
            java.lang.Long::class.java
        )
        val method2 = DefaultArguments.Companion::class.java.getDeclaredMethod(
            "echoDefaults",
            java.lang.Long::class.java,
            Double::class.java,
        )
        val method3 = DefaultArguments.Companion::class.java.getDeclaredMethod(
            "echoDefaults",
            java.lang.Long::class.java,
            java.lang.Long::class.java,
            Double::class.java
        )
        assertEquals("42 52 3.14", method1.invoke(DefaultArguments.Companion, null))
        assertEquals("1 52 42.0", method2.invoke(DefaultArguments.Companion, 1L, 42.0))
        assertEquals("1 2 4.8", method3.invoke(DefaultArguments.Companion, 2L, 1L, 4.8))
    }
}
