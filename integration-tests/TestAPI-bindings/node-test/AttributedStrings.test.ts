import { Runtime, TestAPI } from 'TestAPI';
const AttributeContainer = Runtime.AttributeContainer
const AttributedString = Runtime.AttributedString
const AttributedStrings = TestAPI.AttributedStrings

test('StringValues', () => {
    const enAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    enAttributes.languageIdentifier = "en"
    const en = enAttributes.asContainer()
    const ptAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    ptAttributes.languageIdentifier = "pt"
    const pt = ptAttributes.asContainer()
    const jaAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    jaAttributes.languageIdentifier = "ja"
    const ja = jaAttributes.asContainer()
    const zhAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    zhAttributes.languageIdentifier = "zh"
    const zh = zhAttributes.asContainer()
    const eaAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    eaAttributes.link = new URL("https://home.unicode.org/emoji")
    const ea = eaAttributes.asContainer()
    const efAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    efAttributes.link = new URL("https://home.unicode.org/emoji/emoji-frequency")
    const ef = efAttributes.asContainer()
    
    expect(enAttributes.asContainer().equals(enAttributes.asContainer()))
    expect(!enAttributes.asContainer().equals(ptAttributes.asContainer()))

    expect(enAttributes.languageIdentifier).toEqual("en")
    expect(enAttributes.link).toBeUndefined

    expect(eaAttributes.languageIdentifier).toBeUndefined
    expect(eaAttributes.link).toEqual(new URL("https://home.unicode.org/emoji"))
    
    expect(AttributedStrings.simple.equals(AttributedString.create("Hello", { attributes: en })))
    expect(AttributedStrings.accent.equals(AttributedString.create("Olá", { attributes: pt })))
    expect(AttributedStrings.script.equals(AttributedString.create("こんにちは", { attributes: ja })))
    expect(AttributedStrings.chinese.equals(AttributedString.create("你好", { attributes: zh })))
    expect(AttributedStrings.chineseBMP.equals(AttributedString.create("豈更車賈滑", { attributes: zh })))
    expect(AttributedStrings.chineseSIP.equals(AttributedString.create("\u{20001}\u{20002}\u{20003}\u{20004}", { attributes: zh })))
    expect(AttributedStrings.emoji.equals(AttributedString.create("🤯🐶🍓", { attributes: ea })))
    expect(AttributedStrings.emojiMulti.equals(AttributedString.create("👨‍👩‍👧‍👦👍🏿🇺🇸", { attributes: ef })))
    const polyglot = AttributedString.createEmpty()
    polyglot.append(AttributedStrings.simple)
    polyglot.append(AttributedString.create(" "))
    polyglot.append(AttributedStrings.accent)
    polyglot.append(AttributedString.create(" "))
    polyglot.append(AttributedStrings.script)
    expect(AttributedStrings.polyglot.equals(polyglot))

    expect(AttributedStrings.simple.equals(AttributedStrings.simple))
    expect(!AttributedStrings.simple.equals(AttributedStrings.accent.runs))
    expect(!AttributedStrings.simple.equals(AttributedString.create(AttributedStrings.simple.string, { attributes: undefined })))
})

test('StringEcho', () => {
    expect(AttributedStrings.echo(AttributedStrings.simple)).toEqual(AttributedStrings.simple)
    expect(AttributedStrings.echo(AttributedStrings.accent)).toEqual(AttributedStrings.accent)
    expect(AttributedStrings.echo(AttributedStrings.chinese)).toEqual(AttributedStrings.chinese)
    expect(AttributedStrings.echo(AttributedStrings.chineseBMP)).toEqual(AttributedStrings.chineseBMP)
    expect(AttributedStrings.echo(AttributedStrings.chineseSIP)).toEqual(AttributedStrings.chineseSIP)
    expect(AttributedStrings.echo(AttributedStrings.emoji)).toEqual(AttributedStrings.emoji)
    expect(AttributedStrings.echo(AttributedStrings.emojiMulti)).toEqual(AttributedStrings.emojiMulti)
    expect(AttributedStrings.echo(AttributedStrings.polyglot)).toEqual(AttributedStrings.polyglot)
})

