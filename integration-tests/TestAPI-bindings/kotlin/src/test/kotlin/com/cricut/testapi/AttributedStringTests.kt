package com.cricut.testapi

import com.cricut.fishyjoes.runtime.AttributeContainer
import com.cricut.fishyjoes.runtime.AttributedString
import com.cricut.fishyjoes.runtime.SwiftRange
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class AttributedStringTests {
    @Test
    fun testStringValues() {
        assertEquals(AttributedStrings.simple, AttributedString("Hello", AttributeContainer.createWithLanguageIdentifier("en")))
        assertEquals(AttributedStrings.accent, AttributedString("Olá", AttributeContainer.createWithLanguageIdentifier("pt")))
        assertEquals(AttributedStrings.script, AttributedString("こんにちは", AttributeContainer.createWithLanguageIdentifier("ja")))
        assertEquals(AttributedStrings.chinese, AttributedString("你好", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.chineseBMP, AttributedString("豈更車賈滑", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.chineseSIP, AttributedString("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", AttributeContainer.createWithLanguageIdentifier("zh")))
        assertEquals(AttributedStrings.emoji, AttributedString("🤯🐶🍓", AttributeContainer.createWithLink("https://home.unicode.org/emoji")))
        assertEquals(AttributedStrings.emojiMulti, AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸", AttributeContainer.createWithLink("https://home.unicode.org/emoji/emoji-frequency")))
        assertEquals(AttributedStrings.polyglot,AttributedStrings.simple + " " + AttributedStrings.accent + " " + AttributedStrings.script)
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
        assertEquals(AttributedStrings.echo(AttributedStrings.polyglot), AttributedStrings.polyglot)
    }

    @Test
    fun testViewIterationOverIndices() {
        val attributedString = AttributedStrings.polyglot + " " + AttributedStrings.emojiMulti

        var runStrings = emptyList<String>()
        var runIndex = attributedString.runs.startIndex
        while (runIndex != attributedString.runs.endIndex) {
            val runSubstring = attributedString.substringForRange(attributedString.runs.elementAt(runIndex).range)
            runStrings += runSubstring.string
            runIndex = attributedString.runs.indexAfter(runIndex)
        }
        assertEquals(runStrings,
            listOf(
                "Hello",
                " ",
                "Olá",
                " ",
                "こんにちは",
                " ",
                "👨‍👩‍👧‍👦👍🏿🇺🇸"
            )
        )

        var characterStrings = emptyList<String>()
        var characterIndex = attributedString.characters.startIndex
        while (characterIndex != attributedString.characters.endIndex) {
            val characterString = attributedString.characters.elementAt(characterIndex)
            characterStrings += characterString
            characterIndex = attributedString.characters.indexAfter(characterIndex)
        }
        assertEquals(characterStrings,
            listOf(
                "H", "e", "l", "l", "o", " ",
                "O", "l", "á", " ",
                "こ", "ん", "に", "ち", "は", " ",
                "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
            )
        )

        var unicodeScalars = emptyArray<UInt>()
        var scalarIndex = attributedString.unicodeScalars.startIndex
        while (scalarIndex != attributedString.unicodeScalars.endIndex) {
            val characterString = attributedString.unicodeScalars.elementAt(scalarIndex)
            unicodeScalars += characterString
            scalarIndex = attributedString.unicodeScalars.indexAfter(scalarIndex)
        }
        assertEquals(unicodeScalars.map { it.toInt() },
            listOf(
                72, 101, 108, 108, 111, 32,
                79, 108, 225, 32,
                12371, 12435, 12395, 12385, 12399, 32,
                128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
            )
        )
    }

    @Test
    fun testViewIterators() {
        val attributedString = AttributedStrings.polyglot + " " + AttributedStrings.emojiMulti

        assertEquals(attributedString.runs.map { attributedString[it.range].string },
            listOf(
                "Hello",
                " ",
                "Olá",
                " ",
                "こんにちは",
                " ",
                "👨‍👩‍👧‍👦👍🏿🇺🇸"
            )
        )

        assertEquals(attributedString.characters.toList(),
            listOf(
                "H", "e", "l", "l", "o", " ",
                "O", "l", "á", " ",
                "こ", "ん", "に", "ち", "は", " ",
                "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
            )
        )

        assertEquals(attributedString.unicodeScalars.map { it.toInt() },
            listOf(
                72, 101, 108, 108, 111, 32,
                79, 108, 225, 32,
                12371, 12435, 12395, 12385, 12399, 32,
                128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
            )
        )
    }

    @Test
    fun testSubstring() {
        val attributedString = AttributedStrings.polyglot
        assertEquals(attributedString.string, "Hello Olá こんにちは")

        val range = SwiftRange(attributedString.characters.indexAfter(attributedString.startIndex), attributedString.characters.indexBefore(attributedString.endIndex))
        val substring = attributedString.substringForRange(range)
        assertEquals(substring.string, "ello Olá こんにち")
        assertEquals(substring.base.string, "Hello Olá こんにちは")

        val subRange = SwiftRange(substring.characters.indexAfter(substring.startIndex), substring.characters.indexBefore(substring.endIndex))
        val subSubstring = substring.substringForRange(subRange)
        assertEquals(subSubstring.string, "llo Olá こんに")
        assertEquals(subSubstring.base.string, "Hello Olá こんにちは")
    }

    @Test
    fun testMutability() {
        // Examine an existing attributed string from the test suite
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは")
        assertEquals(
            AttributedStrings.polyglot.runs.map { AttributedStrings.polyglot[it.range].string },
            listOf("Hello", " ", "Olá", " ", "こんにちは")
        )

        // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
        AttributedStrings.polyglot[SwiftRange(AttributedStrings.polyglot.startIndex, AttributedStrings.polyglot.endIndex)] = AttributedString("H")
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

        // Modify the attributed string's attributes, verify it and the reference change, but the clone and original do not
        val range = SwiftRange(attributedString.characters.indexAfter(attributedString.startIndex), attributedString.characters.indexBefore(attributedString.endIndex))
        assertEquals(
            attributedString.runs.map { attributedString[it.range].string },
            listOf("Hello", " ", "Olá", " ", "こんにちは")
        )
        attributedString.replaceSubrange(range, AttributedString(attributedString[range].string, AttributeContainer.createEmpty()))
        assertEquals(
            attributedString.runs.map { attributedString[it.range].string },
            listOf("H", "ello Olá こんにち", "は")
        )
        assertEquals(attributedString.runs.count(), 3)
        assertEquals(attributedStringReference.runs.count(), 3)
        assertEquals(attributedStringClone.runs.count(), 5) // Unchanged
        assertEquals(AttributedStrings.polyglot.runs.count(), 5) // Unchanged

        // Modify the attributed string's string data, verify it and the reference change, but the clone and original do not
        attributedString.replaceSubrange(range, AttributedString("i18n"))
        assertEquals(
            attributedString.runs.map { attributedString[it.range].string },
            listOf("H", "i18n", "は")
        )
        assertEquals(attributedString.string, "Hi18nは")
        assertEquals(attributedStringReference.string, "Hi18nは")
        assertEquals(attributedStringClone.string, "Hello Olá こんにちは") // Unchanged
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは") // Unchanged

        // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the attributed string, reference, and original do not
        attributedStringClone.insert(AttributedString("clone", attributedStringClone.runs.first().attributes), attributedStringClone.startIndex)
        attributedStringClone.insert(AttributedString("enolc"), attributedStringClone.endIndex)
        assertEquals(
            attributedStringClone.runs.map { attributedStringClone[it.range].string },
            listOf("cloneHello", " ", "Olá", " ", "こんにちは", "enolc")
        )
        assertEquals(attributedString.string, "Hi18nは") // Unchanged
        assertEquals(attributedStringReference.string, "Hi18nは") // Unchanged
        assertEquals(attributedStringClone.string, "cloneHello Olá こんにちはenolc")
        assertEquals(AttributedStrings.polyglot.string, "Hello Olá こんにちは") // Unchanged
    }

    @Test
    fun testAttributeMergeReplace() {
        val empty = AttributeContainer.createEmpty()
        val en = AttributeContainer.createWithLanguageIdentifier("en")
        val pt = AttributeContainer.createWithLanguageIdentifier("pt")
        val ja = AttributeContainer.createWithLanguageIdentifier("ja")

        val attributedString = AttributedStrings.polyglot
        var runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 5)
        assertEquals(attributedString[runRanges[0]], AttributedString("Hello", en).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString(" ", empty).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString("Olá", pt).substring)
        assertEquals(attributedString[runRanges[3]], AttributedString(" ", empty).substring)
        assertEquals(attributedString[runRanges[4]], AttributedString("こんにちは", ja).substring)

        attributedString[runRanges[1]] = AttributedString(attributedString[runRanges[1]].string, attributedString.runs[runRanges[0].lowerBound].attributes)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 4)
        assertEquals(attributedString[runRanges[0]], AttributedString("Hello ", en).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString("Olá", pt).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString(" ", empty).substring)
        assertEquals(attributedString[runRanges[3]], AttributedString("こんにちは", ja).substring)

        attributedString.setAttributesForRange(runRanges[2], attributedString.runs[runRanges[1].lowerBound].attributes)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 3)
        assertEquals(attributedString[runRanges[0]], AttributedString("Hello ", en).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString("Olá ", pt).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString("こんにちは", ja).substring)

        val mangleStartIndex = attributedString.characters.indexAfter(attributedString.startIndex)
        val mangleEndIndex = attributedString.characters.indexBefore(attributedString.endIndex)
        val mangleRange = SwiftRange(mangleStartIndex, mangleEndIndex)
        attributedString.setAttributesForRange(mangleRange, empty)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 3)
        assertEquals(attributedString[runRanges[0]], AttributedString("H", en).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString("ello Olá こんにち", empty).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString("は", ja).substring)

        attributedString.setAttributesForRange(attributedString.runs.first().range, empty)
        attributedString.setAttributesForRange(attributedString.runs.last().range, empty)
        assertEquals(attributedString.runs.count(), 1)
        assertEquals(attributedString, AttributedString("Hello Olá こんにちは", empty))
    }
}
