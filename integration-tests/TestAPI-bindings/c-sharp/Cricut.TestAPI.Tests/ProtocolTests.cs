using System;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testBasic() {
            Console.WriteLine("Well, hello");
            Assert.Equal(9, 9);
        }
    }
}
