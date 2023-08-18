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

        [Fact]
        void testMutability() {
            // Examine an existing attributed string from the test suite
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.GetString());
            Assert.Equal(
                new string[] { "Hello", " ", "Olá", " ", "こんにちは" },
                AttributedStrings.Polyglot.GetRuns().Select(run => AttributedStrings.Polyglot.SubstringForRange(run.GetRange()).GetString())
            );

            // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
            AttributedStrings.Polyglot.ReplaceSubrange(
                new SwiftRange<AttributedString.Index>(AttributedStrings.Polyglot.GetStartIndex(), AttributedStrings.Polyglot.GetEndIndex()), 
                new AttributedString("H")
            );
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.GetString());

            // Name the test suite attributed string in a value, creating a clone of it (Swift-to-C# copies the field, which is declared as a 'let' and is immutable)
            var attributedString = AttributedStrings.Polyglot;
            Assert.Equal("Hello Olá こんにちは", attributedString.GetString());

            // Reference the attributed string, which acts as a reference type like a typical C# object, mirroring changes to the referenced attributed string
            var attributedStringReference = attributedString;
            Assert.Equal("Hello Olá こんにちは", attributedStringReference.GetString());

            // // Clone the attributed string, making a copy of its string data and attributes
            var attributedStringClone = (AttributedString)attributedString.Clone();
            Assert.Equal("Hello Olá こんにちは", attributedStringClone.GetString());

            // Modify the attributed string's attributes, verify it and the reference change, but the clone and original do not
            var range = new SwiftRange<AttributedString.Index>(
                attributedString.GetCharacters().IndexAfter(attributedString.GetStartIndex()), 
                attributedString.GetCharacters().IndexBefore(attributedString.GetEndIndex())
            );
            Assert.Equal(
                new string[] { "Hello", " ", "Olá", " ", "こんにちは" },
                attributedString.GetRuns().Select(run => attributedString.SubstringForRange(run.GetRange()).GetString())
            );
            attributedString.ReplaceSubrange(
                range, 
                new AttributedString(attributedString.SubstringForRange(range).GetString(), new AttributeContainer())
            );
            Assert.Equal(
                new string[] { "H", "ello Olá こんにち", "は" },
                attributedString.GetRuns().Select(run => attributedString.SubstringForRange(run.GetRange()).GetString())
            );
            Assert.Equal(3, attributedString.GetRuns().ToList().Count);
            Assert.Equal(3, attributedStringReference.GetRuns().ToList().Count);
            Assert.Equal(5, attributedStringClone.GetRuns().ToList().Count); // Unchanged
            Assert.Equal(5, AttributedStrings.Polyglot.GetRuns().ToList().Count); // Unchanged

            // Modify the attributed string's string data, verify it and the reference change, but the clone and original do not
            attributedString.ReplaceSubrange(range, new AttributedString("i18n"));
            Assert.Equal(
                new string[] { "H", "i18n", "は" },
                attributedString.GetRuns().Select(run => attributedString.SubstringForRange(run.GetRange()).GetString())
            );
            Assert.Equal("Hi18nは", attributedString.GetString());
            Assert.Equal("Hi18nは", attributedStringReference.GetString());
            Assert.Equal("Hello Olá こんにちは", attributedStringClone.GetString()); // Unchanged
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.GetString()); // Unchanged

            // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the attributed string, reference, and original do not
            attributedStringClone.Insert(new AttributedString("clone", attributedStringClone.GetRuns().First().GetAttributes()), attributedStringClone.GetStartIndex());
            attributedStringClone.Insert(new AttributedString("enolc"), attributedStringClone.GetEndIndex());
            Assert.Equal(
                new string[] { "cloneHello", " ", "Olá", " ", "こんにちは", "enolc" },
                attributedStringClone.GetRuns().Select(run => attributedString.SubstringForRange(run.GetRange()).GetString())
            );
            Assert.Equal("Hi18nは", attributedString.GetString()); // Unchanged
            Assert.Equal("Hi18nは", attributedStringReference.GetString()); // Unchanged
            Assert.Equal("cloneHello Olá こんにちはenolc", attributedStringClone.GetString());
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.GetString()); // Unchanged
        }

        [Fact]
        void testAttributeMergeReplace() {
            var empty = new AttributeContainer();
            var en = new AttributeContainer.FoundationAttributes(languageIdentifier: "en");
            var pt = new AttributeContainer.FoundationAttributes(languageIdentifier: "pt");
            var ja = new AttributeContainer.FoundationAttributes(languageIdentifier: "ja");

            var attributedString = AttributedStrings.Polyglot;
            var runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(5, runRanges.Count);
            Assert.Equal(new AttributedString("Hello", en).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString(" ", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString("Olá", pt).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));
            Assert.Equal(new AttributedString(" ", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[3]));
            Assert.Equal(new AttributedString("こんにちは", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[4]));

            attributedString.ReplaceSubrange(
                runRanges[1], 
                new AttributedString(
                    attributedString.SubstringForRange(runRanges[1]).GetString(), 
                    attributedString.GetRuns().ElementAtPosition(runRanges[0].lowerBound).GetAttributes()
                )
            );
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(4, runRanges.Count);
            Assert.Equal(new AttributedString("Hello ", en).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString("Olá", pt).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString(" ", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));
            Assert.Equal(new AttributedString("こんにちは", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[3]));

            attributedString.SetAttributesForRange(
                runRanges[2], 
                attributedString.GetRuns().ElementAtPosition(runRanges[1].lowerBound).GetAttributes()
            );
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("Hello ", en).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString("Olá ", pt).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString("こんにちは", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));

            var mangleStartIndex = attributedString.GetCharacters().IndexAfter(attributedString.GetStartIndex());
            var mangleEndIndex = attributedString.GetCharacters().IndexBefore(attributedString.GetEndIndex());
            var mangleRange = new SwiftRange<AttributedString.Index>(mangleStartIndex, mangleEndIndex);
            attributedString.SetAttributesForRange(mangleRange, empty);
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", en).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString("は", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));

            var linkAttribute = new AttributeContainer.FoundationAttributes(link: new Uri("https://www.google.com"));
            var enLink = linkAttribute;
            enLink.LanguageIdentifier = "en";
            attributedString.MergeAttributesForRange(runRanges[0], linkAttribute);
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", enLink).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString("は", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));

            var jaLink = linkAttribute;
            jaLink.LanguageIdentifier = "ja";
            attributedString.ReplaceAttributesForRange(runRanges[0], en, ja);
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", jaLink).GetSubstring(), attributedString.SubstringForRange(runRanges[0]));
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).GetSubstring(), attributedString.SubstringForRange(runRanges[1]));
            Assert.Equal(new AttributedString("は", ja).GetSubstring(), attributedString.SubstringForRange(runRanges[2]));

            attributedString.SetAttributesForRange(attributedString.GetRuns().First().GetRange(), empty);
            attributedString.SetAttributesForRange(attributedString.GetRuns().Last().GetRange(), empty);
            runRanges = attributedString.GetRuns().Select(it => it.GetRange()).ToList();
            Assert.NotEmpty(runRanges);
            Assert.Equal(new AttributedString("Hello Olá こんにちは", empty), attributedString);
        }
    }
}
