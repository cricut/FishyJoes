package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class RangeTests {
    @Test
    fun testRangeValues() {
        assertEquals(Ranges.closedIntRange, -10..20)
    }

    @Test
    fun testRangeEcho() {
        assertEquals(Ranges.echo(Ranges.closedIntRange, -10..20))
    }
}
