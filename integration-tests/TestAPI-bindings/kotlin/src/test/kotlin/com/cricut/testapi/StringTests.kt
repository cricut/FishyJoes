package com.cricut.testapi

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class StringTests {
    @Test
    fun testStringValues() {
        assertEquals(Strings.simple, "Hello")
        assertEquals(Strings.accent, "Olá")
        assertEquals(Strings.script, "こんにちは")
        assertEquals(Strings.chinese, "你好")
        assertEquals(Strings.chineseBMP, "豈更車賈滑")
        assertEquals(Strings.chineseSIP, "\uD840\uDC00\uD840\uDC02\uD840\uDC03\uD840\uDC04")
        assertEquals(Strings.emoji, "🤯🐶🍓")
        assertEquals(Strings.emojiMulti, "👨‍👩‍👧‍👦👍🏿🇺🇸")
    }

    @Test
    fun testStringEcho() {
        assertEquals(Strings.echo(Strings.simple), Strings.simple)
        assertEquals(Strings.echo(Strings.accent), Strings.accent)
        assertEquals(Strings.echo(Strings.chinese), Strings.chinese)
        assertEquals(Strings.echo(Strings.chineseBMP), Strings.chineseBMP)
        assertEquals(Strings.echo(Strings.chineseSIP), Strings.chineseSIP)
        assertEquals(Strings.echo(Strings.emoji), Strings.emoji)
        assertEquals(Strings.echo(Strings.emojiMulti), Strings.emojiMulti)
    }
}
