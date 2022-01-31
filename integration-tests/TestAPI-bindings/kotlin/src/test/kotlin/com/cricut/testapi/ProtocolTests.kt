package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class ProtocolTests {
    data class AKotlinConformance(override var foo: String): AProtocol {
        override fun bar(x: Long, y: Long) = AKotlinConformance("I'm Kotlin!")
    }

    @Test
    fun testPrimitiveValues() {
        val proto = AProtocolImplementation("hello")
        assertEquals(proto.foo, "hello")
        assertEquals(proto.bar(1, 4).foo, "5")
    }
}
