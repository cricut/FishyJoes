using System;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testAProtocol() {
            int nProcessId = System.Diagnostics.Process.GetCurrentProcess().Id;
            System.Diagnostics.Debug.WriteLine($"nProcessId: {nProcessId}");

            AProtocol a = new AProtocolImplementation(Foo: "Garply", Baz: false);
            Assert.Equal("Garply", a.Foo);
            Assert.False(a.Baz);

            var b = a.Bar(x: 2, y: 128);
            Assert.Equal("130", b.Foo);
            Assert.True(b.Baz);

            var c = a.HasADefaultImplementation(9, -102.1);
            System.Diagnostics.Debug.WriteLine($"c: {c}");
            Assert.Equal("-312 notBazzed", c);
        }
    }
}
