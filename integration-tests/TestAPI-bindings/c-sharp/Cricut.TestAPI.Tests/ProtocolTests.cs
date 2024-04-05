using System;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testAProtocol() {
            var a = new AProtocolImplementation(Foo: "Haylo!", Baz: false);
            System.Diagnostics.Debug.WriteLine($"a: {a}");
            System.Diagnostics.Debug.WriteLine("Well, hello");
            Assert.Equal(9, 9);
        }
    }
}
