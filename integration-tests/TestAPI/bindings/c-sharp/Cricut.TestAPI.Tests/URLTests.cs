using System;
using Xunit;
using Cricut.FishyJoesRuntime;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class URLTests {
        [Fact]
        void testURLValues() {
            Assert.Equal(new Uri("https://www.google.com"), URLs.Simple);
            Assert.Equal(new Uri("https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"), URLs.RemoteFile);
            Assert.Equal(new Uri("file:///Users/someuser/Desktop/a.png"), URLs.LocalFile);
        }

        [Fact]
        void testURLEcho() {
            Assert.Equal(URLs.Simple, URLs.Echo(URLs.Simple));
            Assert.Equal(URLs.RemoteFile, URLs.Echo(URLs.RemoteFile));
            Assert.Equal(URLs.LocalFile, URLs.Echo(URLs.LocalFile));
        }
    }
}
