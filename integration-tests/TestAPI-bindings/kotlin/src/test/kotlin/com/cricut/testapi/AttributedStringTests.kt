package com.cricut.testapi

import com.cricut.fishyjoes.runtime.AttributeContainer
import com.cricut.fishyjoes.runtime.AttributedString
import com.cricut.fishyjoes.runtime.SwiftRange
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

        val polyglot = AttributedString.createEmpty()
        polyglot.append(AttributedStrings.simple)
        polyglot.append(AttributedString.create(" "))
        polyglot.append(AttributedStrings.accent)
        polyglot.append(AttributedString.create(" "))
        polyglot.append(AttributedStrings.script)
        assertEquals(AttributedStrings.polyglot, polyglot)
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

    @Test
    fun testSubstring() {
        val polyglot = AttributedStrings.polyglot
        val range = SwiftRange(polyglot.characters.indexAfter(polyglot.startIndex), polyglot.characters.indexBefore(polyglot.endIndex))
        val substring = polyglot.substringForRange(range)
        assertEquals(substring.string, "ello Olá こんにち")
    }

    @Test
    fun testViewDirectIteration() {
        // TODO: Why is this needed to resolve unsatisfied link errors?
        val s = AttributedStrings.polyglot

        val mixed = AttributedString.createEmpty()
        mixed.append(AttributedStrings.polyglot)
        mixed.append(AttributedString.create(" "))
        mixed.append(AttributedStrings.emojiMulti)

        var runStrings = emptyArray<String>()
        var runIndex = mixed.runs.startIndex
        while (runIndex != mixed.runs.endIndex) {
            val runSubstring = mixed.substringForRange(mixed.runs.elementAt(runIndex).range)
            runStrings += runSubstring.string
            runIndex = mixed.runs.indexAfter(runIndex)
        }
        assertArrayEquals(runStrings,
            arrayOf(
                "Hello",
                " ",
                "Olá",
                " ",
                "こんにちは",
                " ",
                "👨‍👩‍👧‍👦👍🏿🇺🇸"
            )
        )

        var characterStrings = emptyArray<String>()
        var characterIndex = mixed.characters.startIndex
        while (characterIndex != mixed.characters.endIndex) {
            val characterString = mixed.characters.elementAt(characterIndex)
            characterStrings += characterString
            characterIndex = mixed.characters.indexAfter(characterIndex)
        }
        assertArrayEquals(characterStrings,
            arrayOf(
                "H", "e", "l", "l", "o", " ",
                "O", "l", "á", " ",
                "こ", "ん", "に", "ち", "は", " ",
                "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
            )
        )

        var unicodeScalars = emptyArray<UInt>()
        var scalarIndex = mixed.unicodeScalars.startIndex
        while (scalarIndex != mixed.unicodeScalars.endIndex) {
            val characterString = mixed.unicodeScalars.elementAt(scalarIndex)
            unicodeScalars += characterString
            scalarIndex = mixed.unicodeScalars.indexAfter(scalarIndex)
        }
        assertArrayEquals(unicodeScalars.map { it.toInt() }.toIntArray(),
            arrayOf(
                72, 101, 108, 108, 111, 32,
                79, 108, 225, 32,
                12371, 12435, 12395, 12385, 12399, 32,
                128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
            ).toIntArray()
        )
    }

    @Test
    fun testViewIterators() {
        // TODO: Why is this needed to resolve unsatisfied link errors?
        val s = AttributedStrings.polyglot

        val mixed = AttributedString.createEmpty()
        mixed.append(AttributedStrings.polyglot)
        mixed.append(AttributedString.create(" "))
        mixed.append(AttributedStrings.emojiMulti)

        var runStrings = emptyArray<String>()
        for (run in mixed.runs) {
            runStrings += mixed.substringForRange(run.range).string
        }
        assertArrayEquals(runStrings,
            arrayOf(
                "Hello",
                " ",
                "Olá",
                " ",
                "こんにちは",
                " ",
                "👨‍👩‍👧‍👦👍🏿🇺🇸"
            )
        )

        var characterStrings = emptyArray<String>()
        for (character in mixed.characters) {
            characterStrings += character
        }
        assertArrayEquals(characterStrings,
            arrayOf(
                "H", "e", "l", "l", "o", " ",
                "O", "l", "á", " ",
                "こ", "ん", "に", "ち", "は", " ",
                "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
            )
        )

        var unicodeScalars = emptyArray<UInt>()
        for (unicodeScalar in mixed.unicodeScalars) {
            unicodeScalars += unicodeScalar
        }
        assertArrayEquals(unicodeScalars.map { it.toInt() }.toIntArray(),
            arrayOf(
                72, 101, 108, 108, 111, 32,
                79, 108, 225, 32,
                12371, 12435, 12395, 12385, 12399, 32,
                128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
            ).toIntArray()
        )
    }
}
