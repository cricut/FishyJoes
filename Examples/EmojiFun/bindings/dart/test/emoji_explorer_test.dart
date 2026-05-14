import 'package:cricut_emojifun/emojifun.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    final _ = ensureLoaded;
  });

  group('EmojiExplorerTests', () {
    test('hello', () {
        expect(EmojiExplorer.hello, equals("👋🌎"));
    });

    test('construction', () {
        var explorer = EmojiExplorer.create(128);
        expect(explorer.known.length, equals(128));
        expect(explorer.known, equals(Set.from([
            "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳", "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
            "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
            "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺", "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
            "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿", "⬛", "⬜", "⭐", "⭕", "🀄", "🃏", "🆎", "🆑",
            "🆒", "🆓", "🆔", "🆕", "🆖", "🆗", "🆘", "🆙", "🆚", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬",
            "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼",
            "🇽", "🇾", "🇿", "🈁", "🈚", "🈯", "🈲", "🈳", "🈴", "🈵", "🈶", "🈸", "🈹", "🈺", "🉐", "🉑",
            "🌀", "🌁", "🌂", "🌃", "🌄", "🌅", "🌆", "🌇", "🌈", "🌉", "🌊", "🌋", "🌌", "🌍", "🌎", "🌏",
        ])));

        expect(EmojiExplorer.create(0).known.length, equals(0));
        expect(EmojiExplorer.create(-1).known.length, equals(0));
        expect(EmojiExplorer.create(1212 + 50).known.length, greaterThan(1212));
    });

    test('random', () {
        var explorer = EmojiExplorer.create(128);
        for (var i = 0; i < 100; i++) {
            expect(explorer.random().length, greaterThan(0));
        }

        expect(EmojiExplorer.create(0).random(), equals(EmojiExplorer.hello));
    });

    test('randomUnique', () {
        const count = 128;
        var explorer = EmojiExplorer.create(count);

        var reported = <String>[];
        for (var i = 0; i < explorer.known.length; i++) {
            var emoji = explorer.randomUnique();
            if (emoji != null) {
                reported.add(emoji);
            }
        }

        expect(reported.length, equals(count));
        expect(Set.from(reported), equals(explorer.known));
    });

    test('enumerateKnown', () {
        const count = 128;
        var explorer = EmojiExplorer.create(count);

        var reported = <String>[];
        explorer.enumerateKnown((String s) {
            reported.add(s);
            return true;
        });

        expect(reported.length, equals(count));
        expect(Set.from(reported), equals(explorer.known));

        var earlyExitReportedCount = 0;
        explorer.enumerateKnown((String s) {
            earlyExitReportedCount += 1;
            return earlyExitReportedCount < 50;
        });
        expect(earlyExitReportedCount, equals(50));
    });
  });
}
