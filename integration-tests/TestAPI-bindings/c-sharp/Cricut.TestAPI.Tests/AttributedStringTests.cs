using System;
using System.Linq;
using System.Collections.Generic;
using Xunit;
using Cricut.FishyJoesRuntime;

namespace Cricut.TestAPI.Tests {
    public class AttributedStringTests {
        [Fact]
        void testStringValues() {
            var en = new AttributeContainer.FoundationAttributes(languageIdentifier: "en");
            var pt = new AttributeContainer.FoundationAttributes(languageIdentifier: "pt");
            var ja = new AttributeContainer.FoundationAttributes(languageIdentifier: "ja");
            var zh = new AttributeContainer.FoundationAttributes(languageIdentifier: "zh");
            var ea = new AttributeContainer.FoundationAttributes(link: new Uri("https://home.unicode.org/emoji"));
            var ef = new AttributeContainer.FoundationAttributes(link: new Uri("https://home.unicode.org/emoji/emoji-frequency"));

            Assert.Equal("en", en.LanguageIdentifier);
            Assert.Null(en.Link);

            Assert.Null(ea.LanguageIdentifier);
            Assert.Equal(new Uri("https://home.unicode.org/emoji"), ea.Link);

            Assert.Equal(new AttributedString("Hello", en), AttributedStrings.Simple);
            Assert.Equal(new AttributedString("Olá", pt), AttributedStrings.Accent);
            Assert.Equal(new AttributedString("こんにちは", ja), AttributedStrings.Script);
            Assert.Equal(new AttributedString("你好", zh), AttributedStrings.Chinese);
            Assert.Equal(new AttributedString("豈更車賈滑", zh), AttributedStrings.ChineseBMP);
            Assert.Equal(new AttributedString("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", zh), AttributedStrings.ChineseSIP);
            Assert.Equal(new AttributedString("🤯🐶🍓", ea), AttributedStrings.Emoji);
            Assert.Equal(new AttributedString("👨‍👩‍👧‍👦👍🏿🇺🇸", ef), AttributedStrings.EmojiMulti);
            Assert.Equal(AttributedStrings.Simple + " " + AttributedStrings.Accent + " " + AttributedStrings.Script, AttributedStrings.Polyglot);

            Assert.Equal(AttributedStrings.Simple, AttributedStrings.Simple);
            Assert.NotEqual(AttributedStrings.Accent, AttributedStrings.Simple);
            Assert.NotEqual(new AttributedString(AttributedStrings.Simple.GetString(), null), AttributedStrings.Simple);
        }

        [Fact]
        void testStringEcho() {
            Assert.Equal(AttributedStrings.Simple, AttributedStrings.Echo(AttributedStrings.Simple));
            Assert.Equal(AttributedStrings.Accent, AttributedStrings.Echo(AttributedStrings.Accent));
            Assert.Equal(AttributedStrings.Chinese, AttributedStrings.Echo(AttributedStrings.Chinese));
            Assert.Equal(AttributedStrings.ChineseBMP, AttributedStrings.Echo(AttributedStrings.ChineseBMP));
            Assert.Equal(AttributedStrings.ChineseSIP, AttributedStrings.Echo(AttributedStrings.ChineseSIP));
            Assert.Equal(AttributedStrings.Emoji, AttributedStrings.Echo(AttributedStrings.Emoji));
            Assert.Equal(AttributedStrings.EmojiMulti, AttributedStrings.Echo(AttributedStrings.EmojiMulti));
            Assert.Equal(AttributedStrings.Polyglot, AttributedStrings.Echo(AttributedStrings.Polyglot));
        }

