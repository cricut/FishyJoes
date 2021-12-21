package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class CollectionTests {
    @Test
    fun testCollectionValues() {
        assertEquals(Collections.arrayOfInt, arrayListOf(2,7,3,5,8).map { it.toLong() })
        assert(Collections.setOfInt.containsAll(setOf(5,9,2,4,3).map { it.toLong() }))
        assertEquals(Collections.dictionaryOfIntToInt, mapOf(
            1.toLong() to 10.toLong(),
            2.toLong() to 20.toLong(),
            3.toLong() to 30.toLong(),
            4.toLong() to 40.toLong(),
            5.toLong() to 50.toLong()
        ))
    }

    @Test
    fun testOptionalCollectionValues() {
        assertEquals(Collections.maybeArrayOfInt, arrayListOf(2,7,3,5,8).map { it.toLong() })
        assert(Collections.maybeSetOfInt?.containsAll(setOf(5,9,2,4,3).map { it.toLong() }) ?: false)
        assertEquals(Collections.maybeDictionaryOfIntToInt, mapOf(
            1.toLong() to 10.toLong(),
            2.toLong() to 20.toLong(),
            3.toLong() to 30.toLong(),
            4.toLong() to 40.toLong(),
            5.toLong() to 50.toLong()
        ))
    }

    @Test
    fun testOptionalCollectionOfOptionalValues() {
        assertEquals(Collections.maybeArrayOfMaybeInt, arrayListOf(null, 2,7,3,5,8).map { it?.toLong() })
        assert(Collections.maybeSetOfMaybeInt?.containsAll(setOf(null, 5,9,2,4,3).map { it?.toLong() }) ?: false)
        assertEquals(Collections.maybeDictionaryOfMaybeIntToMaybeInt, mapOf(
            null to 100,
            1.toLong() to 10.toLong(),
            2.toLong() to 20.toLong(),
            3.toLong() to 30.toLong(),
            4.toLong() to 40.toLong(),
            5.toLong() to 50.toLong()
        ))
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
//        assertEquals(Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(Collections.maybeDictionaryOfMaybeIntToMaybeInt), Collections.maybeDictionaryOfMaybeIntToMaybeInt)
    }

    @Test
    fun testFunctionsTakingClosuresWithCollectionTypes() {
        // TODO: Fix breakage
//        assertEquals(Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }, arrayListOf(20,40,60))
    }
}
