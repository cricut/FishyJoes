import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('StringTests', () {
      final simple = "Hello";
      final accent = "Olá";
      final script = "こんにちは";
      final chinese = "你好";
      final chineseBMP = "豈更車賈滑";
      final chineseSIP = "\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04";
      final emoji = "🤯🐶🍓";
      final emojiMulti = "👨‍👩‍👧‍👦👍🏿🇺🇸";

      test('testStringValues', () {
          expect(Strings.simple, equals(simple));
          expect(Strings.accent, equals(accent));
          expect(Strings.script, equals(script));
          expect(Strings.chinese, equals(chinese));
          expect(Strings.chineseBMP, equals(chineseBMP));
          expect(Strings.chineseSIP, equals(chineseSIP));
          expect(Strings.emoji, equals(emoji));
          expect(Strings.emojiMulti, equals(emojiMulti));
      });

      test('testStringEcho', () {
          expect(Strings.echo(simple), equals(Strings.simple));
          expect(Strings.echo(accent), equals(Strings.accent));
          expect(Strings.echo(chinese), equals(Strings.chinese));
          expect(Strings.echo(chineseBMP), equals(Strings.chineseBMP));
          expect(Strings.echo(chineseSIP), equals(Strings.chineseSIP));
          expect(Strings.echo(emoji), equals(Strings.emoji));
          expect(Strings.echo(emojiMulti), equals(Strings.emojiMulti));
      });
  });
}
