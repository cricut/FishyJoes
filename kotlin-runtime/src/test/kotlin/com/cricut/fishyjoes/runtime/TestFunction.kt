package com.cricut.fishyjoes.runtime

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.BeforeAll
import org.junit.jupiter.api.Test

data class TestReference(var ref: Long) {
    external fun append(x: Long)
    external fun addr(): Long
    external fun log()
}

internal class TestFunction {
    @Test
    fun functionPassing() {
        assertEquals("42100", fun0 { a, b -> a * 1000 + b })
        assertEquals(13, fun1()(10, 3))
    }

    @Test
    fun copyOnWriteOK() {
        val ref = makeReference()
        var copyCount = 0
        for (i in 0..1000) {
            val oldAddress = ref.addr()
            ref.append(i.toLong())
            if (ref.addr() != oldAddress) {
                copyCount += 1
            }
        }
        println("$copyCount copies")
        assertTrue(copyCount < 100)
    }

    private external fun fun0(f: (Long, Long) -> Long): String
    private external fun fun1(): (Long, Long) -> Long
    private external fun makeReference(): TestReference

    companion object {
        @BeforeAll
        @JvmStatic
        fun loadLib() {
            System.loadLibrary("JavaRuntimeTestHarness")
        }
    }
}