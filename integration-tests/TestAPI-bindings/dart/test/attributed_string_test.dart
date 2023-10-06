import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:fishyjoes_dart/runtime.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('AttributedStringTests', () {
      test('testStringValues', () {
          var en = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en");
          var pt = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "pt");
          var ja = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "ja");
          var zh = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "zh");
          var ea = AttributeContainer_FoundationAttributes.withAttributes(link: Uri.parse("https://home.unicode.org/emoji"));
          var ef = AttributeContainer_FoundationAttributes.withAttributes(link: Uri.parse("https://home.unicode.org/emoji/emoji-frequency"));

          expect("en", equals(en.languageIdentifier));
          expect(en.link, isNull);

          expect(ea.languageIdentifier, isNull);
          expect(Uri.parse("https://home.unicode.org/emoji"), ea.link);

          expect(AttributedString.create("Hello", attributes: en.asContainer()), equals(AttributedStrings.simple));
          expect(AttributedString.create("Olá", attributes: pt.asContainer()), equals(AttributedStrings.accent));
          expect(AttributedString.create("こんにちは", attributes: ja.asContainer()), equals(AttributedStrings.script));
          expect(AttributedString.create("你好", attributes: zh.asContainer()), equals(AttributedStrings.chinese));
          expect(AttributedString.create("豈更車賈滑", attributes: zh.asContainer()), equals(AttributedStrings.chineseBMP));
          expect(AttributedString.create("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", attributes: zh.asContainer()), equals(AttributedStrings.chineseSIP));
          expect(AttributedString.create("🤯🐶🍓", attributes: ea.asContainer()), equals(AttributedStrings.emoji));
          expect(AttributedString.create("👨‍👩‍👧‍👦👍🏿🇺🇸", attributes: ef.asContainer()), equals(AttributedStrings.emojiMulti));
          expect(AttributedStrings.simple + " " + AttributedStrings.accent + " " + AttributedStrings.script, equals(AttributedStrings.polyglot));

          expect(AttributedStrings.simple, equals(AttributedStrings.simple));
          expect(AttributedStrings.accent, isNot(AttributedStrings.simple));
          expect(AttributedString.create(AttributedStrings.simple.string, attributes: null), isNot(AttributedStrings.simple));
      });
  

      test('testStringEcho', () {
          expect(AttributedStrings.simple, AttributedStrings.echo(AttributedStrings.simple));
          expect(AttributedStrings.accent, AttributedStrings.echo(AttributedStrings.accent));
          expect(AttributedStrings.chinese, AttributedStrings.echo(AttributedStrings.chinese));
          expect(AttributedStrings.chineseBMP, AttributedStrings.echo(AttributedStrings.chineseBMP));
          expect(AttributedStrings.chineseSIP, AttributedStrings.echo(AttributedStrings.chineseSIP));
          expect(AttributedStrings.emoji, AttributedStrings.echo(AttributedStrings.emoji));
          expect(AttributedStrings.emojiMulti, AttributedStrings.echo(AttributedStrings.emojiMulti));
          expect(AttributedStrings.polyglot, AttributedStrings.echo(AttributedStrings.polyglot));
      });

      test('testViewIterationOverIndices', () {
          var attributedString = AttributedStrings.polyglot + " " + AttributedStrings.emojiMulti;

          var runStrings = <String>[];
          var runIndex = attributedString.runs.startIndex;
          while (runIndex != attributedString.runs.endIndex) {
              var runSubstring = attributedString[attributedString.runs[runIndex].range];
              runStrings.add(runSubstring.string);
              runIndex = attributedString.runs.indexAfter(runIndex);
          }
          expect(
              [
                  "Hello",
                  " ",
                  "Olá",
                  " ",
                  "こんにちは",
                  " ",
                  "👨‍👩‍👧‍👦👍🏿🇺🇸"
              ],
              equals(runStrings)
          );

          var characterStrings = <String>[];
          var characterIndex = attributedString.characters.startIndex;
          while (characterIndex != attributedString.characters.endIndex) {
              var characterString = attributedString.characters[characterIndex];
              characterStrings.add(characterString);
              characterIndex = attributedString.characters.indexAfter(characterIndex);
          }
          expect(
              [
                  "H", "e", "l", "l", "o", " ",
                  "O", "l", "á", " ",
                  "こ", "ん", "に", "ち", "は", " ",
                  "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
              ],
              equals(characterStrings)
          );

          var unicodeScalars = <int>[];
          var scalarIndex = attributedString.unicodeScalars.startIndex;
          while (scalarIndex != attributedString.unicodeScalars.endIndex) {
              var characterScalar = attributedString.unicodeScalars[scalarIndex];
              unicodeScalars.add(characterScalar);
              scalarIndex = attributedString.unicodeScalars.indexAfter(scalarIndex);
          }
          expect(
              [
                  72, 101, 108, 108, 111, 32,
                  79, 108, 225, 32,
                  12371, 12435, 12395, 12385, 12399, 32,
                  128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
              ],
              equals(unicodeScalars)
          );
      });

      test('testViewIterators', () {
          var attributedString = AttributedStrings.polyglot + " " + AttributedStrings.emojiMulti;

          var runStrings = [...attributedString.runs].map((run) => attributedString[run.range].string).toList();
          expect(runStrings, equals([
              "Hello",
              " ",
              "Olá",
              " ",
              "こんにちは",
              " ",
              "👨‍👩‍👧‍👦👍🏿🇺🇸"
          ]));

          var characterStrings = [...attributedString.characters];
          expect(characterStrings, equals([
              "H", "e", "l", "l", "o", " ",
              "O", "l", "á", " ",
              "こ", "ん", "に", "ち", "は", " ",
              "👨‍👩‍👧‍👦", "👍🏿", "🇺🇸"
          ]));

          var unicodeScalarValues = [...attributedString.unicodeScalars];
          expect(unicodeScalarValues, equals([
              72, 101, 108, 108, 111, 32,
              79, 108, 225, 32,
              12371, 12435, 12395, 12385, 12399, 32,
              128104, 8205, 128105, 8205, 128103, 8205, 128102, 128077, 127999, 127482, 127480
          ]));
      });

      test('testSubstring', () {
          var attributedString = AttributedStrings.polyglot;
          expect("Hello Olá こんにちは", equals(attributedString.string));

          var range = SwiftRange(
              attributedString.characters.indexAfter(attributedString.startIndex), 
              attributedString.characters.indexBefore(attributedString.endIndex)
          );
          var substring = attributedString[range];
          expect("ello Olá こんにち", equals(substring.string));
          expect("Hello Olá こんにちは", equals(substring.base.string));

          var subRange = SwiftRange(
              substring.characters.indexAfter(substring.startIndex), 
              substring.characters.indexBefore(substring.endIndex)
          );
          var subSubstring = substring[subRange];
          expect("llo Olá こんに", equals(subSubstring.string));
          expect("Hello Olá こんにちは", equals(subSubstring.base.string));
      });
  });
}

/*
    public class AttributedStringTests {
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
*/
