using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class StructTests {
        [Fact]
        void testEmptyStruct() {
            var emptyStruct1 = EmptyStruct.Create();
            Assert.Equal(35671, emptyStruct1.GetTutu());
            Assert.Equal("Toodles! ta ta for now...", emptyStruct1.GetTatiana());
            Assert.Equal("The Netherlands", emptyStruct1.Aap());

            var emptyStruct2 = EmptyStruct.Create();
            Assert.Equal(35671, emptyStruct2.GetTutu());
            Assert.Equal("Toodles! ta ta for now...", emptyStruct2.GetTatiana());
            Assert.Equal("The Netherlands", emptyStruct2.Aap());

            Assert.Equal(emptyStruct1, emptyStruct2);
            Assert.Equal(emptyStruct1.GetHashCode(), emptyStruct2.GetHashCode());
            Assert.Equal(emptyStruct1.ToString(), emptyStruct2.ToString());
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