        [Fact]
        void testViewIterationOverIndices() {
            var attributedString = AttributedStrings.Polyglot + " " + AttributedStrings.EmojiMulti;

            var runStrings = new List<string>();
            var runIndex = attributedString.GetRuns().GetStartIndex();
            while (runIndex != attributedString.GetRuns().GetEndIndex()) {
                var runSubstring = attributedString.SubstringForRange(attributedString.GetRuns().ElementAt(runIndex).GetRange());
                runStrings.Add(runSubstring.GetString());
                runIndex = attributedString.GetRuns().IndexAfter(runIndex);
            }
            Assert.Equal(new string[]
                {
                    "Hello",
                    " ",
                    "Olá",
                    " ",
                    "こんにちは",
                    " ",
                    "👨‍👩‍👧‍👦👍🏿🇺🇸"
                },
                runStrings
            );

            var characterStrings = new List<string>();
            var characterIndex = attributedString.GetCharacters().GetStartIndex();
            while (characterIndex != attributedString.GetCharacters().GetEndIndex()) {
                var characterString = attributedString.GetCharacters().ElementAt(characterIndex);
                characterStrings.Add(characterString);
                characterIndex = attributedString.GetCharacters().IndexAfter(characterIndex);
            }
            Assert.Equal(new string[]
                {
                    "H", "e", "l", "l", "o", " ",
                    "O", "l", "á", " ",
                    "こ", "ん", "に", "ち", "は", " ",
                    "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
                },
                characterStrings
            );

            var unicodeScalars = new List<uint>();
            var scalarIndex = attributedString.GetUnicodeScalars().GetStartIndex();
            while (scalarIndex != attributedString.GetUnicodeScalars().GetEndIndex()) {
                var characterScalar = attributedString.GetUnicodeScalars().ElementAt(scalarIndex);
                unicodeScalars.Add(characterScalar);
                scalarIndex = attributedString.GetUnicodeScalars().IndexAfter(scalarIndex);
            }
            Assert.Equal(new uint[]
                {
                    72, 101, 108, 108, 111, 32,
                    79, 108, 225, 32,
                    12371, 12435, 12395, 12385, 12399, 32,
                    128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
                },
                unicodeScalars
            );
        }

        [Fact]
        void testViewIterators() {
            var attributedString = AttributedStrings.Polyglot + " " + AttributedStrings.EmojiMulti;

            Assert.Equal(new string[]
                {
                    "Hello",
                    " ",
                    "Olá",
                    " ",
                    "こんにちは",
                    " ",
                    "👨‍👩‍👧‍👦👍🏿🇺🇸"
                },
                attributedString.GetRuns().Select(run => attributedString.SubstringForRange(run.GetRange()).GetString())
            );

            Assert.Equal(new string[]
                {
                    "H", "e", "l", "l", "o", " ",
                    "O", "l", "á", " ",
                    "こ", "ん", "に", "ち", "は", " ",
                    "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
                },
                attributedString.GetCharacters()
            );

            Assert.Equal(new uint[]
                {
                    72, 101, 108, 108, 111, 32,
                    79, 108, 225, 32,
                    12371, 12435, 12395, 12385, 12399, 32,
                    128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
                },
                attributedString.GetUnicodeScalars()
            );
        }

        [Fact]
        void testSubstring() {
            var attributedString = AttributedStrings.Polyglot;
            Assert.Equal("Hello Olá こんにちは", attributedString.GetString());

            var range = new SwiftRange<AttributedString.Index>(
                attributedString.GetCharacters().IndexAfter(attributedString.GetStartIndex()), 
                attributedString.GetCharacters().IndexBefore(attributedString.GetEndIndex())
            );
            var substring = attributedString.SubstringForRange(range);
            Assert.Equal("ello Olá こんにち", substring.GetString());
            Assert.Equal("Hello Olá こんにちは", substring.GetBase().GetString());

            var subRange = new SwiftRange<AttributedString.Index>(
                substring.GetCharacters().IndexAfter(substring.GetStartIndex()), 
                substring.GetCharacters().IndexBefore(substring.GetEndIndex())
            );
            var subSubstring = substring.SubstringForRange(subRange);
            Assert.Equal("llo Olá こんに", subSubstring.GetString());
            Assert.Equal("Hello Olá こんにちは", subSubstring.GetBase().GetString());
        }
    }
}

/*
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
*/