package com.cricut.testapi

import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test
import java.net.MalformedURLException
import java.net.URI

class URLTests {
    @Test
    fun testURLValues() {
        assertEquals(URI("https://www.google.com"), URLs.simple)
        assertEquals(URI("https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"), URLs.remoteFile, )
        assertEquals(URI("file:///Users/someuser/Desktop/a.png"), URLs.localFile)
        assertEquals("data", URLs.dataImage.scheme)
    }

    @Test
    fun testURLEcho() {
        assertEquals(URLs.simple, URLs.echo(URLs.simple))
        assertEquals(URLs.remoteFile, URLs.echo(URLs.remoteFile))
        assertEquals(URLs.localFile, URLs.echo(URLs.localFile))
        assertEquals(URLs.dataImage, URLs.echo(URLs.dataImage))
    }
}
