package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.util.*

internal class DefaultArgumentsTest {
    @Test
    fun testDefaultArguments() {
        assertEquals("42 52 3.14", DefaultArguments.echoDefaults(null));
        assertEquals("42 52 3.14", DefaultArguments.echoDefaults(null, y = null));
        assertEquals("1 52 3.14", DefaultArguments.echoDefaults(1));
        assertEquals("1 52 42.0", DefaultArguments.echoDefaults(1, z = 42.0));
        assertEquals("42 8 3.14", DefaultArguments.echoDefaults(null, y = 8));
        assertEquals("1 2 4.8", DefaultArguments.echoDefaults(1, z = 4.8, y = 2));
    }
}
