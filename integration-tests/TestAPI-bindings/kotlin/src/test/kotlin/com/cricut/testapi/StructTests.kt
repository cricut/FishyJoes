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
        val emptyStruct1 = EmptyStruct.create()
        assertEquals(emptyStruct1.tutu, 35671)
        assertEquals(emptyStruct1.aap(), "The Netherlands")

        val emptyStruct2 = EmptyStruct.create()
        assertEquals(emptyStruct2.tutu, 35671)
        assertEquals(emptyStruct2.aap(), "The Netherlands")

        val emptyStruct3 = emptyStruct2.copy()
        assertEquals(emptyStruct3.tutu, 35671)
        assertEquals(emptyStruct3.aap(), "The Netherlands")

        assertEquals(emptyStruct1, emptyStruct2)
        assertEquals(emptyStruct1.hashCode(), emptyStruct2.hashCode())

        assertEquals(emptyStruct2, emptyStruct3)
        assertEquals(emptyStruct2.hashCode(), emptyStruct3.hashCode())
        
        assertEquals(emptyStruct1.toString(), "EmptyStruct(tatiana = Toodles! ta ta for now..., tutu = 35671)")
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
