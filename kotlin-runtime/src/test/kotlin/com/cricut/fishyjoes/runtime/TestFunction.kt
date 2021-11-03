package com.cricut.fishyjoes.runtime

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test

internal class TestFunction {
    @Test
    fun functionPassing() {
        assertEquals("42100", fun0 { a, b -> a * 1000 + b })
        assertEquals(13, fun1()(10, 3))
    }

    private external fun fun0(f: (Long, Long) -> Long): String
    private external fun fun1(): (Long, Long) -> Long

    companion object {
        @BeforeAll
        @JvmStatic
        fun loadLib() {
            System.loadLibrary("JavaRuntimeTestHarness")
        }
    }
}