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
    }
}
