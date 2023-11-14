package com.cricut.testapi

import com.cricut.fishyjoes.runtime.AttributeContainer
import com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes
import com.cricut.fishyjoes.runtime.AttributedString
import com.cricut.fishyjoes.runtime.AttributedSubstring
import com.cricut.fishyjoes.runtime.SwiftRange
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.net.URL

internal class AttributedStringTests {
    @Test
    fun testStringValues() {
        val en = AttributeContainerFoundationAttributes().apply { languageIdentifier = "en" }.asContainer()
        val pt = AttributeContainerFoundationAttributes().apply { languageIdentifier = "pt" }.asContainer()
        val ja = AttributeContainerFoundationAttributes().apply { languageIdentifier = "ja" }.asContainer()
        val zh = AttributeContainerFoundationAttributes().apply { languageIdentifier = "zh" }.asContainer()
        val ea = AttributeContainerFoundationAttributes().apply { link = URL("https://home.unicode.org/emoji") }.asContainer()
        val ef = AttributeContainerFoundationAttributes().apply { link = URL("https://home.unicode.org/emoji/emoji-frequency") }.asContainer()

        val enAttributes = AttributeContainerFoundationAttributes(en)
        assertEquals(enAttributes.languageIdentifier, "en")
        assertNull(enAttributes.link)

        val eaAttributes = AttributeContainerFoundationAttributes(ea)
        assertNull(eaAttributes.languageIdentifier)
        assertEquals(eaAttributes.link, URL("https://home.unicode.org/emoji"))

        assertEquals(en, AttributeContainerFoundationAttributes().apply{  languageIdentifier = "en" }.asContainer())
        assertNotEquals(en, pt)
        assertNotEquals(en, ea)

//        val enea = AttributeContainer.createEmpty()
//        enea.mergeAttributes(en)
//        enea.mergeAttributes(ea)
//        val eneaAttributes = AttributeContainerFoundationAttributes.createFromContainer(enea)
//        assertEquals(eneaAttributes.languageIdentifier, "en")
//        assertEquals(eneaAttributes.link, URL("https://home.unicode.org/emoji"))

        assertEquals(AttributedStrings.simple, AttributedString("Hello", en))
        assertEquals(AttributedStrings.accent, AttributedString("Olá", pt))
        assertEquals(AttributedStrings.script, AttributedString("こんにちは", ja))
        assertEquals(AttributedStrings.chinese, AttributedString("你好", zh))
        assertEquals(AttributedStrings.chineseBMP, AttributedString("豈更車賈滑", zh))
        assertEquals(AttributedStrings.chineseSIP, AttributedString("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", zh))
        assertEquals(AttributedStrings.emoji, AttributedString("🤯🐶🍓", ea))
        assertEquals(AttributedStrings.emojiMulti, AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸", ef))
        assertEquals(AttributedStrings.polyglot,AttributedStrings.simple + " " + AttributedStrings.accent + " " + AttributedStrings.script)

        assertEquals(AttributedStrings.simple, AttributedStrings.simple)
        assertNotEquals(AttributedStrings.simple, AttributedStrings.accent)
        assertNotEquals(AttributedStrings.simple, AttributedString(AttributedStrings.simple.string, null))
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

//        var runStringsReversed = emptyList<String>()
//        var runIndexReversed = attributedString.runs.endIndex
//        while (runIndexReversed != attributedString.runs.startIndex) {
//            runIndexReversed = attributedString.runs.indexBefore(runIndexReversed)
//            val runSubstring = attributedString.substringForRange(attributedString.runs.elementAt(runIndexReversed).range)
//            runStringsReversed += runSubstring.string
//        }
//        assertEquals(runStringsReversed,
//            listOf(
//                "👨‍👩‍👧‍👦👍🏿🇺🇸",
//                " ",
//                "こんにちは",
//                " ",
//                "Olá",
//                " ",
//                "Hello",
//            )
//        )

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

//        var characterStringsReversed = emptyList<String>()
//        var characterIndexReversed = attributedString.characters.endIndex
//        while (characterIndexReversed != attributedString.characters.startIndex) {
//            characterIndexReversed = attributedString.characters.indexBefore(characterIndexReversed)
//            val characterString = attributedString.characters.elementAt(characterIndexReversed)
//            characterStringsReversed += characterString
//        }
//        assertEquals(characterStringsReversed,
//            listOf(
//                "🇺🇸", "👍🏿", "👨‍👩‍👧‍👦",
//                " ", "は", "ち", "に", "ん", "こ",
//                " ", "á", "l", "O",
//                " ", "o", "l", "l", "e", "H",
//            )
//        )

        var unicodeScalars = emptyList<UInt>()
        var scalarIndex = attributedString.unicodeScalars.startIndex
        while (scalarIndex != attributedString.unicodeScalars.endIndex) {
            val characterScalar = attributedString.unicodeScalars.elementAt(scalarIndex)
            unicodeScalars += characterScalar
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

//        var unicodeScalarsReversed = emptyList<UInt>()
//        var scalarIndexReversed = attributedString.unicodeScalars.endIndex
//        while (scalarIndexReversed != attributedString.unicodeScalars.startIndex) {
//            scalarIndexReversed = attributedString.unicodeScalars.indexBefore(scalarIndexReversed)
//            val characterScalar = attributedString.unicodeScalars.elementAt(scalarIndexReversed)
//            unicodeScalarsReversed += characterScalar
//        }
//        assertEquals(unicodeScalarsReversed.map { it.toInt() },
//            listOf(
//                127480, 127482, 127999, 128077, 128102, 8205, 128103, 8205, 128105, 8205, 128104,
//                32, 12399, 12385, 12395, 12435, 12371,
//                32, 225, 108, 79,
//                32, 111, 108, 108, 101, 72,
//            )
//        )
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
        assertEquals(substring, substring.substring)

//        val subRange = SwiftRange(
//            substring.runs.first().range.upperBound,
//            substring.runs.last().range.lowerBound
//        )
//        val subSubstring = substring[subRange]
//        assertEquals(subSubstring.string, " Olá ")
//        assertEquals(subSubstring.base.string, "Hello Olá こんにちは")
//
//        val subSubRange = SwiftRange(
//            subSubstring.unicodeScalars.indexAfter(subSubstring.startIndex),
//            subSubstring.unicodeScalars.indexBefore(subSubstring.endIndex)
//        )
//        val subSubSubstring = subSubstring[subSubRange]
//        assertEquals(subSubSubstring.string, "Olá")
//        assertEquals(subSubSubstring.base.string, "Hello Olá こんにちは")
//
//        val emptyRange = SwiftRange(
//            subSubSubstring.endIndex,
//            subSubSubstring.endIndex
//        )
//        val emptySubstring = subSubSubstring[emptyRange]
//        assertEquals(emptySubstring.string, "")
//        assertEquals(emptySubstring.base.string, "Hello Olá こんにちは")
//        assertEquals(emptySubstring, AttributedSubstring.createEmpty())
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
        attributedString.replaceSubrange(range, AttributedString(attributedString[range].string, AttributeContainer()))
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
    fun testMutabilityVariants() {
        val attributedString = AttributedStrings.polyglot
        assertEquals(attributedString.string, "Hello Olá こんにちは")

//        attributedString.append(AttributedString.create(" "))
//        assertEquals(attributedString.string, "Hello Olá こんにちは ")
//
//        attributedString.appendSubstring(attributedString[attributedString.runs.first().range])
//        assertEquals(attributedString.string, "Hello Olá こんにちは Hello")
//
//        val es = AttributeContainerFoundationAttributes().apply { languageIdentifier = "es" }.asContainer()
//        attributedString.insert(AttributedString.create("Hola", es), attributedString.runs.last().range.lowerBound)
//        assertEquals(attributedString.string, "Hello Olá こんにちは HolaHello")
//
//        val firstSpaceRange = SwiftRange(
//            attributedString.runs.first().range.upperBound,
//            attributedString.characters.indexAfter(attributedString.runs.first().range.upperBound)
//        )
//        attributedString.insertSubstring(attributedString[firstSpaceRange], attributedString.runs.last().range.lowerBound)
//        assertEquals(attributedString.string, "Hello Olá こんにちは Hola Hello")
//
//        attributedString.replaceSubrange(attributedString.runs.first().range, AttributedStrings.chinese)
//        assertEquals(attributedString.string, "你好 Olá こんにちは Hola Hello")
//
//        val emoji = AttributedStrings.emojiMulti
//        val flagRange = SwiftRange(emoji.characters.indexBefore(emoji.endIndex), emoji.endIndex)
//        attributedString.replaceSubrangeWithSubstring(attributedString.runs.last().range, emoji[flagRange])
//        assertEquals(attributedString.string, "你好 Olá こんにちは Hola 🇺🇸")
//
//        attributedString.removeSubrange(attributedString.runs.first().range)
//        assertEquals(attributedString.string, " Olá こんにちは Hola 🇺🇸")
    }

    @Test
    fun testAttributeMergeReplace() {
        val empty = AttributeContainer()
        val en = AttributeContainerFoundationAttributes().apply { languageIdentifier = "en" }.asContainer()
        val pt = AttributeContainerFoundationAttributes().apply { languageIdentifier = "pt" }.asContainer()
        val ja = AttributeContainerFoundationAttributes().apply { languageIdentifier = "ja" }.asContainer()

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

        val linkAttribute = AttributeContainerFoundationAttributes().apply { link = URL("https://www.google.com") }
        val enLink = linkAttribute.apply { languageIdentifier = "en" }.asContainer()
        attributedString.mergeAttributesForRange(runRanges[0], linkAttribute.asContainer())
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 3)
        assertEquals(attributedString[runRanges[0]], AttributedString("H", enLink).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString("ello Olá こんにち", empty).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString("は", ja).substring)

        val jaLink = linkAttribute.apply { languageIdentifier = "ja" }.asContainer()
        attributedString.replaceAttributesForRange(runRanges[0], en, ja)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 3)
        assertEquals(attributedString[runRanges[0]], AttributedString("H", jaLink).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString("ello Olá こんにち", empty).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString("は", ja).substring)

        attributedString.setAttributesForRange(attributedString.runs.first().range, empty)
        attributedString.setAttributesForRange(attributedString.runs.last().range, empty)
        assertEquals(attributedString.runs.count(), 1)
        assertEquals(attributedString, AttributedString("Hello Olá こんにちは", empty))
    }

    @Test
    fun testAttributeMergeReplaceWhole() {
        val empty = AttributeContainer.createEmpty()
        val en = AttributeContainerFoundationAttributes().apply { languageIdentifier = "en" }.asContainer()
        val pt = AttributeContainerFoundationAttributes().apply { languageIdentifier = "pt" }.asContainer()
        val ja = AttributeContainerFoundationAttributes().apply { languageIdentifier = "ja" }.asContainer()

        val attributedString = AttributedStrings.polyglot
        var runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 5)
        assertEquals(attributedString[runRanges[0]], AttributedString.create("Hello", en).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString.create(" ", empty).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString.create("Olá", pt).substring)
        assertEquals(attributedString[runRanges[3]], AttributedString.create(" ", empty).substring)
        assertEquals(attributedString[runRanges[4]], AttributedString.create("こんにちは", ja).substring)

        val uri = URL("http://www.google.com")
        val justLink = AttributeContainerFoundationAttributes().apply { link = uri }.asContainer()
        val enLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "en"; link = uri }.asContainer()
        val ptLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "pt"; link = uri }.asContainer()
        val jaLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "ja"; link = uri }.asContainer()

        attributedString.mergeAttributes(justLink)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 5)
        assertEquals(attributedString[runRanges[0]], AttributedString.create("Hello", enLink).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString.create(" ", justLink).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString.create("Olá", ptLink).substring)
        assertEquals(attributedString[runRanges[3]], AttributedString.create(" ", justLink).substring)
        assertEquals(attributedString[runRanges[4]], AttributedString.create("こんにちは", jaLink).substring)

        val otherURI = URL("http://www.bing.com")
        val otherLink = AttributeContainerFoundationAttributes().apply { link = otherURI }.asContainer()
        val enOtherLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "en"; link = otherURI }.asContainer()
        val ptOtherLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "pt"; link = otherURI }.asContainer()
        val jaOtherLink = AttributeContainerFoundationAttributes().apply { languageIdentifier = "ja"; link = otherURI }.asContainer()

        attributedString.replaceAttributes(justLink, otherLink)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 5)
        assertEquals(attributedString[runRanges[0]], AttributedString.create("Hello", enOtherLink).substring)
        assertEquals(attributedString[runRanges[1]], AttributedString.create(" ", otherLink).substring)
        assertEquals(attributedString[runRanges[2]], AttributedString.create("Olá", ptOtherLink).substring)
        assertEquals(attributedString[runRanges[3]], AttributedString.create(" ", otherLink).substring)
        assertEquals(attributedString[runRanges[4]], AttributedString.create("こんにちは", jaOtherLink).substring)

        attributedString.setAttributes(empty)
        runRanges = attributedString.runs.rangeIterator().asSequence().toList()
        assertEquals(runRanges.count(), 1)
        assertEquals(attributedString, AttributedString.create("Hello Olá こんにちは"))
    }
}
