import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('AttributedStringTests', () {
      test('testStringValues', () {
          expect(Strings.simple, equals("Hello"));
          expect(Strings.accent, equals("Olá"));
          expect(Strings.script, equals("こんにちは"));
          expect(Strings.chinese, equals("你好"));
          expect(Strings.chineseBMP, equals("豈更車賈滑"));
          expect(Strings.chineseSIP, equals("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04"));
          expect(Strings.emoji, equals("🤯🐶🍓"));
          expect(Strings.emojiMulti, equals("👨‍👩‍👧‍👦👍🏿🇺🇸"));
      });

      test('testStringEcho', () {
          expect(Strings.echo(Strings.simple), equals(Strings.simple));
          expect(Strings.echo(Strings.accent), equals(Strings.accent));
          expect(Strings.echo(Strings.chinese), equals(Strings.chinese));
          expect(Strings.echo(Strings.chineseBMP), equals(Strings.chineseBMP));
          expect(Strings.echo(Strings.chineseSIP), equals(Strings.chineseSIP));
          expect(Strings.echo(Strings.emoji), equals(Strings.emoji));
          expect(Strings.echo(Strings.emojiMulti), equals(Strings.emojiMulti));
      });
  });
}
