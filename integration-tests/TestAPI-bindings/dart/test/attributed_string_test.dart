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

          expect(en, equals(AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en")));
          expect(en, isNot(pt));
          expect(en, isNot(ea));

          var enContainer = en.asContainer();
          var eaContainer = ea.asContainer();
          var eneaContainer = AttributeContainer.createEmpty();
          eneaContainer.merge(enContainer);
          eneaContainer.merge(eaContainer);
          var enea = AttributeContainer_FoundationAttributes.createFromContainer(eneaContainer);
          expect("en", equals(enea.languageIdentifier));
          expect(Uri.parse("https://home.unicode.org/emoji"), equals(enea.link));

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

          var runStringsReversed = <String>[];
          var runIndexReversed = attributedString.runs.endIndex;
          while (runIndexReversed != attributedString.runs.startIndex) {
              runIndexReversed = attributedString.runs.indexBefore(runIndexReversed);
              var runSubstring = attributedString[attributedString.runs[runIndexReversed].range];
              runStringsReversed.add(runSubstring.string);
          }
          expect(
              [
                  "👨‍👩‍👧‍👦👍🏿🇺🇸",
                  " ",
                  "こんにちは",
                  " ",
                  "Olá",
                  " ",
                  "Hello",
              ],
              equals(runStringsReversed)
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

          var characterStringsReversed = <String>[];
          var characterIndexReversed = attributedString.characters.endIndex;
          while (characterIndexReversed != attributedString.characters.startIndex) {
              characterIndexReversed = attributedString.characters.indexBefore(characterIndexReversed);
              var characterString = attributedString.characters[characterIndexReversed];
              characterStringsReversed.add(characterString);
          }
          expect(
              [
                  "🇺🇸", "👍🏿", "👨‍👩‍👧‍👦",
                  " ", "は", "ち", "に", "ん", "こ",
                  " ", "á", "l", "O",
                  " ", "o", "l", "l", "e", "H",
              ],
              equals(characterStringsReversed)
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

          var unicodeScalarsReversed = <int>[];
          var scalarIndexReversed = attributedString.unicodeScalars.endIndex;
          while (scalarIndexReversed != attributedString.unicodeScalars.startIndex) {
              scalarIndexReversed = attributedString.unicodeScalars.indexBefore(scalarIndexReversed);
              var characterScalar = attributedString.unicodeScalars[scalarIndexReversed];
              unicodeScalarsReversed.add(characterScalar);
          }
          expect(
              [
                  127480, 127482, 127999, 128077, 128102, 8205, 128103, 8205, 128105, 8205, 128104, 
                  32, 12399, 12385, 12395, 12435, 12371, 
                  32, 225, 108, 79,
                  32, 111, 108, 108, 101, 72,
              ],
              equals(unicodeScalarsReversed)
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
          expect(substring, equals(substring.substring));

          var subRange = SwiftRange(
              substring.runs.first.range.upperBound, 
              substring.runs.last.range.lowerBound
          );
          var subSubstring = substring[subRange];
          expect(" Olá ", equals(subSubstring.string));
          expect("Hello Olá こんにちは", equals(subSubstring.base.string));

          var subSubRange = SwiftRange(
              subSubstring.unicodeScalars.indexAfter(subSubstring.startIndex), 
              subSubstring.unicodeScalars.indexBefore(subSubstring.endIndex)
          );
          var subSubSubstring = subSubstring[subSubRange];
          expect("Olá", equals(subSubSubstring.string));
          expect("Hello Olá こんにちは", equals(subSubSubstring.base.string));

          var emptyRange = SwiftRange(
              subSubSubstring.endIndex,
              subSubSubstring.endIndex
          );
          var emptySubstring = subSubSubstring[emptyRange];
          expect("", equals(emptySubstring.string));
          expect("Hello Olá こんにちは", equals(emptySubstring.base.string));
          expect(AttributedSubstring.createEmpty(), equals(emptySubstring));
      });

      test('testMutability', () {
          // Examine an existing attributed string from the test suite
          expect("Hello Olá こんにちは", AttributedStrings.polyglot.string);
          expect(
              [ "Hello", " ", "Olá", " ", "こんにちは" ],
              equals(AttributedStrings.polyglot.runs.map((run) => AttributedStrings.polyglot[run.range].string))
          );

          // Attempt to "modify" the attributed string from the test suite, verify only an (unnamed) clone of it changes, but it does not change
          AttributedStrings.polyglot.replaceSubrange(
              SwiftRange(AttributedStrings.polyglot.startIndex, AttributedStrings.polyglot.endIndex), 
              AttributedString.create("H")
          );
          expect("Hello Olá こんにちは", AttributedStrings.polyglot.string);

          // Name the test suite attributed string in a value, creating a clone of it (Swift-to-C# copies the field, which is declared as a 'let' and is immutable)
          var attributedString = AttributedStrings.polyglot;
          expect("Hello Olá こんにちは", equals(attributedString.string));

          // Reference the attributed string, which acts as a reference type like a typical C# object, mirroring changes to the referenced attributed string
          var attributedStringReference = attributedString;
          expect("Hello Olá こんにちは", equals(attributedStringReference.string));

          // // Clone the attributed string, making a copy of its string data and attributes
          var attributedStringClone = attributedString.clone();
          expect("Hello Olá こんにちは", equals(attributedStringClone.string));

          // Modify the attributed string's attributes, verify it and the reference change, but the clone and original do not
          var range = SwiftRange(
              attributedString.characters.indexAfter(attributedString.startIndex), 
              attributedString.characters.indexBefore(attributedString.endIndex)
          );
          expect(
              ["Hello", " ", "Olá", " ", "こんにちは"],
              equals(attributedString.runs.map((run) => attributedString[run.range].string))
          );
          attributedString.replaceSubrange(
              range, 
              AttributedString.create(attributedString[range].string, attributes: AttributeContainer.createEmpty())
          );
          expect(
              ["H", "ello Olá こんにち", "は"],
              equals(attributedString.runs.map((run) => attributedString[run.range].string))
          );
          expect(3, attributedString.runs.toList().length);
          expect(3, attributedStringReference.runs.toList().length);
          expect(5, attributedStringClone.runs.toList().length); // Unchanged
          expect(5, AttributedStrings.polyglot.runs.toList().length); // Unchanged

          // Modify the attributed string's string data, verify it and the reference change, but the clone and original do not
          attributedString.replaceSubrange(range, AttributedString.create("i18n"));
          expect(
              ["H", "i18n", "は"],
              equals(attributedString.runs.map((run) => attributedString[run.range].string))
          );
          expect("Hi18nは", equals(attributedString.string));
          expect("Hi18nは", equals(attributedStringReference.string));
          expect("Hello Olá こんにちは", equals(attributedStringClone.string)); // Unchanged
          expect("Hello Olá こんにちは", equals(AttributedStrings.polyglot.string)); // Unchanged

          // Modify the clone's string data, verify it changes (merging the first 2 but not last 2 runs), but the attributed string, reference, and original do not
          attributedStringClone.insert(AttributedString.create("clone", attributes: attributedStringClone.runs.first.attributes), attributedStringClone.startIndex);
          attributedStringClone.insert(AttributedString.create("enolc"), attributedStringClone.endIndex);
          expect(
              ["cloneHello", " ", "Olá", " ", "こんにちは", "enolc"],
              equals(attributedStringClone.runs.map((run) => attributedStringClone[run.range].string))
          );
          expect("Hi18nは", equals(attributedString.string)); // Unchanged
          expect("Hi18nは", equals(attributedStringReference.string)); // Unchanged
          expect("cloneHello Olá こんにちはenolc", equals(attributedStringClone.string));
          expect("Hello Olá こんにちは", equals(AttributedStrings.polyglot.string)); // Unchanged
      });

      test('testMutabilityVariants', () {
            var attributedString = AttributedStrings.polyglot;
            expect("Hello Olá こんにちは", equals(attributedString.string));

            attributedString.append(AttributedString.create(" "));
            expect("Hello Olá こんにちは ", equals(attributedString.string));

            attributedString.appendSubstring(attributedString[attributedString.runs.first.range]);
            expect("Hello Olá こんにちは Hello", equals(attributedString.string));

            var es = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "es").asContainer();
            attributedString.insert(AttributedString.create("Hola", attributes: es), attributedString.runs.last.range.lowerBound);
            expect("Hello Olá こんにちは HolaHello", equals(attributedString.string));

            var firstSpaceRange = SwiftRange(
                attributedString.runs.first.range.upperBound, 
                attributedString.characters.indexAfter(attributedString.runs.first.range.upperBound)
            );
            attributedString.insertSubstring(attributedString[firstSpaceRange], attributedString.runs.last.range.lowerBound);
            expect("Hello Olá こんにちは Hola Hello", equals(attributedString.string));

            attributedString.replaceSubrange(attributedString.runs.first.range, AttributedStrings.chinese);
            expect("你好 Olá こんにちは Hola Hello", equals(attributedString.string));

            var emoji = AttributedStrings.emojiMulti;
            var flagRange = SwiftRange(emoji.characters.indexBefore(emoji.endIndex), emoji.endIndex);
            attributedString.replaceSubrangeWithSubstring(attributedString.runs.last.range, emoji[flagRange]);
            expect("你好 Olá こんにちは Hola 🇺🇸", equals(attributedString.string));

            attributedString.removeSubrange(attributedString.runs.first.range);
            expect(" Olá こんにちは Hola 🇺🇸", equals(attributedString.string));
      });

      test('testAttributeMergeReplace', () {
          var empty = AttributeContainer.createEmpty();
          var en = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en").asContainer();
          var pt = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "pt").asContainer();
          var ja = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "ja").asContainer();

          var attributedString = AttributedStrings.polyglot;
          var runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(5, equals(runRanges.length));
          expect(AttributedString.create("Hello", attributes: en).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create(" ", attributes: empty).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create("Olá", attributes: pt).substring, equals(attributedString[runRanges[2]]));
          expect(AttributedString.create(" ", attributes: empty).substring, equals(attributedString[runRanges[3]]));
          expect(AttributedString.create("こんにちは", attributes: ja).substring, equals(attributedString[runRanges[4]]));

          attributedString.replaceSubrange(
              runRanges[1], 
              AttributedString.create(
                  attributedString[runRanges[1]].string, 
                  attributes: attributedString.runs.elementAtPosition(runRanges[0].lowerBound).attributes
              )
          );
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(4, equals(runRanges.length));
          expect(AttributedString.create("Hello ", attributes: en).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create("Olá", attributes: pt).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create(" ", attributes: empty).substring, equals(attributedString[runRanges[2]]));
          expect(AttributedString.create("こんにちは", attributes: ja).substring, equals(attributedString[runRanges[3]]));

          attributedString.setAttributesForRange(runRanges[2], attributedString.runs.elementAtPosition(runRanges[1].lowerBound).attributes);
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(3, equals(runRanges.length));
          expect(AttributedString.create("Hello ", attributes: en).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create("Olá ", attributes: pt).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create("こんにちは", attributes: ja).substring, equals(attributedString[runRanges[2]]));

          var mangleStartIndex = attributedString.characters.indexAfter(attributedString.startIndex);
          var mangleEndIndex = attributedString.characters.indexBefore(attributedString.endIndex);
          var mangleRange = SwiftRange(mangleStartIndex, mangleEndIndex);
          attributedString.setAttributesForRange(mangleRange, empty);
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(3, equals(runRanges.length));
          expect(AttributedString.create("H", attributes: en).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create("ello Olá こんにち", attributes: empty).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create("は", attributes: ja).substring, equals(attributedString[runRanges[2]]));

          var linkAttribute = AttributeContainer_FoundationAttributes.withAttributes(link: Uri.parse("https://www.google.com"));
          var enLink = linkAttribute;
          enLink.languageIdentifier = "en";
          attributedString.mergeAttributesForRange(runRanges[0], linkAttribute.asContainer());
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(3, equals(runRanges.length));
          expect(AttributedString.create("H", attributes: enLink.asContainer()).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create("ello Olá こんにち", attributes: empty).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create("は", attributes: ja).substring, equals(attributedString[runRanges[2]]));

          var jaLink = linkAttribute;
          jaLink.languageIdentifier = "ja";
          attributedString.replaceAttributesForRange(runRanges[0], en, ja);
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(3, equals(runRanges.length));
          expect(AttributedString.create("H", attributes: jaLink.asContainer()).substring, equals(attributedString[runRanges[0]]));
          expect(AttributedString.create("ello Olá こんにち", attributes: empty).substring, equals(attributedString[runRanges[1]]));
          expect(AttributedString.create("は", attributes: ja).substring, equals(attributedString[runRanges[2]]));

          attributedString.setAttributesForRange(attributedString.runs.first.range, empty);
          attributedString.setAttributesForRange(attributedString.runs.last.range, empty);
          runRanges = attributedString.runs.map((run) => run.range).toList();
          expect(1, equals(runRanges.length));
          expect(AttributedString.create("Hello Olá こんにちは", attributes: empty), equals(attributedString));
      });

      test('testAttributeMergeReplaceWhole', () {
            var empty = AttributeContainer.createEmpty();
            var en = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en").asContainer();
            var pt = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "pt").asContainer();
            var ja = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "ja").asContainer();

            var attributedString = AttributedStrings.polyglot;
            var runRanges = attributedString.runs.map((run) => run.range).toList();
            expect(5, runRanges.length);
            expect(AttributedString.create("Hello", attributes: en).substring, equals(attributedString[runRanges[0]]));
            expect(AttributedString.create(" ", attributes: empty).substring, equals(attributedString[runRanges[1]]));
            expect(AttributedString.create("Olá", attributes: pt).substring, equals(attributedString[runRanges[2]]));
            expect(AttributedString.create(" ", attributes: empty).substring, equals(attributedString[runRanges[3]]));
            expect(AttributedString.create("こんにちは", attributes: ja).substring, equals(attributedString[runRanges[4]]));

            var uri = Uri.parse("http://www.google.com");
            var link = AttributeContainer_FoundationAttributes.withAttributes(link: uri).asContainer();
            var enLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en", link: uri).asContainer();
            var ptLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "pt", link: uri).asContainer();
            var jaLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "ja", link: uri).asContainer();

            attributedString.mergeAttributes(link);
            runRanges = attributedString.runs.map((run) => run.range).toList();
            expect(5, equals(runRanges.length));
            expect(AttributedString.create("Hello", attributes: enLink).substring, attributedString[runRanges[0]]);
            expect(AttributedString.create(" ", attributes: link).substring, attributedString[runRanges[1]]);
            expect(AttributedString.create("Olá", attributes: ptLink).substring, attributedString[runRanges[2]]);
            expect(AttributedString.create(" ", attributes: link).substring, attributedString[runRanges[3]]);
            expect(AttributedString.create("こんにちは", attributes: jaLink).substring, attributedString[runRanges[4]]);

            var otherURI = Uri.parse("http://www.bing.com");
            var otherLink = AttributeContainer_FoundationAttributes.withAttributes(link: otherURI).asContainer();
            var enOtherLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "en", link: otherURI).asContainer();
            var ptOtherLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "pt", link: otherURI).asContainer();
            var jaOtherLink = AttributeContainer_FoundationAttributes.withAttributes(languageIdentifier: "ja", link: otherURI).asContainer();
            
            attributedString.replaceAttributes(link, otherLink);
            runRanges = attributedString.runs.map((run) => run.range).toList();
            expect(5, equals(runRanges.length));
            expect(AttributedString.create("Hello", attributes: enOtherLink).substring, attributedString[runRanges[0]]);
            expect(AttributedString.create(" ", attributes: otherLink).substring, attributedString[runRanges[1]]);
            expect(AttributedString.create("Olá", attributes: ptOtherLink).substring, attributedString[runRanges[2]]);
            expect(AttributedString.create(" ", attributes: otherLink).substring, attributedString[runRanges[3]]);
            expect(AttributedString.create("こんにちは", attributes: jaOtherLink).substring, attributedString[runRanges[4]]);

            attributedString.setAttributes(empty);
            runRanges = attributedString.runs.map((run) => run.range).toList();
            expect(1, equals(runRanges.length));
            expect(AttributedString.create("Hello Olá こんにちは"), attributedString);
        });

        test('testAttributedStringPuttingTypesIntoQuestionablePlaces', () {
          var a = AttributedString_PuttingTypesIntoQuestionablePlaces(x: "corgle");
          var b = AttributedString_PuttingTypesIntoQuestionablePlaces(x: "garply");
          // var c = a.shallowCopy();
          var c = a;
          expect(c, equals(a));

          a = AttributedString_PuttingTypesIntoQuestionablePlaces(x: "quxx");

          // struct reference 'a' itself is mutable, but struct property x is immutable because it's marked as 'final'
          // compiler will not allow a.x = "something else";
          expect(a.x, equals("quxx"));
          expect(a.toString(), equals("AttributedString_PuttingTypesIntoQuestionablePlaces(x: quxx)"));
          a = b;
          expect(a.toString(), equals("AttributedString_PuttingTypesIntoQuestionablePlaces(x: garply)"));
          expect(c.toString(), equals("AttributedString_PuttingTypesIntoQuestionablePlaces(x: corgle)"));
          expect(c != a, true);
          expect(c != b, true);
          expect(a.hashCode, equals(b.hashCode));
          expect(c.hashCode != b.hashCode, true);

          expect(a.testCall(), equals(42));
          expect(b.testCall(), equals(42));
          expect(c.testCall(), equals(42));
        });
  });
}
