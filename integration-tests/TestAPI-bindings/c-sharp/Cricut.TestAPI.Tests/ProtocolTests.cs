using System;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testAProtocol() {
            int nProcessId = System.Diagnostics.Process.GetCurrentProcess().Id;
            System.Diagnostics.Debug.WriteLine($"nProcessId: {nProcessId}");

            var a = new AProtocolImplementation(Foo: "Garply", Baz: false);
            Assert.Equal("Garply", a.Foo);
            Assert.False(a.Baz);

            var b = a.Bar(x: 2, y: 128);
            Assert.Equal("130", b.Foo);
            Assert.True(b.Baz);

            //Assert.Equal("-312 notBazzed", a.hasADefaultImplementation(9, -102.1));
        }
    }
}
