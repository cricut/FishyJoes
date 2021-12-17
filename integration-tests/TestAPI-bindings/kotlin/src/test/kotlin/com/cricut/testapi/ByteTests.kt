package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.util.*

internal class ByteTests {
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