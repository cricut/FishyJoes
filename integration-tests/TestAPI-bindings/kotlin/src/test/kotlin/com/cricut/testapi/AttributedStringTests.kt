package com.cricut.testapi

import com.cricut.fishyjoes.runtime.AttributeContainer
import com.cricut.fishyjoes.runtime.AttributedString
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class AttributedStringTests {
    @Test
    fun testStringValues() {
        assertEquals(AttributedStrings.simple, AttributedString.create("Hello", AttributeContainer.createWithLanguageIdentifier("en")))
        assertEquals(AttributedStrings.accent, AttributedString.create("Olá", AttributeContainer.createWithLanguageIdentifier("pt")))
        assertEquals(AttributedStrings.script, AttributedString.create("こんにちは", AttributeContainer.createWithLanguageIdentifier("ja")))
        assertEquals(AttributedStrings.chinese, AttributedString.create("你好", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.chineseBMP, AttributedString.create("豈更車賈滑", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.chineseSIP, AttributedString.create("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.emoji, AttributedString.create("🤯🐶🍓", AttributeContainer.createWithLink("https://home.unicode.org/emoji")))
        assertEquals(AttributedStrings.emojiMulti, AttributedString.create("👨‍👩‍👧‍👦👍🏿🇺🇸", AttributeContainer.createWithLink("https://home.unicode.org/emoji/emoji-frequency")))
    }

    @Test
    fun testStringEcho() {
        assertEquals(AttributedStrings.echo(AttributedStrings.simple), AttributedStrings.simple)
        assertEquals(AttributedStrings.echo(AttributedStrings.accent), AttributedStrings.accent)
        assertEquals(AttributedStrings.echo(AttributedStrings.chinese), AttributedStrings.chinese)
        assertEquals(AttributedStrings.echo(AttributedStrings.chineseBMP), AttributedStrings.chineseBMP)
        assertEquals(AttributedStrings.echo(AttributedStrings.chineseSIP), AttributedStrings.chineseSIP)
        assertEquals(AttributedStrings.echo(AttributedStrings.emoji), AttributedStrings.emoji)
        assertEquals(AttributedStrings.echo(AttributedStrings.emojiMulti), AttributedStrings.emojiMulti)
    }
}
