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

            System.Diagnostics.Debug.WriteLine($"a: {a}");
            
            // var b = a.Bar(x: 2, y: 128);
            // System.Diagnostics.Debug.WriteLine($"b: {b}");
        }
    }
}
