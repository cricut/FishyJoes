package com.cricut.testapitestapp

import com.cricut.testapi.Bytes
import org.junit.Test

import org.junit.Assert.*
import java.io.File

/**
 * Example local unit test, which will execute on the development machine (host).
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
class ExampleUnitTest {
    @Test
    fun testLargePayload() {
        val bytes = File("src/test/java/com/cricut/fishyjoes/runtimetestapp/resources/img.bmp").readBytes()
        assertTrue(bytes.isNotEmpty())
        assertTrue(Bytes.echoData(bytes).contentEquals(bytes))
        assertFalse(Bytes.echoEmpty(bytes))
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
