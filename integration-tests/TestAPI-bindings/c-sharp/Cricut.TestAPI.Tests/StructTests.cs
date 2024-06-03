using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class StructTests {
        [Fact]
        void testEmptyStruct() {
            var a1 = EmptyStruct.Create();
            Assert.Equal(35671, a1.GetTutu());
            Assert.Equal("Toodles! ta ta for now...", a1.GetTatiana());
            Assert.Equal("The Netherlands", a1.Aap());

            var a2 = EmptyStruct.Create();
            Assert.Equal(35671, a2.GetTutu());
            Assert.Equal("Toodles! ta ta for now...", a2.GetTatiana());
            Assert.Equal("The Netherlands", a2.Aap());

            Assert.Equal(a1, a2);
            Assert.Equal(a1.GetHashCode(), a2.GetHashCode());
            Assert.Equal(a1.ToString(), a2.ToString());

            var b1 = EmptyStruct2.Create();
            Assert.Equal(12897, b1.GetTutu());
            Assert.Equal("Arrivederci", b1.GetTatiana());
            Assert.Equal("The Netherlands2", b1.Aap());
            Assert.Equal("Cambridge University (England)2", b1.Zxccxz());

            Assert.Equal("EmptyStruct2 { }", b1.ToString());

            Assert.NotEqual(a1.GetHashCode(), b1.GetHashCode());
        }

        [Fact]
        void testConstruction() {
            var memberwise = Structs.MemberwiseStruct.Create();
            Assert.Equal("Eternal", memberwise.Immutable);
            Assert.Equal("Fickle", memberwise.Mutable);

            var reference = Structs.ReferenceStruct.Create();
            Assert.Equal("Eternal", reference.Immutable);
            Assert.Equal("Fickle", reference.Mutable);
        }

        [Fact]
        void testMutablility() {
            var memberwise = Structs.MemberwiseStruct.Create();
            Assert.Equal("Eternal", memberwise.Immutable);
            // TODO: Ensure this is true!
            // memberwise.immutable = "Should generate a compile Error!"
            Assert.Equal("Fickle", memberwise.Mutable);
            memberwise.Mutable = "Fickle as the wind";
            Assert.NotEqual("Fickle", memberwise.Mutable);

            var reference = Structs.ReferenceStruct.Create();
            Assert.Equal("Eternal", reference.Immutable);
            // TODO: Ensure this is true!
            // reference.immutable = "Should generate a compile Error!"
            Assert.Equal("Fickle", reference.Mutable);
            memberwise.Mutable = "Fickle as the wind";
            Assert.NotEqual("Fickle", memberwise.Mutable);
        }

        [Fact]
        void testEquality() {
            Assert.Equal(Structs.MemberwiseStruct.Create(), Structs.MemberwiseStruct.Create());
            Assert.Equal(Structs.ReferenceStruct.Create(), Structs.ReferenceStruct.Create());
            Assert.NotEqual<object>(Structs.MemberwiseStruct.Create(), Structs.ReferenceStruct.Create());
        }
    }
}
