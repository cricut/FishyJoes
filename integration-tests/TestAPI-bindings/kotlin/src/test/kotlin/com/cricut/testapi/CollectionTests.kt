package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class CollectionTests {
    @Test
    fun testCollectionValues() {
        assertEquals(Collections.arrayOfInt, arrayListOf(2L,7L,3L,5L,8L))
        assert(Collections.setOfInt.containsAll(setOf(5L,9L,2L,4L,3L)))
        assertEquals(Collections.dictionaryOfIntToInt, mapOf(1L to 10L,2L to 20L,3L to 30L,4L to 40L,5L to 50L))
    }

    @Test
    fun testOptionalCollectionValues() {
        assertEquals(Collections.maybeArrayOfInt, arrayListOf(2L,7L,3L,5L,8L))
        assertEquals(Collections.maybeSetOfInt?.containsAll(setOf(5L,9L,2L,4L,3L)), true)
        assertEquals(Collections.maybeDictionaryOfIntToInt, mapOf(1L to 10L,2L to 20L,3L to 30L,4L to 40L,5L to 50L))
    }

    @Test
    fun testOptionalCollectionOfOptionalValues() {
        assertEquals(Collections.maybeArrayOfMaybeInt, arrayListOf(null,2L,7L,3L,5L,8L))
        assertEquals(Collections.maybeSetOfMaybeInt?.containsAll(setOf(null,5L,9L,2L,4L,3L)), true)
        assertEquals(Collections.maybeDictionaryOfIntToMaybeInt, mapOf(100 to null,1L to 10L,2L to 20L,3L to 30L,4L to 40L,5L to 50L))
    }

    @Test
    fun testFunctionsTakingAndReturningCollectionTypes() {
        assertEquals(Collections.echoArrayOfInt(Collections.arrayOfInt), Collections.arrayOfInt)
        // TODO: Dies with: Wrong object class or methodID passed to JNI call
//        assertEquals(Collections.echoSetOfInt(Collections.setOfInt), Collections.setOfInt)
        // TODO: Dies with: Wrong object class or methodID passed to JNI call
//        assertEquals(Collections.echoDictionaryOfIntToInt(Collections.dictionaryOfIntToInt), Collections.dictionaryOfIntToInt)
    }

    @Test
    fun testFunctionsTakingAndReturningOptionalCollectionTypes() {
        assertEquals(Collections.echoMaybeArrayOfMaybeInt(Collections.maybeArrayOfMaybeInt), Collections.maybeArrayOfMaybeInt)
        // TODO: Dies with: Wrong object class or methodID passed to JNI call
//        assertEquals(Collections.echoMaybeSetOfMaybeInt(Collections.maybeSetOfMaybeInt), Collections.maybeSetOfMaybeInt)
        // TODO: Dies with: Wrong object class or methodID passed to JNI call
//        assertEquals(Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(Collections.maybeDictionaryOfIntToMaybeInt), Collections.maybeDictionaryOfIntToMaybeInt)
    }

    @Test
    fun testFunctionsTakingClosuresWithCollectionTypes() {
        // TODO: Fix breakage
//        assertEquals(Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }, arrayListOf(20,40,60))
    }

    @Test
    fun testObjectsWithCollectionMembers() {
        assertEquals(Collections.CollectionHolder.staticPropery, arrayListOf(null,2L,7L,3L,5L,8L))
        assertEquals(Collections.CollectionHolder.staticMutablePropery, arrayListOf(null,2L,7L,3L,5L,8L))
        Collections.CollectionHolder.staticMutablePropery = arrayListOf(100L,null,200L)
        assertEquals(Collections.CollectionHolder.staticMutablePropery, arrayListOf(100L,null,200L))
        val s = Collections.defaultCollectionHolder
        assertEquals(s, Collections.defaultCollectionHolder)
        s.boolDictionary = s.boolDictionary.map { Pair(it.key, !it.value) }.toMap()
        assertNotEquals(s, Collections.defaultCollectionHolder)
    }
}
