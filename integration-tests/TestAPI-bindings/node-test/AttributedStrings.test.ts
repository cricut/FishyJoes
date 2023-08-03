import { Runtime, TestAPI } from 'TestAPI';
const AttributeContainer = Runtime.AttributeContainer
const AttributedString = Runtime.AttributedString

test('StringValues', () => {
    let enAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    enAttributes.languageIdentifier = "en"
    let en = enAttributes.asContainer()
    let ptAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    ptAttributes.languageIdentifier = "pt"
    let pt = ptAttributes.asContainer()
    let jaAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    jaAttributes.languageIdentifier = "ja"
    let ja = jaAttributes.asContainer()
    let zhAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    zhAttributes.languageIdentifier = "zh"
    let zh = zhAttributes.asContainer()
    let eaAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    eaAttributes.link = new URL("https://home.unicode.org/emoji")
    let ea = eaAttributes.asContainer()
    let efAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    efAttributes.link = new URL("https://home.unicode.org/emoji/emoji-frequency")
    let ef = efAttributes.asContainer()
    
    expect(enAttributes.asContainer().equals(enAttributes.asContainer()))
    expect(!enAttributes.asContainer().equals(ptAttributes.asContainer()))

    expect(enAttributes.languageIdentifier).toEqual("en")
    expect(enAttributes.link).toBeUndefined

    expect(eaAttributes.languageIdentifier).toBeUndefined
    expect(eaAttributes.link).toEqual(new URL("https://home.unicode.org/emoji"))
    
    expect(TestAPI.AttributedStrings.simple.equals(AttributedString.create("Hello", { attributes: en })))
    expect(TestAPI.AttributedStrings.accent.equals(AttributedString.create("Olá", { attributes: pt })))
    expect(TestAPI.AttributedStrings.script.equals(AttributedString.create("こんにちは", { attributes: ja })))
    expect(TestAPI.AttributedStrings.chinese.equals(AttributedString.create("你好", { attributes: zh })))
    expect(TestAPI.AttributedStrings.chineseBMP.equals(AttributedString.create("豈更車賈滑", { attributes: zh })))
    expect(TestAPI.AttributedStrings.chineseSIP.equals(AttributedString.create("\u{20001}\u{20002}\u{20003}\u{20004}", { attributes: zh })))
    expect(TestAPI.AttributedStrings.emoji.equals(AttributedString.create("🤯🐶🍓", { attributes: ea })))
    expect(TestAPI.AttributedStrings.emojiMulti.equals(AttributedString.create("👨‍👩‍👧‍👦👍🏿🇺🇸", { attributes: ef })))
    let polyglot = AttributedString.createEmpty()
    polyglot.append(TestAPI.AttributedStrings.simple)
    polyglot.append(AttributedString.create(" "))
    polyglot.append(TestAPI.AttributedStrings.accent)
    polyglot.append(AttributedString.create(" "))
    polyglot.append(TestAPI.AttributedStrings.script)
    expect(TestAPI.AttributedStrings.polyglot.equals(polyglot))

    expect(TestAPI.AttributedStrings.simple.equals(TestAPI.AttributedStrings.simple))
    expect(!TestAPI.AttributedStrings.simple.equals(TestAPI.AttributedStrings.accent.runs))
    expect(!TestAPI.AttributedStrings.simple.equals(AttributedString.create(TestAPI.AttributedStrings.simple.string, { attributes: undefined })))
})

test('StringEcho', () => {
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.simple)).toEqual(TestAPI.AttributedStrings.simple)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.accent)).toEqual(TestAPI.AttributedStrings.accent)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.chinese)).toEqual(TestAPI.AttributedStrings.chinese)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.chineseBMP)).toEqual(TestAPI.AttributedStrings.chineseBMP)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.chineseSIP)).toEqual(TestAPI.AttributedStrings.chineseSIP)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.emoji)).toEqual(TestAPI.AttributedStrings.emoji)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.emojiMulti)).toEqual(TestAPI.AttributedStrings.emojiMulti)
    expect(TestAPI.AttributedStrings.echo(TestAPI.AttributedStrings.polyglot)).toEqual(TestAPI.AttributedStrings.polyglot)
})

/*
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

        assertEquals(AttributedStrings.simple, AttributedString("Hello", en))
        assertEquals(AttributedStrings.accent, AttributedString("Olá", pt))
        assertEquals(AttributedStrings.script, AttributedString("こんにちは", ja))
        assertEquals(AttributedStrings.chinese, AttributedString("你好", zh))
        assertEquals(AttributedStrings.chineseBMP, AttributedString("豈更車賈滑", zh))
        assertEquals(AttributedStrings.chineseSIP, AttributedString("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", zh))
        assertEquals(AttributedStrings.emoji, AttributedString("🤯🐶🍓", ea))
        assertEquals(AttributedStrings.emojiMulti, AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸", ef))
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

        var unicodeScalars = emptyList<UInt>()
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
}
*/