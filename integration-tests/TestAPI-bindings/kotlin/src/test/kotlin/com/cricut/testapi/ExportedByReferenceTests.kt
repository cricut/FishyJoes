package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class ExportedByReferenceTests {
    @Test
    fun makeMeIntoATest() {
        assertEquals(ExportedByReference.create().text, "Hello, World!")
        assertEquals(ExportedByReference.create(), ExportedByReference.create())
    }
}
