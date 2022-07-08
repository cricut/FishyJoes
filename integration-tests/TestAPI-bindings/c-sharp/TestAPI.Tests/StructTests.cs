using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    public class StructTests {
        [Fact]
        void testConstruction() {
            var memberwise = Structs.MemberwiseStruct.create();
            Assert.Equal("Eternal", memberwise.immutable);
            Assert.Equal("Fickle", memberwise.mutable);

            var reference = Structs.ReferenceStruct.create();
            Assert.Equal("Eternal", reference.immutable);
            Assert.Equal("Fickle", reference.mutable);
        }

        [Fact]
        void testMutablility() {
            var memberwise = Structs.MemberwiseStruct.create();
            Assert.Equal("Eternal", memberwise.immutable);
            // TODO: Ensure this is true!
            // memberwise.immutable = "Should generate a compile Error!"
            Assert.Equal("Fickle", memberwise.mutable);
            memberwise.mutable = "Fickle as the wind";
            Assert.NotEqual("Fickle", memberwise.mutable);

            var reference = Structs.ReferenceStruct.create();
            Assert.Equal("Eternal", reference.immutable);
            // TODO: Ensure this is true!
            // reference.immutable = "Should generate a compile Error!"
            Assert.Equal("Fickle", reference.mutable);
            memberwise.mutable = "Fickle as the wind";
            Assert.NotEqual("Fickle", memberwise.mutable);
        }

        [Fact]
        void testEquality() {
            Assert.Equal(Structs.MemberwiseStruct.create(), Structs.MemberwiseStruct.create());
            Assert.Equal(Structs.ReferenceStruct.create(), Structs.ReferenceStruct.create());
            Assert.NotEqual<object>(Structs.MemberwiseStruct.create(), Structs.ReferenceStruct.create());
        }
    }
}
