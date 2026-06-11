using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class DefaultArgumentTests {
        [Fact]
        void testDefaultArguments() {
            Assert.Equal("42 52 3.14", DefaultArguments.EchoDefaults(null));
            Assert.Equal("42 52 3.14", DefaultArguments.EchoDefaults(null, y: null));
            Assert.Equal("1 52 3.14", DefaultArguments.EchoDefaults(1));
            Assert.Equal("1 52 42.0", DefaultArguments.EchoDefaults(1, z: 42.0));
            Assert.Equal("42 8 3.14", DefaultArguments.EchoDefaults(null, y: 8));
            Assert.Equal("1 2 4.8", DefaultArguments.EchoDefaults(1, z: 4.8, y: 2));
        }

        [Fact]
        void testPlatformWidthIntegerLimitDefaults() {
            // Swift `Int` is word-sized, like `nint`, so the defaults must match this platform's limits
            Assert.Equal($"{nint.MinValue} {nint.MaxValue}", DefaultArguments.EchoDefaultIntLimits());
            Assert.Equal($"7 {nint.MaxValue}", DefaultArguments.EchoDefaultIntLimits(minValue: 7));
            Assert.Equal($"{nint.MaxValue}", DefaultArguments.EchoExplicitIntMax());
            Assert.Equal("7", DefaultArguments.EchoExplicitIntMax(7));
        }
    }
}
