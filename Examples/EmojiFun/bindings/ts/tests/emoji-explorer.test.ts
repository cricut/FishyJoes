import { EmojiFun } from 'EmojiFun';

test('hello', () => {
    expect(EmojiFun.EmojiExplorer.hello).toBe("👋🌎");
});

test('construction', () => {
    const explorer = EmojiFun.EmojiExplorer.create(128);
    expect(explorer.known.size).toBe(128);
    expect(Array.from(explorer.known.values()).sort()).toEqual([
        "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳", "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
        "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
        "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺", "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
        "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿", "⬛", "⬜", "⭐", "⭕", "🀄", "🃏", "🆎", "🆑",
        "🆒", "🆓", "🆔", "🆕", "🆖", "🆗", "🆘", "🆙", "🆚", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬",
        "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼",
        "🇽", "🇾", "🇿", "🈁", "🈚", "🈯", "🈲", "🈳", "🈴", "🈵", "🈶", "🈸", "🈹", "🈺", "🉐", "🉑",
        "🌀", "🌁", "🌂", "🌃", "🌄", "🌅", "🌆", "🌇", "🌈", "🌉", "🌊", "🌋", "🌌", "🌍", "🌎", "🌏",
    ].sort());

    expect(EmojiFun.EmojiExplorer.create(0).known.size).toBe(0);
    expect(EmojiFun.EmojiExplorer.create(-1).known.size).toBe(0);
    expect(EmojiFun.EmojiExplorer.create(1431 + 50).known.size).toBeGreaterThanOrEqual(1431);
});

test('random', () => {
    const explorer = EmojiFun.EmojiExplorer.create(128);
    for (let i = 0; i < 100; i++) {
        expect(explorer.random().length).toBeGreaterThan(0);
    }

    expect(EmojiFun.EmojiExplorer.create(0).random()).toBe(EmojiFun.EmojiExplorer.hello);
});

test('randomUnique', () => {
    const count = 128;
    const explorer = EmojiFun.EmojiExplorer.create(count);

    const reported: string[] = [];
    for (let i = 0; i < explorer.known.size; i++) {
        const emoji = explorer.randomUnique();
        if (emoji !== undefined) {
            reported.push(emoji);
        }
    }

    expect(reported.length).toBe(count);
    expect(reported.sort()).toEqual(Array.from(explorer.known.values()).sort());
});

test('enumerateKnown', () => {
    const count = 128;
    const explorer = EmojiFun.EmojiExplorer.create(count);

    const reported: string[] = [];
    explorer.enumerateKnown(s => {
        reported.push(s);
        return true;
    });

    expect(reported.length).toBe(count);
    expect(reported.sort()).toEqual(Array.from(explorer.known.values()).sort());

    let earlyExitReportedCount = 0;
    explorer.enumerateKnown(s => {
        earlyExitReportedCount += 1;
        return earlyExitReportedCount < 50;
    });
    expect(earlyExitReportedCount).toBe(50);
});
