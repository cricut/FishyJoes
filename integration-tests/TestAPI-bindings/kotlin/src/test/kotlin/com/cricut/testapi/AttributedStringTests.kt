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
    fun testViewDirectIteration() {
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

    @Test
    fun testMutability() {
        // Examine an existing attributed string from the test suite
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは")
        assertArrayEquals(
            AttributedStrings.polyglot.runs.map { AttributedStrings.polyglot.substringForRange(it.range).string }.toTypedArray(),
            arrayOf("Hello", " ", "Olá", " ", "こんにちは")
        )

        // Attempt to modify the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
        AttributedStrings.polyglot.replaceSubrange(SwiftRange(AttributedStrings.polyglot.startIndex, AttributedStrings.polyglot.endIndex), AttributedString.create("H"))
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは")

        // Name the test suite attributed string in a value, creating a clone of it (Swift-to-Java copies the field, which is declared as a 'let' and is immutable)
        val attributedString = AttributedStrings.polyglot
        assertEquals(attributedString.string, "Hello Olá こんにちは")

        // Reference the attributed string, which acts as a reference type like a typical Kotlin object, mirroring changes to the referenced attributed string
        val attributedStringReference = attributedString
        assertEquals(attributedStringReference.string, "Hello Olá こんにちは")

        // Clone the attributed string, making a copy of its string data and attributes
        val attributedStringClone = attributedString.clone()
        assertEquals(attributedStringClone.string, "Hello Olá こんにちは")

        // Obtain a substring of the attributed string
        val range = SwiftRange(attributedString.characters.indexAfter(attributedString.startIndex), attributedString.characters.indexBefore(attributedString.endIndex))
        val substring = attributedString.substringForRange(range)
        assertEquals(substring.string, "ello Olá こんにち")
        assertEquals(substring.base.string, "Hello Olá こんにちは")

        // Modify the substring's attributes and verify they change, its base string's attributes change, but the attributed string, reference, clone, and original do not
        assertEquals(substring.runs.count(), 5)
        assertEquals(substring.base.runs.count(), 5)
        assertEquals(attributedString.runs.count(), 5)
        assertEquals(attributedStringReference.runs.count(), 5)
        assertEquals(attributedStringClone.runs.count(), 5)
        assertEquals(AttributedStrings.polyglot.runs.count(), 5)
        substring.setAttributes(AttributeContainer.createEmpty())
        assertEquals(substring.runs.first().attributes, AttributeContainer.createEmpty())
        assertEquals(substring.runs.count(), 1)
        assertEquals(substring.base.runs.count(), 3)
        assertEquals(attributedString.runs.count(), 5) // Unchanged
        assertEquals(attributedStringReference.runs.count(), 5) // Unchanged
        assertEquals(attributedStringClone.runs.count(), 5) // Unchanged
        assertEquals(AttributedStrings.polyglot.runs.count(), 5) // Unchanged

        // Modify the attributed string's attributes, verify it and the reference change, but the substring, clone, and original do not
        assertArrayEquals(
            attributedString.runs.map { attributedString.substringForRange(it.range).string }.toTypedArray(),
            arrayOf("Hello", " ", "Olá", " ", "こんにちは")
        )
        attributedString.replaceSubrange(range, AttributedString.create(attributedString.substringForRange(range).string, AttributeContainer.createEmpty()))
        assertArrayEquals(
            attributedString.runs.map { attributedString.substringForRange(it.range).string }.toTypedArray(),
            arrayOf("H", "ello Olá こんにち", "は")
        )
        assertEquals(substring.runs.count(), 1) // Unchanged
        assertEquals(substring.base.runs.count(), 3) // Unchanged
        assertEquals(attributedString.runs.count(), 3)
        assertEquals(attributedStringReference.runs.count(), 3)
        assertEquals(attributedStringClone.runs.count(), 5) // Unchanged
        assertEquals(AttributedStrings.polyglot.runs.count(), 5) // Unchanged

        // Modify the attributed string's string data, verify it and the reference change, but the substring, clone, and original do not
        attributedString.replaceSubrange(range, AttributedString.create("i18n"))
        assertArrayEquals(
            attributedString.runs.map { attributedString.substringForRange(it.range).string }.toTypedArray(),
            arrayOf("H", "i18n", "は")
        )
        assertEquals(substring.base.string, "Hello Olá こんにちは") // Unchanged
        assertEquals(substring.string, "ello Olá こんにち") // Unchanged
        assertEquals(attributedString.string, "Hi18nは")
        assertEquals(attributedStringReference.string, "Hi18nは")
        assertEquals(attributedStringClone.string, "Hello Olá こんにちは") // Unchanged
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは") // Unchanged

        // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the substring, attributed string, reference, and original do not
        attributedStringClone.insert(AttributedString.create("clone", attributedStringClone.runs.first().attributes), attributedStringClone.startIndex)
        attributedStringClone.insert(AttributedString.create("enolc"), attributedStringClone.endIndex)
        assertArrayEquals(
            attributedStringClone.runs.map { attributedStringClone.substringForRange(it.range).string }.toTypedArray(),
            arrayOf("cloneHello", " ", "Olá", " ", "こんにちは", "enolc")
        )
        assertEquals(substring.base.string, "Hello Olá こんにちは") // Unchanged
        assertEquals(substring.string, "ello Olá こんにち") // Unchanged
        assertEquals(attributedString.string, "Hi18nは") // Unchanged
        assertEquals(attributedStringReference.string, "Hi18nは") // Unchanged
        assertEquals(attributedStringClone.string, "cloneHello Olá こんにちはenolc")
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは") // Unchanged
    }
}
