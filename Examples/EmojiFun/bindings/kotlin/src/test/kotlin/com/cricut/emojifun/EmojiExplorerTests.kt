package com.cricut.emojifun

import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test

internal class EmojiExplorerTests {
    @Test
    fun hello() {
        assertEquals(EmojiExplorer.hello, "👋🌎")
    }

    @Test
    fun construction() {
        val explorer = EmojiExplorer.create(128)
        assertEquals(explorer.known.count(), 128)
        assertEquals(explorer.known, hashSetOf(
            "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳", "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
            "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
            "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺", "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
            "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿", "⬛", "⬜", "⭐", "⭕", "🀄", "🃏", "🆎", "🆑",
            "🆒", "🆓", "🆔", "🆕", "🆖", "🆗", "🆘", "🆙", "🆚", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬",
            "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼",
            "🇽", "🇾", "🇿", "🈁", "🈚", "🈯", "🈲", "🈳", "🈴", "🈵", "🈶", "🈸", "🈹", "🈺", "🉐", "🉑",
            "🌀", "🌁", "🌂", "🌃", "🌄", "🌅", "🌆", "🌇", "🌈", "🌉", "🌊", "🌋", "🌌", "🌍", "🌎", "🌏",
        ))

        assertTrue(EmojiExplorer.create(0).known.isEmpty())
        assertTrue(EmojiExplorer.create(-1).known.isEmpty())
        assertTrue(EmojiExplorer.create(1212 + 50).known.count() >= 1212)
    }

    @Test
    fun random() {
        val explorer = EmojiExplorer.create(128)
        for (i in 0..<100) {
            assertFalse(explorer.random().isEmpty())
        }

        assertEquals(EmojiExplorer.create(0).random(), EmojiExplorer.hello)
    }

    @Test
    fun randomUnique() {
        val count = 128L
        val explorer = EmojiExplorer.create(count)

        val reported = ArrayList<String>()
        for (i in 0..<explorer.known.count()) {
            val emoji = explorer.randomUnique()
            if (emoji != null) {
                reported.add(emoji)
            }
        }

        assertEquals(reported.count(), count.toInt())
        assertEquals(reported.toHashSet(), explorer.known)
    }

    @Test
    fun enumerateKnown() {
        val count = 128L
        val explorer = EmojiExplorer.create(count)

        val reported = ArrayList<String>()
        explorer.enumerateKnown() { s ->
            reported.add(s)
            true
        }

        assertEquals(reported.count(), count.toInt())
        assertEquals(reported.toHashSet(), explorer.known)

        var earlyExitReportedCount = 0
        explorer.enumerateKnown() { s ->
            earlyExitReportedCount += 1
            earlyExitReportedCount < 50
        }
        assertEquals(earlyExitReportedCount, 50)
    }
}
