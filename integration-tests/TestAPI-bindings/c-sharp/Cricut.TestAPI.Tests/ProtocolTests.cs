using System;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testAProtocol() {
            _TypeSetup._ensureLoaded();

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

            var d = new AProtocolCSharpImpl("Locally Dokelly Neighborino!", true);
            Assert.Equal("Locally Dokelly Neighborino!", d.Foo);
            Assert.True(d.Baz);
        }
    }

    public record AProtocolCSharpImpl: AProtocol {
        public string Foo { get; set; }
        public bool Baz { get; set; }

        public AProtocolCSharpImpl(
            string Foo,
            bool Baz
        ) {
            this.Foo = Foo;
            this.Baz = Baz;
        }

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public Cricut.TestAPI.AProtocol Bar(
            nint x,
            nint y
        ) {
            return new AProtocolCSharpImpl("what", false);
        }

        //static AProtocolCSharpImpl() { _TypeSetup._ensureLoaded(); }
    }
}
