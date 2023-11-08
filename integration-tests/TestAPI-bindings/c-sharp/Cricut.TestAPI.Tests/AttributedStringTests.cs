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
            Assert.NotEqual(new AttributedString(AttributedStrings.Simple.String, null), AttributedStrings.Simple);
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
            var runIndex = attributedString.Runs.StartIndex;
            while (runIndex != attributedString.Runs.EndIndex) {
                var runSubstring = attributedString[attributedString.Runs[runIndex].Range];
                runStrings.Add(runSubstring.String);
                runIndex = attributedString.Runs.IndexAfter(runIndex);
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
            var characterIndex = attributedString.Characters.StartIndex;
            while (characterIndex != attributedString.Characters.EndIndex) {
                var characterString = attributedString.Characters[characterIndex];
                characterStrings.Add(characterString);
                characterIndex = attributedString.Characters.IndexAfter(characterIndex);
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

            var unicodeScalars = new List<UInt32>();
            var scalarIndex = attributedString.UnicodeScalars.StartIndex;
            while (scalarIndex != attributedString.UnicodeScalars.EndIndex) {
                var characterScalar = attributedString.UnicodeScalars[scalarIndex];
                unicodeScalars.Add(characterScalar);
                scalarIndex = attributedString.UnicodeScalars.IndexAfter(scalarIndex);
            }
            Assert.Equal(new UInt32[]
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
                attributedString.Runs.Select(run => attributedString[run.Range].String)
            );

            Assert.Equal(new string[]
                {
                    "H", "e", "l", "l", "o", " ",
                    "O", "l", "á", " ",
                    "こ", "ん", "に", "ち", "は", " ",
                    "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
                },
                attributedString.Characters
            );

            Assert.Equal(new UInt32[]
                {
                    72, 101, 108, 108, 111, 32,
                    79, 108, 225, 32,
                    12371, 12435, 12395, 12385, 12399, 32,
                    128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
                },
                attributedString.UnicodeScalars
            );
        }

        [Fact]
        void testSubstring() {
            var attributedString = AttributedStrings.Polyglot;
            Assert.Equal("Hello Olá こんにちは", attributedString.String);

            var range = new SwiftRange<AttributedString.Index>(
                attributedString.Characters.IndexAfter(attributedString.StartIndex), 
                attributedString.Characters.IndexBefore(attributedString.EndIndex)
            );
            var substring = attributedString[range];
            Assert.Equal("ello Olá こんにち", substring.String);
            Assert.Equal("Hello Olá こんにちは", substring.Base.String);

            var subRange = new SwiftRange<AttributedString.Index>(
                substring.Characters.IndexAfter(substring.StartIndex), 
                substring.Characters.IndexBefore(substring.EndIndex)
            );
            var subSubstring = substring[subRange];
            Assert.Equal("llo Olá こんに", subSubstring.String);
            Assert.Equal("Hello Olá こんにちは", subSubstring.Base.String);
        }

        [Fact]
        void testMutability() {
            // Examine an existing attributed string from the test suite
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.String);
            Assert.Equal(
                new string[] { "Hello", " ", "Olá", " ", "こんにちは" },
                AttributedStrings.Polyglot.Runs.Select(run => AttributedStrings.Polyglot[run.Range].String)
            );

            // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
            AttributedStrings.Polyglot.ReplaceSubrange(
                new SwiftRange<AttributedString.Index>(AttributedStrings.Polyglot.StartIndex, AttributedStrings.Polyglot.EndIndex), 
                new AttributedString("H")
            );
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.String);

            // Name the test suite attributed string in a value, creating a clone of it (Swift-to-C# copies the field, which is declared as a 'let' and is immutable)
            var attributedString = AttributedStrings.Polyglot;
            Assert.Equal("Hello Olá こんにちは", attributedString.String);

            // Reference the attributed string, which acts as a reference type like a typical C# object, mirroring changes to the referenced attributed string
            var attributedStringReference = attributedString;
            Assert.Equal("Hello Olá こんにちは", attributedStringReference.String);

            // // Clone the attributed string, making a copy of its string data and attributes
            var attributedStringClone = (AttributedString)attributedString.Clone();
            Assert.Equal("Hello Olá こんにちは", attributedStringClone.String);

            // Modify the attributed string's attributes, verify it and the reference change, but the clone and original do not
            var range = new SwiftRange<AttributedString.Index>(
                attributedString.Characters.IndexAfter(attributedString.StartIndex), 
                attributedString.Characters.IndexBefore(attributedString.EndIndex)
            );
            Assert.Equal(
                new string[] { "Hello", " ", "Olá", " ", "こんにちは" },
                attributedString.Runs.Select(run => attributedString[run.Range].String)
            );
            attributedString.ReplaceSubrange(
                range, 
                new AttributedString(attributedString[range].String, new AttributeContainer())
            );
            Assert.Equal(
                new string[] { "H", "ello Olá こんにち", "は" },
                attributedString.Runs.Select(run => attributedString[run.Range].String)
            );
            Assert.Equal(3, attributedString.Runs.ToList().Count);
            Assert.Equal(3, attributedStringReference.Runs.ToList().Count);
            Assert.Equal(5, attributedStringClone.Runs.ToList().Count); // Unchanged
            Assert.Equal(5, AttributedStrings.Polyglot.Runs.ToList().Count); // Unchanged

            // Modify the attributed string's string data, verify it and the reference change, but the clone and original do not
            attributedString.ReplaceSubrange(range, new AttributedString("i18n"));
            Assert.Equal(
                new string[] { "H", "i18n", "は" },
                attributedString.Runs.Select(run => attributedString[run.Range].String)
            );
            Assert.Equal("Hi18nは", attributedString.String);
            Assert.Equal("Hi18nは", attributedStringReference.String);
            Assert.Equal("Hello Olá こんにちは", attributedStringClone.String); // Unchanged
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.String); // Unchanged

            // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the attributed string, reference, and original do not
            attributedStringClone.Insert(new AttributedString("clone", attributedStringClone.Runs.First().Attributes), attributedStringClone.StartIndex);
            attributedStringClone.Insert(new AttributedString("enolc"), attributedStringClone.EndIndex);
            Assert.Equal(
                new string[] { "cloneHello", " ", "Olá", " ", "こんにちは", "enolc" },
                attributedStringClone.Runs.Select(run => attributedStringClone[run.Range].String)
            );
            Assert.Equal("Hi18nは", attributedString.String); // Unchanged
            Assert.Equal("Hi18nは", attributedStringReference.String); // Unchanged
            Assert.Equal("cloneHello Olá こんにちはenolc", attributedStringClone.String);
            Assert.Equal("Hello Olá こんにちは", AttributedStrings.Polyglot.String); // Unchanged
        }

        [Fact]
        void testAttributeMergeReplace() {
            var empty = new AttributeContainer();
            var en = new AttributeContainer.FoundationAttributes(languageIdentifier: "en");
            var pt = new AttributeContainer.FoundationAttributes(languageIdentifier: "pt");
            var ja = new AttributeContainer.FoundationAttributes(languageIdentifier: "ja");

            var attributedString = AttributedStrings.Polyglot;
            var runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(5, runRanges.Count);
            Assert.Equal(new AttributedString("Hello", en).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString(" ", empty).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString("Olá", pt).Substring, attributedString[runRanges[2]]);
            Assert.Equal(new AttributedString(" ", empty).Substring, attributedString[runRanges[3]]);
            Assert.Equal(new AttributedString("こんにちは", ja).Substring, attributedString[runRanges[4]]);

            attributedString.ReplaceSubrange(
                runRanges[1], 
                new AttributedString(
                    attributedString[runRanges[1]].String, 
                    attributedString.Runs[runRanges[0].lowerBound].Attributes
                )
            );
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(4, runRanges.Count);
            Assert.Equal(new AttributedString("Hello ", en).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString("Olá", pt).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString(" ", empty).Substring, attributedString[runRanges[2]]);
            Assert.Equal(new AttributedString("こんにちは", ja).Substring, attributedString[runRanges[3]]);

            attributedString.SetAttributesForRange(runRanges[2], attributedString.Runs[runRanges[1].lowerBound].Attributes);
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("Hello ", en).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString("Olá ", pt).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString("こんにちは", ja).Substring, attributedString[runRanges[2]]);

            var mangleStartIndex = attributedString.Characters.IndexAfter(attributedString.StartIndex);
            var mangleEndIndex = attributedString.Characters.IndexBefore(attributedString.EndIndex);
            var mangleRange = new SwiftRange<AttributedString.Index>(mangleStartIndex, mangleEndIndex);
            attributedString.SetAttributesForRange(mangleRange, empty);
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", en).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString("は", ja).Substring, attributedString[runRanges[2]]);

            var linkAttribute = new AttributeContainer.FoundationAttributes(link: new Uri("https://www.google.com"));
            var enLink = linkAttribute;
            enLink.LanguageIdentifier = "en";
            attributedString.MergeAttributesForRange(runRanges[0], linkAttribute);
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", enLink).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString("は", ja).Substring, attributedString[runRanges[2]]);

            var jaLink = linkAttribute;
            jaLink.LanguageIdentifier = "ja";
            attributedString.ReplaceAttributesForRange(runRanges[0], en, ja);
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.Equal(3, runRanges.Count);
            Assert.Equal(new AttributedString("H", jaLink).Substring, attributedString[runRanges[0]]);
            Assert.Equal(new AttributedString("ello Olá こんにち", empty).Substring, attributedString[runRanges[1]]);
            Assert.Equal(new AttributedString("は", ja).Substring, attributedString[runRanges[2]]);

            attributedString.SetAttributesForRange(attributedString.Runs.First().Range, empty);
            attributedString.SetAttributesForRange(attributedString.Runs.Last().Range, empty);
            runRanges = attributedString.Runs.Select(run => run.Range).ToList();
            Assert.NotEmpty(runRanges);
            Assert.Equal(new AttributedString("Hello Olá こんにちは", empty), attributedString);
        }
    }
}
