using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ClassTests {
        [Fact]
        void testEmptyStruct() {
            var a1 = EmptyClass1.Create();
            var a2 = EmptyClass1.Create();
            Assert.Equal("Blarg!", a1.GetBlarg());
            Assert.Equal("<wibble>*Wobble*", a1.GetWibbledyWobbledyTimeyWhimey());
            Assert.Equal("Shme! Hand me my hook.", a1.Shme());
            Assert.Equal("Go Gorp!", a1.Gorpers());

            var b1 = EmptyClass2.Make();
            Assert.Equal("Gralb!", b1.GetBlorg());
            Assert.Equal("<timey>*Whimey*", b1.GetWibble());
            Assert.Equal("Shme? What's that ticking sound?", b1.Shmee());
            Assert.Equal("Stop Sreprog!", b1.Gorp());

            Assert.Equal(a1.ToString(), a2.ToString());

            Assert.NotEqual(a1.ToString(), b1.ToString());
        }
    }
}