test('ViewIterationOverIndices', () => {
    const attributedString = AttributedString.createEmpty()
    attributedString.append(AttributedStrings.polyglot)
    attributedString.append(AttributedString.create(" "))
    attributedString.append(AttributedStrings.emojiMulti)
    
    const runStrings: string[] = []
    let runIndex = attributedString.runs.startIndex
    while (!runIndex.equals(attributedString.runs.endIndex)) {
        const runSubstring = attributedString.substringForRange(attributedString.runs.elementAt(runIndex).range)
        runStrings.push(runSubstring.string)
        runIndex = attributedString.runs.indexAfter(runIndex)
    }
    expect(runStrings).toEqual(
        [
            "Hello",
            " ",
            "Olá",
            " ",
            "こんにちは",
            " ",
            "👨‍👩‍👧‍👦👍🏿🇺🇸"
        ]
    )

    const characterStrings: string[] = []
    let characterIndex = attributedString.characters.startIndex
    while (!characterIndex.equals(attributedString.characters.endIndex)) {
        const characterString = attributedString.characters.elementAt(characterIndex)
        characterStrings.push(characterString)
        characterIndex = attributedString.characters.indexAfter(characterIndex)
    }
    expect(characterStrings).toEqual(
        [
            "H", "e", "l", "l", "o", " ",
            "O", "l", "á", " ",
            "こ", "ん", "に", "ち", "は", " ",
            "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
        ]
    )

    const unicodeScalars: number[] = []
    let scalarIndex = attributedString.unicodeScalars.startIndex
    while (!scalarIndex.equals(attributedString.unicodeScalars.endIndex)) {
        const characterScalar = attributedString.unicodeScalars.elementAt(scalarIndex)
        unicodeScalars.push(characterScalar)
        scalarIndex = attributedString.unicodeScalars.indexAfter(scalarIndex)
    }
    expect(unicodeScalars).toEqual(
        [
            72, 101, 108, 108, 111, 32,
            79, 108, 225, 32,
            12371, 12435, 12395, 12385, 12399, 32,
            128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
        ]
    )
})

test('ViewIterators', () => {
    const attributedString = AttributedString.createEmpty()
    attributedString.append(AttributedStrings.polyglot)
    attributedString.append(AttributedString.create(" "))
    attributedString.append(AttributedStrings.emojiMulti)
    
    expect([...attributedString.runs].map((it) => attributedString.substringForRange(it.range).string)).toEqual(
        [
            "Hello",
            " ",
            "Olá",
            " ",
            "こんにちは",
            " ",
            "👨‍👩‍👧‍👦👍🏿🇺🇸"
        ]
    )

    expect([...attributedString.characters]).toEqual(
        [
            "H", "e", "l", "l", "o", " ",
            "O", "l", "á", " ",
            "こ", "ん", "に", "ち", "は", " ",
            "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
        ]
    )

    expect([...attributedString.unicodeScalars]).toEqual(
        [
            72, 101, 108, 108, 111, 32,
            79, 108, 225, 32,
            12371, 12435, 12395, 12385, 12399, 32,
            128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
        ]
    )
})

