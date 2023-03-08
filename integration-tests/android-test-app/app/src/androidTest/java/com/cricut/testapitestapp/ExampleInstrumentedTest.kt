package com.cricut.testapitestapp

import androidx.test.ext.junit.runners.AndroidJUnit4

import com.cricut.testapi.*

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*
import androidx.test.platform.app.InstrumentationRegistry
import androidx.test.platform.app.InstrumentationRegistry.getInstrumentation

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @Test
    fun useAppContext() {
          assertEquals(Primitives.maxInt8, 0x7f.toByte())
    }

    @Test
    fun testLargePayload() {
        val testContext = InstrumentationRegistry.getInstrumentation().context
        var testInput = testContext.getAssets().open("shapes.bmp")
        val bytes = testInput.readBytes()
        assertTrue(bytes.isNotEmpty())
        assertEquals("Swift data reports empty", Bytes.echoEmpty(bytes),false)
        assertTrue("Echoed data != input", Bytes.echoData(bytes).contentEquals(bytes))
    }

    @Test
    fun testBytesValues() {
        assertEquals(Bytes.bytes, arrayListOf(0xDE.toUByte(), 0xAD.toUByte(), 0xBE.toUByte(), 0xEF.toUByte()))
        assert(Bytes.data.contentEquals(byteArrayOf(0x0B.toByte(), 0xAD.toByte(), 0xF0.toByte(), 0x0D.toByte())))
    }

    @Test
    fun testEchoBytes() {
        assertEquals(Bytes.echoBytes(Bytes.bytes), Bytes.bytes)
        assert(Bytes.echoData(Bytes.data).contentEquals(Bytes.data))
    }
}