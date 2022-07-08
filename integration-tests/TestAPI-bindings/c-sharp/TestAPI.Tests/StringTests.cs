using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    public class StringTests {
        [Fact]
        void testStringValues() {
            Assert.Equal("Hello", Strings.simple);
            Assert.Equal("Olá", Strings.accent);
            Assert.Equal("こんにちは", Strings.script);
            Assert.Equal("你好", Strings.chinese);
            Assert.Equal("豈更車賈滑", Strings.chineseBMP);
            Assert.Equal("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", Strings.chineseSIP);
            Assert.Equal("🤯🐶🍓", Strings.emoji);
            Assert.Equal("👨‍👩‍👧‍👦👍🏿🇺🇸", Strings.emojiMulti);
        }

        [Fact]
        void testStringEcho() {
            Assert.Equal(Strings.simple, Strings.echo(Strings.simple));
            Assert.Equal(Strings.accent, Strings.echo(Strings.accent));
            Assert.Equal(Strings.chinese, Strings.echo(Strings.chinese));
            Assert.Equal(Strings.chineseBMP, Strings.echo(Strings.chineseBMP));
            Assert.Equal(Strings.chineseSIP, Strings.echo(Strings.chineseSIP));
            Assert.Equal(Strings.emoji, Strings.echo(Strings.emoji));
            Assert.Equal(Strings.emojiMulti, Strings.echo(Strings.emojiMulti));
        }
    }
}
