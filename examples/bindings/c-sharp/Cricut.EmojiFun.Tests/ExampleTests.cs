using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace Cricut.EmojiFun.Tests
{
    public class ExampleTests
    {
        [Fact]
        public void Hello()
        {
            Assert.Equal("👋🌎", EmojiExplorer.Hello);
        }

        [Fact]
        public void Construction()
        {
            var explorer = EmojiExplorer.Create(128);
            Assert.Equal(128, explorer.Known.Count);
            Assert.True(new HashSet<string>(new string[] {
                "⌚", "⌛", "⏩", "⏪", "⏫", "⏬", "⏰", "⏳", "◽", "◾", "☔", "☕", "♈", "♉", "♊", "♋",
                "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓", "♿", "⚓", "⚡", "⚪", "⚫", "⚽", "⚾", "⛄",
                "⛅", "⛎", "⛔", "⛪", "⛲", "⛳", "⛵", "⛺", "⛽", "✅", "✊", "✋", "✨", "❌", "❎", "❓",
                "❔", "❕", "❗", "➕", "➖", "➗", "➰", "➿", "⬛", "⬜", "⭐", "⭕", "🀄", "🃏", "🆎", "🆑",
                "🆒", "🆓", "🆔", "🆕", "🆖", "🆗", "🆘", "🆙", "🆚", "🇦", "🇧", "🇨", "🇩", "🇪", "🇫", "🇬",
                "🇭", "🇮", "🇯", "🇰", "🇱", "🇲", "🇳", "🇴", "🇵", "🇶", "🇷", "🇸", "🇹", "🇺", "🇻", "🇼",
                "🇽", "🇾", "🇿", "🈁", "🈚", "🈯", "🈲", "🈳", "🈴", "🈵", "🈶", "🈸", "🈹", "🈺", "🉐", "🉑",
                "🌀", "🌁", "🌂", "🌃", "🌄", "🌅", "🌆", "🌇", "🌈", "🌉", "🌊", "🌋", "🌌", "🌍", "🌎", "🌏",
            }).SetEquals(explorer.Known));

            Assert.Equal(0, EmojiExplorer.Create(0).Known.Count);
            Assert.Equal(0, EmojiExplorer.Create(-1).Known.Count);
            Assert.True(EmojiExplorer.Create(1212 + 50).Known.Count >= 1212);
        }

        [Fact]
        public void Random()
        {
            var explorer = EmojiExplorer.Create(128);
            foreach (int index in Enumerable.Range(0, 100))
            {
                Assert.True(explorer.Random().Length > 0);
            }

            Assert.Equal(EmojiExplorer.Hello, EmojiExplorer.Create(0).Random());
        }

        [Fact]
        public void RandomUnique()
        {
            var count = 128;
            var explorer = EmojiExplorer.Create(count);

            var reported = new HashSet<string>();
            foreach (int index in Enumerable.Range(0, explorer.Known.Count))
            {
                var emoji = explorer.RandomUnique();
                if (emoji != null)
                {
                    reported.Add(emoji);
                }
            }

            Assert.Equal(count, reported.Count);
            Assert.True(reported.SetEquals(explorer.Known));
        }

        [Fact]
        public void EnumerateKnown()
        {
            var count = 128;
            var explorer = EmojiExplorer.Create(count);

            var reported = new HashSet<string>();
            explorer.EnumerateKnown(s =>
            {
                reported.Add(s);
                return true;
            });

            Assert.Equal(count, reported.Count);
            Assert.True(reported.SetEquals(explorer.Known));

            var earlyExitReportedCount = 0;
            explorer.EnumerateKnown(s =>
            {
                earlyExitReportedCount += 1;
                return earlyExitReportedCount < 50;
            });
            Assert.Equal(50, earlyExitReportedCount);
        }
    }
}
