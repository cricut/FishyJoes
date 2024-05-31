using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class StructTests {
        [Fact]
        void testEmptyStruct() {
            var a = Structs.EmptyStruct.Create();
            Assert.Equal(35671, a.GetTutu());
            Assert.Equal("The Netherlands", a.Aap());
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
