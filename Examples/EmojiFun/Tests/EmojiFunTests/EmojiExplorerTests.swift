import Testing
import EmojiFun

@Test func hello() throws {
    #expect(!EmojiExplorer.hello.isEmpty)
    #expect(EmojiExplorer.hello.unicodeScalars.allSatisfy { $0.properties.isEmoji })
}

@Test func construction() {
    let explorer = EmojiExplorer.init(count: 128)
    #expect(explorer.known.count == 128)
    #expect(explorer.known.allSatisfy { $0.unicodeScalars.contains { $0.properties.isEmoji } })
    #expect(explorer.known == [
        "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳", "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
        "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
        "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺", "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
        "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿", "⬛", "⬜", "⭐", "⭕", "🀄", "🃏", "🆎", "🆑",
        "🆒", "🆓", "🆔", "🆕", "🆖", "🆗", "🆘", "🆙", "🆚", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬",
        "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼",
        "🇽", "🇾", "🇿", "🈁", "🈚", "🈯", "🈲", "🈳", "🈴", "🈵", "🈶", "🈸", "🈹", "🈺", "🉐", "🉑",
        "🌀", "🌁", "🌂", "🌃", "🌄", "🌅", "🌆", "🌇", "🌈", "🌉", "🌊", "🌋", "🌌", "🌍", "🌎", "🌏",
    ])

    #expect(EmojiExplorer.init(count: 0).known.isEmpty)
    #expect(EmojiExplorer.init(count: -1).known.isEmpty)
    #expect(EmojiExplorer.init(count: 1212 + 50).known.count >= 1212)
}

@Test func random() throws {
    let explorer = EmojiExplorer.init(count: 128)
    for _ in 0..<100 {
        #expect(explorer.random().unicodeScalars.contains { $0.properties.isEmoji })
    }

    #expect(EmojiExplorer.init(count: 0).random() == EmojiExplorer.hello)
}

@Test func randomUnique() throws {
    let count = 128
    var explorer = EmojiExplorer.init(count: count)

    var reported: [String] = []
    for _ in 0..<explorer.known.count {
        let emoji = explorer.randomUnique()
        reported.append(try #require(emoji))
    }
    
    #expect(reported.count == count)
    #expect(Set(reported) == explorer.known)
}

@Test func enumerateKnown() throws {
    let count = 128
    let explorer = EmojiExplorer.init(count: count)

    var reported: [String] = []
    explorer.enumerateKnown { s in
        reported.append(s)
        return true
    }

    #expect(reported.count == count)
    #expect(Set(reported) == explorer.known)

    var earlyExitReportedCount = 0
    explorer.enumerateKnown { s in
        earlyExitReportedCount += 1
        return earlyExitReportedCount < 50
    }
    #expect(earlyExitReportedCount == 50)
}
