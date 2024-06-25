package com.cricut.testapi

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.net.URL

class URLTests {
    @Test
    fun testURLValues() {
        assertEquals(URLs.simple, URL("https://www.google.com"))
        assertEquals(URLs.remoteFile, URL("https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"))
        assertEquals(URLs.localFile, URL("file:///Users/someuser/Desktop/a.png"))
    }

    @Test
    fun testURLEcho() {
        assertEquals(URLs.echo(URLs.simple), URLs.simple)
        assertEquals(URLs.echo(URLs.remoteFile), URLs.remoteFile)
        assertEquals(URLs.echo(URLs.localFile), URLs.localFile)
    }
}