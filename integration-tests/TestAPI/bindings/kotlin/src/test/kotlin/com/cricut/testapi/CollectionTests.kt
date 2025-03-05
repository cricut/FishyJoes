package com.cricut.testapi

import com.cricut.fishyjoes.runtime.Tuple4
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class CollectionTests {
    @Test
    fun testCollectionValues() {
        assertEquals(Collections.arrayOfInt, arrayListOf(2L, 7L, 3L, 5L, 8L))
        assert(Collections.setOfInt.containsAll(setOf(5L, 9L, 2L, 4L, 3L)))
        assertEquals(Collections.dictionaryOfIntToInt, mapOf(1L to 10L, 2L to 20L, 3L to 30L, 4L to 40L, 5L to 50L))
        assertEquals(Collections.arrayOfBigTuples, arrayListOf<Tuple4<Byte, Short, Int, Long>>(
            Tuple4(1, 2, 3, 4),
            Tuple4(5, 6, 7, 8)
        ));
    }

    @Test
    fun testOptionalCollectionValues() {
        assertEquals(Collections.maybeArrayOfInt, arrayListOf(2L, 7L, 3L, 5L, 8L))
        assertEquals(Collections.maybeSetOfInt?.containsAll(setOf(5L, 9L, 2L, 4L, 3L)), true)
        assertEquals(Collections.maybeDictionaryOfIntToInt, mapOf(1L to 10L, 2L to 20L, 3L to 30L, 4L to 40L, 5L to 50L))
    }

    @Test
    fun testOptionalCollectionOfOptionalValues() {
        assertEquals(Collections.maybeArrayOfMaybeInt, arrayListOf(null, 2L, 7L, 3L, 5L, 8L))
        assertEquals(Collections.maybeSetOfMaybeInt?.containsAll(setOf(null, 5L, 9L, 2L, 4L, 3L)), true)
        assertEquals(Collections.maybeDictionaryOfIntToMaybeInt, mapOf(100L to null, 1L to 10L, 2L to 20L, 3L to 30L, 4L to 40L, 5L to 50L))
    }

    @Test
    fun testFunctionsTakingAndReturningCollectionTypes() {
        assertEquals(Collections.echoArrayOfInt(Collections.arrayOfInt), Collections.arrayOfInt)
        assertEquals(Collections.echoSetOfInt(Collections.setOfInt), Collections.setOfInt)
        assertEquals(Collections.echoDictionaryOfIntToInt(Collections.dictionaryOfIntToInt), Collections.dictionaryOfIntToInt)
    }

    @Test
    fun testFunctionsTakingAndReturningOptionalCollectionTypes() {
        assertEquals(Collections.echoMaybeArrayOfMaybeInt(Collections.maybeArrayOfMaybeInt), Collections.maybeArrayOfMaybeInt)
        assertEquals(Collections.echoMaybeSetOfMaybeInt(Collections.maybeSetOfMaybeInt), Collections.maybeSetOfMaybeInt)
        assertEquals(Collections.echoMaybeDictionaryOfIntToMaybeInt(Collections.maybeDictionaryOfIntToMaybeInt), Collections.maybeDictionaryOfIntToMaybeInt)
    }

    @Test
    fun testFunctionsTakingClosuresWithCollectionTypes() {
        assertEquals(Collections.collectionMapper(arrayListOf(10L, null, 30L)) { (it ?: arrayListOf()).map { (it ?: 1L) * 2L } }, arrayListOf(20L, 2L, 60L))
    }

    @Test
    fun testObjectsWithCollectionMembers() {
        assertEquals(Collections.CollectionHolder.staticProperty, arrayListOf(null, 2L, 7L, 3L, 5L, 8L))
        assertEquals(Collections.CollectionHolder.staticMutableProperty, arrayListOf(null, 2L, 7L, 3L, 5L, 8L))
        Collections.CollectionHolder.staticMutableProperty = arrayListOf(100L, null, 200L)
        assertEquals(Collections.CollectionHolder.staticMutableProperty, arrayListOf(100L, null, 200L))
        val s = Collections.defaultCollectionHolder
        assertEquals(s, Collections.defaultCollectionHolder)
        s.boolDictionary = s.boolDictionary.map { Pair(it.key, !it.value) }.toMap()
        assertNotEquals(s, Collections.defaultCollectionHolder)
    }
}
