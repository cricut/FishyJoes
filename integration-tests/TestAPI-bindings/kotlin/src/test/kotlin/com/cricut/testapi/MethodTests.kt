package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class MethodTests {
    @Test
    fun testStaticMethods() {
        assertEquals(123, Methods.staticGet)
        assertEquals(234, Methods.staticGetMethod())

        assertEquals(345, Methods.staticModifiable)
        Methods.staticModifiable = 987
        assertEquals(987, Methods.staticModifiable)

        assertEquals(567, Methods.staticStored)
        Methods.staticStored = 765
        assertEquals(765, Methods.staticStored)
    }

    @Test
    fun testInstanceMethods() {
        val instance = Methods.create()

        assertEquals(1234, instance.instanceGet)
        assertEquals(2345, instance.instanceGetMethod())

        assertEquals(3456, instance.instanceModifiable)
        instance.instanceModifiable = 9876
        assertEquals(9876, instance.instanceModifiable)

        assertEquals(5678, instance.instanceStored)
        instance.instanceStored = 7654
        assertEquals(7654, instance.instanceStored)
    }
}
