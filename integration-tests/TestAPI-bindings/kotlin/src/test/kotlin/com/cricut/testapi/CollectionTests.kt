package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class CollectionTests {
    @Test
    fun testCollectionValues() {
        assertEquals(Collections.arrayOfInt, arrayListOf(2,7,3,5,8).map { it.toLong() })
        assertEquals(Collections.setOfInt.toSortedSet(), setOf(5,9,2,4,3).map { it.toLong() }.toSortedSet())
        assertEquals(Collections.dictionaryOfIntToInt, mapOf(
            1.toLong() to 10.toLong(),
            2.toLong() to 20.toLong(),
            3.toLong() to 30.toLong(), 
            4.toLong() to 40.toLong(),
            5.toLong() to 50.toLong()
        ))
    }
}
