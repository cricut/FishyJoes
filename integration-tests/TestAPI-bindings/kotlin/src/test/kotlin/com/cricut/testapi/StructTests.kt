package com.cricut.testapi

import kotlinx.coroutines.runBlocking
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class StructTests {
    @Test
    fun testConstruction() {
        val memberwise = Structs.MemberwiseStruct.create()
        assertEquals(memberwise.immutable, "Eternal")
        assertEquals(memberwise.mutable, "Fickle")

        val reference = Structs.ReferenceStruct.create()
        assertEquals(reference.immutable, "Eternal")
        assertEquals(reference.mutable, "Fickle")
    }

    @Test
    fun testEmptyStruct() {
        val emptyStruct = Structs.EmptyStruct.create()
        assertEquals(emptyStruct.tutu, 35671)
        assertEquals(emptyStruct.aap(), "The Netherlands")
    }

    @Test
    fun testMutablility() {
        val memberwise = Structs.MemberwiseStruct.create()
        assertEquals(memberwise.immutable, "Eternal")
        // TODO: Ensure this is true!
//        memberwise.immutable = "Should generate a compile Error!"
        assertEquals(memberwise.mutable, "Fickle")
        memberwise.mutable = "Fickle as the wind"
        assertNotEquals(memberwise.mutable, "Fickle")

        val reference = Structs.ReferenceStruct.create()
        assertEquals(reference.immutable, "Eternal")
        // TODO: Ensure this is true!
//        reference.immutable = "Should generate a compile Error!"
        assertEquals(reference.mutable, "Fickle")
        memberwise.mutable = "Fickle as the wind"
        assertNotEquals(memberwise.mutable, "Fickle")
    }

    @Test
    fun testEquality() {
        assertEquals(Structs.MemberwiseStruct.create(), Structs.MemberwiseStruct.create())
        assertEquals(Structs.ReferenceStruct.create(), Structs.ReferenceStruct.create())
        assertNotEquals(Structs.MemberwiseStruct.create(), Structs.ReferenceStruct.create())
    }

    @Test
    fun testMutatingFunctions() {
        val struct = Structs.MutableStruct.create()
        assertEquals(0, struct.i)
        struct.increment()
        assertEquals(1, struct.i)
        runBlocking {
            struct.incrementAsync()
            assertEquals(2, struct.i)
        }
    }

    @Test
    fun testAsyncMemberFunctions() {
        runBlocking {
            val memberwise = Structs.MemberwiseStruct.create()
            assertEquals("Fickle", memberwise.asyncGetMutable())
        }
        runBlocking {
            val reference = Structs.ReferenceStruct.create()
            assertEquals("Fickle", reference.asyncGetMutable())
        }

        runBlocking {
            val mutable = Structs.MutableStruct.create()
            assertEquals(0, mutable.asyncGetI())
        }
    }
}
