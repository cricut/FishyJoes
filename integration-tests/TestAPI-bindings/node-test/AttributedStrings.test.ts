import { Runtime, TestAPI } from 'TestAPI';
const AttributeContainer = Runtime.AttributeContainer
const AttributedString = Runtime.AttributedString
const AttributedSubstring = Runtime.AttributedSubstring
const AttributedStrings = TestAPI.AttributedStrings

test('StringValues', () => {
    const en = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en"}).asContainer()
    const pt = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt"}).asContainer()
    const ja = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "ja"}).asContainer()
    const zh = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "zh"}).asContainer()
    const ea = AttributeContainer.FoundationAttributes.create({ link: new URL("https://home.unicode.org/emoji")}).asContainer()
    const ef = AttributeContainer.FoundationAttributes.create({ link: new URL("https://home.unicode.org/emoji/emoji-frequency")}).asContainer()
    
    expect(en.equals(AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en"}).asContainer()))
    expect(!en.equals(AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt"}).asContainer()))
    
    const enAttributes = AttributeContainer.FoundationAttributes.createFromContainer(en)
    expect(enAttributes.languageIdentifier).toEqual("en")
    expect(enAttributes.link).toBeUndefined()

    const eaAttributes = AttributeContainer.FoundationAttributes.createFromContainer(ea)
    expect(eaAttributes.languageIdentifier).toBeUndefined()
    expect(eaAttributes.link).toEqual(new URL("https://home.unicode.org/emoji"))

    expect(en.equals(AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en" }).asContainer()))
    expect(!en.equals(pt))
    expect(!en.equals(ea))

    const enea = AttributeContainer.createEmpty()
    enea.merge(en)
    enea.merge(ea)
    const eneaAttributes = AttributeContainer.FoundationAttributes.createFromContainer(enea)
    expect("en").toEqual(eneaAttributes.languageIdentifier)
    expect(new URL("https://home.unicode.org/emoji")).toEqual(eneaAttributes.link)
    
    expect(AttributedStrings.simple.equals(AttributedString.create("Hello", { attributes: en })))
    expect(AttributedStrings.accent.equals(AttributedString.create("Olá", { attributes: pt })))
    expect(AttributedStrings.script.equals(AttributedString.create("こんにちは", { attributes: ja })))
    expect(AttributedStrings.chinese.equals(AttributedString.create("你好", { attributes: zh })))
    expect(AttributedStrings.chineseBMP.equals(AttributedString.create("豈更車賈滑", { attributes: zh })))
    expect(AttributedStrings.chineseSIP.equals(AttributedString.create("\u{20001}\u{20002}\u{20003}\u{20004}", { attributes: zh })))
    expect(AttributedStrings.emoji.equals(AttributedString.create("🤯🐶🍓", { attributes: ea })))
    expect(AttributedStrings.emojiMulti.equals(AttributedString.create("👨‍👩‍👧‍👦👍🏿🇺🇸", { attributes: ef })))
    const polyglot = AttributedString.createJoining([
        AttributedStrings.simple,
        AttributedString.create(" "),
        AttributedStrings.accent,
        AttributedString.create(" "),
        AttributedStrings.script
    ])
    expect(AttributedStrings.polyglot.equals(polyglot))

    expect(AttributedStrings.simple.equals(AttributedStrings.simple))
    expect(!AttributedStrings.simple.equals(AttributedStrings.accent))
    expect(!AttributedStrings.simple.equals(AttributedString.create(AttributedStrings.simple.string, { attributes: undefined })))
})

test('StringEcho', () => {
    expect(AttributedStrings.echo(AttributedStrings.simple).equals(AttributedStrings.simple))
    expect(AttributedStrings.echo(AttributedStrings.accent).equals(AttributedStrings.accent))
    expect(AttributedStrings.echo(AttributedStrings.chinese).equals(AttributedStrings.chinese))
    expect(AttributedStrings.echo(AttributedStrings.chineseBMP).equals(AttributedStrings.chineseBMP))
    expect(AttributedStrings.echo(AttributedStrings.chineseSIP).equals(AttributedStrings.chineseSIP))
    expect(AttributedStrings.echo(AttributedStrings.emoji).equals(AttributedStrings.emoji))
    expect(AttributedStrings.echo(AttributedStrings.emojiMulti).equals(AttributedStrings.emojiMulti))
    expect(AttributedStrings.echo(AttributedStrings.polyglot).equals(AttributedStrings.polyglot))
})

test('ViewIterationOverIndices', () => {
    const attributedString = AttributedString.createJoining([
        AttributedStrings.polyglot,
        AttributedString.create(" "),
        AttributedStrings.emojiMulti
    ])

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

    const runStringsReversed: string[] = []
    let runIndexReversed = attributedString.runs.endIndex
    while (!runIndexReversed.equals(attributedString.runs.startIndex)) {
        runIndexReversed = attributedString.runs.indexBefore(runIndexReversed)
        const runSubstring = attributedString.substringForRange(attributedString.runs.elementAt(runIndexReversed).range)
        runStringsReversed.push(runSubstring.string)
    }
    expect(runStringsReversed).toEqual(
        [
            "👨‍👩‍👧‍👦👍🏿🇺🇸",
            " ",
            "こんにちは",
            " ",
            "Olá",
            " ",
            "Hello",
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

    const characterStringsReversed: string[] = []
    let characterIndexReversed = attributedString.characters.endIndex
    while (!characterIndexReversed.equals(attributedString.characters.startIndex)) {
        characterIndexReversed = attributedString.characters.indexBefore(characterIndexReversed)
        const characterString = attributedString.characters.elementAt(characterIndexReversed)
        characterStringsReversed.push(characterString)
    }
    expect(characterStringsReversed).toEqual(
        [
            "🇺🇸", "👍🏿", "👨‍👩‍👧‍👦",
            " ", "は", "ち", "に", "ん", "こ",
            " ", "á", "l", "O",
            " ", "o", "l", "l", "e", "H",
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

    const unicodeScalarsReversed: number[] = []
    let scalarIndexReversed = attributedString.unicodeScalars.endIndex
    while (!scalarIndexReversed.equals(attributedString.unicodeScalars.startIndex)) {
        scalarIndexReversed = attributedString.unicodeScalars.indexBefore(scalarIndexReversed)
        const characterScalar = attributedString.unicodeScalars.elementAt(scalarIndexReversed)
        unicodeScalarsReversed.push(characterScalar)
    }
    expect(unicodeScalarsReversed).toEqual(
        [
            127480, 127482, 127999, 128077, 128102, 8205, 128103, 8205, 128105, 8205, 128104, 
            32, 12399, 12385, 12395, 12435, 12371, 
            32, 225, 108, 79,
            32, 111, 108, 108, 101, 72,
        ]
    )
})

test('ViewIterators', () => {
    const attributedString = AttributedString.createJoining([
        AttributedStrings.polyglot,
        AttributedString.create(" "),
        AttributedStrings.emojiMulti
    ])

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
    const attributedString = AttributedStrings.polyglot
    expect(attributedString.string).toEqual("Hello Olá こんにちは")

    const range = { 
        lowerBound: attributedString.characters.indexAfter(attributedString.startIndex), 
        upperBoundExclusive: attributedString.characters.indexBefore(attributedString.endIndex)
    }
    const substring = attributedString.substringForRange(range)
    expect(substring.string).toEqual("ello Olá こんにち")
    expect(substring.base.string).toEqual("Hello Olá こんにちは")
    expect(substring.substring.equals(substring))

    const subRange = {
        lowerBound: [...substring.runs][0].range.upperBoundExclusive, 
        upperBoundExclusive: [...substring.runs].slice(-1)[0].range.lowerBound
    }
    const subSubstring = substring.substringForRange(subRange)
    expect(subSubstring.string).toEqual(" Olá ")
    expect(subSubstring.base.string).toEqual("Hello Olá こんにちは")

    const subSubRange = {
        lowerBound: subSubstring.unicodeScalars.indexAfter(subSubstring.startIndex), 
        upperBoundExclusive: subSubstring.unicodeScalars.indexBefore(subSubstring.endIndex)
    }
    const subSubSubstring = subSubstring.substringForRange(subSubRange)
    expect(subSubSubstring.string).toEqual("Olá")
    expect(subSubSubstring.base.string).toEqual("Hello Olá こんにちは")

    const emptyRange = {
        lowerBound: subSubSubstring.endIndex,
        upperBoundExclusive: subSubSubstring.endIndex
    }
    const emptySubstring = subSubSubstring.substringForRange(emptyRange)
    expect(emptySubstring.string).toEqual("")
    expect(emptySubstring.base.string).toEqual("Hello Olá こんにちは")
    expect(emptySubstring.equals(AttributedSubstring.createEmpty()))
})

test('Mutability', () => {
    // Examine an existing attributed string from the test suite
    // expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは")
    // expect([...AttributedStrings.polyglot.runs].map((it) => AttributedStrings.polyglot.substringForRange(it.range).string))
    //     .toEqual(["Hello", " ", "Olá", " ", "こんにちは"])

    // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
    AttributedStrings.polyglot.replaceSubrange(
        { lowerBound: AttributedStrings.polyglot.startIndex, upperBoundExclusive: AttributedStrings.polyglot.endIndex },
        AttributedString.create("H")
    )
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは")

    // Name the test suite attributed string in a value, creating a clone of it (Swift-to-Node copies the field, which is declared as a 'let' and is immutable)
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

    // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), 
    // but the attributed string, reference, and original do not
    const cloneFirstRunAttributes = { attributes: attributedStringClone.runs.elementAt(attributedStringClone.runs.startIndex).attributes }
    attributedStringClone.insert(AttributedString.create("clone", cloneFirstRunAttributes), attributedStringClone.startIndex)
    attributedStringClone.insert(AttributedString.create("enolc"), attributedStringClone.endIndex)
    expect([...attributedStringClone.runs].map((it) => attributedStringClone.substringForRange(it.range).string))
        .toEqual(["cloneHello", " ", "Olá", " ", "こんにちは", "enolc"])
    
    expect(attributedString.string).toEqual("Hi18nは") // Unchanged
    expect(attributedStringReference.string).toEqual("Hi18nは") // Unchanged
    expect(attributedStringClone.string).toEqual("cloneHello Olá こんにちはenolc")
    expect(AttributedStrings.polyglot.string).toEqual("Hello Olá こんにちは") // Unchanged
})

test('MutabilityVariants', () => {
    const attributedString = AttributedStrings.polyglot
    expect(attributedString.string).toEqual("Hello Olá こんにちは")

    attributedString.append(AttributedString.create(" "))
    expect(attributedString.string).toEqual("Hello Olá こんにちは ")

    attributedString.appendSubstring(attributedString.substringForRange([...attributedString.runs][0].range))
    expect(attributedString.string).toEqual("Hello Olá こんにちは Hello")

    const es = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "es" }).asContainer()
    attributedString.insert(AttributedString.create("Hola", { attributes: es }), [...attributedString.runs].slice(-1)[0].range.lowerBound)
    expect(attributedString.string).toEqual("Hello Olá こんにちは HolaHello")

    const firstSpaceRange = {
        lowerBound: [...attributedString.runs][0].range.upperBoundExclusive, 
        upperBoundExclusive: attributedString.characters.indexAfter([...attributedString.runs][0].range.upperBoundExclusive)
    }
    attributedString.insertSubstring(attributedString.substringForRange(firstSpaceRange), [...attributedString.runs].slice(-1)[0].range.lowerBound)
    expect(attributedString.string).toEqual("Hello Olá こんにちは Hola Hello")

    attributedString.replaceSubrange([...attributedString.runs][0].range, AttributedStrings.chinese);
    expect(attributedString.string).toEqual("你好 Olá こんにちは Hola Hello")

    const emoji = AttributedStrings.emojiMulti
    const flagRange = {
        lowerBound: emoji.characters.indexBefore(emoji.endIndex),
        upperBoundExclusive: emoji.endIndex
    }
    attributedString.replaceSubrangeWithSubstring([...attributedString.runs].slice(-1)[0].range, emoji.substringForRange(flagRange))
    expect(attributedString.string).toEqual("你好 Olá こんにちは Hola 🇺🇸")

    attributedString.removeSubrange([...attributedString.runs][0].range)
    expect(attributedString.string).toEqual(" Olá こんにちは Hola 🇺🇸")
})

test('AttributeMergeReplace', () => {
    const empty = AttributeContainer.createEmpty()
    const en = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en"}).asContainer()
    const pt = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt"}).asContainer()
    const ja = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "ja"}).asContainer()
    
    const attributedString = AttributedStrings.polyglot
    let runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(5)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("Olá", { attributes: pt }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[4]).equals(AttributedString.create("こんにちは", { attributes: ja}).substring))

    attributedString.replaceSubrange(runRanges[1], AttributedString.create(
        attributedString.substringForRange(runRanges[1]).string, 
        { attributes: attributedString.runs.elementAtPosition(runRanges[0].lowerBound).attributes }
    ))
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

    const linkAttributes = AttributeContainer.FoundationAttributes.create({ link: new URL("https://www.google.com") })
    const enLink = AttributeContainer.FoundationAttributes.create({ link: linkAttributes.link, languageIdentifier: "en" }).asContainer()
    attributedString.mergeAttributesForRange(runRanges[0], linkAttributes.asContainer())
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(3)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("H", { attributes: enLink }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create("ello Olá こんにち", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("は", { attributes: ja }).substring))

    const jaLink = AttributeContainer.FoundationAttributes.create({ link: linkAttributes.link, languageIdentifier: "ja" }).asContainer()
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

test('AttributeMergeReplaceWhole', () => {
    const empty = AttributeContainer.createEmpty()
    const en = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en" }).asContainer()
    const pt = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt" }).asContainer()
    const ja = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "ja" }).asContainer()

    const attributedString = AttributedStrings.polyglot
    let runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(5)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello", { attributes: en }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("Olá", { attributes: pt }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create(" ", { attributes: empty }).substring))
    expect(attributedString.substringForRange(runRanges[4]).equals(AttributedString.create("こんにちは", { attributes: ja }).substring))

    const uri = new URL("http://www.google.com")
    const link = AttributeContainer.FoundationAttributes.create({ link: uri }).asContainer()
    const enLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en", link: uri }).asContainer()
    const ptLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt", link: uri }).asContainer()
    const jaLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "ja", link: uri }).asContainer()

    attributedString.mergeAttributes(link)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(5)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello", { attributes: enLink }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create(" ", { attributes: link }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("Olá", { attributes: ptLink }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create(" ", { attributes: link }).substring))
    expect(attributedString.substringForRange(runRanges[4]).equals(AttributedString.create("こんにちは", { attributes: jaLink }).substring))

    const otherURI = new URL("http://www.bing.com")
    const otherLink = AttributeContainer.FoundationAttributes.create({ link: otherURI }).asContainer()
    const enOtherLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en", link: otherURI }).asContainer()
    const ptOtherLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "pt", link: otherURI }).asContainer()
    const jaOtherLink = AttributeContainer.FoundationAttributes.create({ languageIdentifier: "ja", link: otherURI }).asContainer()
    attributedString.replaceAttributes(link, otherLink)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(5)
    expect(attributedString.substringForRange(runRanges[0]).equals(AttributedString.create("Hello", { attributes: enOtherLink }).substring))
    expect(attributedString.substringForRange(runRanges[1]).equals(AttributedString.create(" ", { attributes: otherLink }).substring))
    expect(attributedString.substringForRange(runRanges[2]).equals(AttributedString.create("Olá", { attributes: ptOtherLink }).substring))
    expect(attributedString.substringForRange(runRanges[3]).equals(AttributedString.create(" ", { attributes: otherLink }).substring))
    expect(attributedString.substringForRange(runRanges[4]).equals(AttributedString.create("こんにちは", { attributes: jaOtherLink }).substring))

    attributedString.setAttributes(empty)
    runRanges = [...attributedString.runs].map((it) => it.range)
    expect(runRanges.length).toEqual(1)
    expect(attributedString.equals(AttributedString.create("Hello Olá こんにちは")))
})

test('DirectInterfacing', () => {
    expect(AttributedStrings.firstIndex(AttributedStrings.simple)
        .equals(AttributedStrings.simple.startIndex)
    )
    expect(AttributedStrings.lastIndex(AttributedStrings.simple)
        .equals(AttributedStrings.simple.characters.indexBefore(AttributedStrings.simple.endIndex))
    )
    expect(AttributedStrings.fullRange(AttributedStrings.simple))
        .toEqual({ lowerBound: AttributedStrings.simple.startIndex, upperBoundExclusive: AttributedStrings.simple.endIndex })
    expect([...AttributedStrings.attributedCharacters(AttributedStrings.emojiMulti)].length)
        .toEqual(3)
    expect(AttributedStrings.attributesPreferringDuplicatesNearerStart(AttributedStrings.simple)
        .equals(AttributeContainer.FoundationAttributes.create({ languageIdentifier: "en"}).asContainer())
    )
    expect([...AttributedStrings.emptyAttributeRuns(AttributedStrings.polyglot)].length)
        .toEqual(2)
})
