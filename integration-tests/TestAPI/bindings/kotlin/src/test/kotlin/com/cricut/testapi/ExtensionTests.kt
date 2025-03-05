package com.cricut.testapi

import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.assertThrows

class ExtensionTests {
    @Test
    fun testExtensions() {
        assertEquals(42, String_PuttingTypesIntoQuestionablePlaces("").testCall());
        assertEquals(43, Structs_PuttingTypesIntoQuestionablePlaces.create().testCall());
        assertEquals(44, UnicodeScalar_PuttingTypesIntoQuestionablePlaces.Thing.testCall());
    }
}