test('Substring', () => {
    const attributedString = AttributedString.createEmpty()
    attributedString.append(AttributedStrings.polyglot)
    
    expect(attributedString.string).toEqual("Hello Olá こんにちは")

    const range = { 
        lowerBound: attributedString.characters.indexAfter(attributedString.startIndex), 
        upperBoundExclusive: attributedString.characters.indexBefore(attributedString.endIndex)
    }
    const substring = attributedString.substringForRange(range)
    expect(substring.string).toEqual("ello Olá こんにち")
    expect(substring.base.string).toEqual("Hello Olá こんにちは")

    const subRange = {
        lowerBound: substring.characters.indexAfter(substring.startIndex), 
        upperBoundExclusive: substring.characters.indexBefore(substring.endIndex)
    }
    const subSubstring = substring.substringForRange(subRange)
    expect(subSubstring.string).toEqual("llo Olá こんに")
    expect(subSubstring.base.string).toEqual("Hello Olá こんにちは")
})
/*
test('Mutability', () => {
    // Examine an existing attributed string from the test suite
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは")
    expect([...AttributedStrings.polyglot.runs].map((it) => { AttributedStrings.polyglot.substringForRange(it.range).string }))
        .toEqual(["Hello", " ", "Olá", " ", "こんにちは"])

    // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
    AttributedStrings.polyglot.replaceSubrange(
        { lowerBound: AttributedStrings.polyglot.startIndex, upperBoundExclusive: AttributedStrings.polyglot.endIndex },
        AttributedString.create("H")
    )
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは")

    // Name the test suite attributed string in a value, creating a clone of it (Swift-to-Java copies the field, which is declared as a 'let' and is immutable)
    const attributedString = AttributedStrings.polyglot
    expect(attributedString.string).toEqual("Hello Olá こんにちは")

    // Reference the attributed string, which acts as a reference type like a typical Kotlin object, mirroring changes to the referenced attributed string
    const attributedStringReference = attributedString
    expect(attributedStringReference.string).toEqual("Hello Olá こんにちは")

    // Clone the attributed string, making a copy of its string data and attributes
    const attributedStringClone = AttributedString.createFromSubstring(attributedString.substring)
    expect(attributedStringClone.string).toEqual("Hello Olá こんにちは")

    // Modify the attributed string's attributes, verify it and the reference change, but the clone and original do not
    const range = { 
        lowerBound: attributedString.characters.indexAfter(attributedString.startIndex), 
        upperBoundExclusive: attributedString.characters.indexBefore(attributedString.endIndex)
    }
    expect([...attributedString.runs].map((it) => attributedString.substringForRange(it.range).string))
        .toEqual(["Hello", " ", "Olá", " ", "こんにちは"])
    
    attributedString.replaceSubrange(range, AttributedString.create(attributedString.substringForRange(range).string, { attributes: AttributeContainer.createEmpty() }))
    expect([...attributedString.runs].map((it) => attributedString.substringForRange(it.range).string))
        .toEqual(["H", "ello Olá こんにち", "は"])
    
    expect([...attributedString.runs].length).toEqual(3)
    expect([...attributedStringReference.runs].length).toEqual(3)
    expect([...attributedStringClone.runs].length).toEqual(5) // Unchanged
    expect([...AttributedStrings.polyglot.runs].length).toEqual(5) // Unchanged

    // Modify the attributed string's string data, verify it and the reference change, but the clone and original do not
    attributedString.replaceSubrange(range, AttributedString.create("i18n"))
    expect([...attributedString.runs].map((it) => attributedString.substringForRange(it.range).string))
        .toEqual(["H", "i18n", "は"])
    
    expect(attributedString.string).toEqual("Hi18nは")
    expect(attributedStringReference.string).toEqual("Hi18nは")
    expect(attributedStringClone.string).toEqual("Hello Olá こんにちは") // Unchanged
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは") // Unchanged

    // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the attributed string, reference, and original do not
    attributedStringClone.insert(AttributedString.create("clone", { attributes: attributedStringClone.runs.elementAt(attributedStringClone.runs.startIndex).attributes }), attributedStringClone.startIndex)
    attributedStringClone.insert(AttributedString.create("enolc"), attributedStringClone.endIndex)
    expect([...attributedStringClone.runs].map((it) => attributedStringClone.substringForRange(it.range).string))
        .toEqual(["cloneHello", " ", "Olá", " ", "こんにちは", "enolc"])
    
    expect(attributedString.string).toEqual("Hi18nは") // Unchanged
    expect(attributedStringReference.string).toEqual("Hi18nは") // Unchanged
    expect(attributedStringClone.string).toEqual("cloneHello Olá こんにちはenolc")
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは") // Unchanged
})
*/
test('AttributeMergeReplace', () => {
    const empty = AttributeContainer.createEmpty()
    const enAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    enAttributes.languageIdentifier = "en"
    const en = enAttributes.asContainer()
    const ptAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    ptAttributes.languageIdentifier = "pt"
    const pt = ptAttributes.asContainer()
    const jaAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    jaAttributes.languageIdentifier = "ja"
    const ja = jaAttributes.asContainer()
    
    const attributedString = AttributedStrings.polyglot
    let runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(5)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("Olá", { attributes: pt }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[4]).equals(AttributedString.create("こんにちは", { attributes: ja}).substring))

    attributedString.replaceSubrange(runRanges[1], AttributedString.create(attributedString.substringForRange(runRanges[1]).string, { attributes: attributedString.runs.elementAtPosition(runRanges[0].lowerBound).attributes }))
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(4)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello ", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("Olá", { attributes: pt }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create("こんにちは", { attributes: ja }).substring))

    attributedString.setAttributesForRange(runRanges[2], attributedString.runs.elementAtPosition(runRanges[1].lowerBound).attributes)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(3)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello ", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("Olá ", { attributes: pt }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("こんにちは", { attributes: ja }).substring))

    const mangleStartIndex = attributedString.characters.indexAfter(attributedString.startIndex)
    const mangleEndIndex = attributedString.characters.indexBefore(attributedString.endIndex)
    const mangleRange = { lowerBound: mangleStartIndex, upperBoundExclusive: mangleEndIndex }
    attributedString.setAttributesForRange(mangleRange, empty)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(3)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("H", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("ello Olá こんにち", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("は", { attributes: ja }).substring))

    const linkAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    linkAttributes.link = new URL("https://www.google.com")
    const enLinkAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    enLinkAttributes.link = linkAttributes.link
    enLinkAttributes.languageIdentifier = "en"
    const enLink = enLinkAttributes.asContainer()
    attributedString.mergeAttributesForRange(runRanges[0], linkAttributes.asContainer())
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(3)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("H", { attributes: enLink }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("ello Olá こんにち", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("は", { attributes: ja }).substring))

    const jaLinkAttributes = AttributeContainer.FoundationAttributes.createEmpty()
    jaLinkAttributes.link = linkAttributes.link
    jaLinkAttributes.languageIdentifier = "ja"
    const jaLink = jaLinkAttributes.asContainer()
    attributedString.replaceAttributesForRange(runRanges[0], en, ja)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(3)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("H", { attributes: jaLink }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("ello Olá こんにち", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("は", { attributes: ja }).substring))

    attributedString.setAttributesForRange(attributedString.runs.elementAt(attributedString.runs.startIndex).range, empty)
    attributedString.setAttributesForRange(attributedString.runs.elementAt(attributedString.runs.indexBefore(attributedString.runs.endIndex)).range, empty)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(1)
    expect(attributedString.equals(AttributedString.create("Hello Olá こんにちは", { attributes: empty })))
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