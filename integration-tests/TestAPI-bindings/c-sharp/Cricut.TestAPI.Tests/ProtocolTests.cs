using System;
using System.Linq;
using System.Runtime.InteropServices;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ProtocolTests {
        [Fact]
        public void testProtocolImplementation() {
            _TypeSetup._ensureLoaded();

            int nProcessId = System.Diagnostics.Process.GetCurrentProcess().Id;
            System.Diagnostics.Debug.WriteLine($"nProcessId: {nProcessId}");

            AProtocol a = new AProtocolImplementation(Foo: "Garply", Baz: false);
            Assert.Equal("Garply", a.Foo);
            Assert.False(a.Baz);

            var b = a.Bar(x: 2, y: 128);
            Assert.Equal("130", b.Foo);
            Assert.True(b.Baz);

            Assert.Equal("-312 notBazzed", a.HasADefaultImplementation(9, -102.1));
            Assert.Equal("bazzy 3", a.HasADefaultImplementation(2, 0.345));

            Assert.Equal(3.7838466771424932E9, a.HasADefaultImplementation2("923.2185", true, 0.0898714));
            Assert.Equal(1.9556754407899822E-5, a.HasADefaultImplementation2("923.2185", false, 0.0898714));

            Assert.Equal(0.9589049888649063, a.HasADefaultImplementation2("0.9870923", true, 1.123123));
            Assert.Equal(1.686253813623996, a.HasADefaultImplementation2("0.9870923", false, 1.123123));

            // var d = new AProtocolCSharpImpl("Locally Dokelly Neighborino!", true);
            // Assert.Equal("Locally Dokelly Neighborino!", d.Foo);
            // Assert.True(d.Baz);
        }

        [Fact]
        public void testProtocolEnum() {
            _TypeSetup._ensureLoaded();

            int nProcessId = System.Diagnostics.Process.GetCurrentProcess().Id;
            System.Diagnostics.Debug.WriteLine($"nProcessId: {nProcessId}");

            var testProtocolEnum = new TestProtocolEnum.Qux();
            testProtocolEnum.Foo();
            Assert.True(testProtocolEnum.Bar());
            testProtocolEnum.Baz(true);
            Assert.Equal("garply Navigate a nostril! garpity garp", testProtocolEnum.Garply("Navigate a nostril!"));
            Assert.Equal("thud: 42; grault: [1.234, 45.235890198, 892.8]", testProtocolEnum.Xyzzy(42, [1.234, 45.235890198, 892.80]));
            Assert.Equal(Tuple.Create<bool, nint, string>(false, 3, "Take a left at your intestines -<*>- Take the second right past Mars"), testProtocolEnum.Plugh(Tuple.Create(true, 3.14159265359, (System.Collections.Generic.IList<string>) new string[] {"Take a left at your intestines", "Take the second right past Mars"})));
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
