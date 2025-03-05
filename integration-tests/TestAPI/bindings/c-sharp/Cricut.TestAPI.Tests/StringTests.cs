using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class StringTests {
        [Fact]
        void testStringValues() {
            Assert.Equal("Hello", Strings.Simple);
            Assert.Equal("Olá", Strings.Accent);
            Assert.Equal("こんにちは", Strings.Script);
            Assert.Equal("你好", Strings.Chinese);
            Assert.Equal("豈更車賈滑", Strings.ChineseBMP);
            Assert.Equal("\uD840\uDC01\uD840\uDC02\uD840\uDC03\uD840\uDC04", Strings.ChineseSIP);
            Assert.Equal("🤯🐶🍓", Strings.Emoji);
            Assert.Equal("👨‍👩‍👧‍👦👍🏿🇺🇸", Strings.EmojiMulti);
        }

        [Fact]
        void testStringEcho() {
            Assert.Equal(Strings.Simple, Strings.Echo(Strings.Simple));
            Assert.Equal(Strings.Accent, Strings.Echo(Strings.Accent));
            Assert.Equal(Strings.Chinese, Strings.Echo(Strings.Chinese));
            Assert.Equal(Strings.ChineseBMP, Strings.Echo(Strings.ChineseBMP));
            Assert.Equal(Strings.ChineseSIP, Strings.Echo(Strings.ChineseSIP));
            Assert.Equal(Strings.Emoji, Strings.Echo(Strings.Emoji));
            Assert.Equal(Strings.EmojiMulti, Strings.Echo(Strings.EmojiMulti));
        }
    }
}
