using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class EnumTests {
        [Fact]
        void testEmptyEnum() {
            Assert.Throws<Exception>(() => EmptyEnum.NotGoingToHappen());
            Assert.Equal(54546, EmptyEnum.GetAStaticProperty());
            Assert.Equal(62645, EmptyEnum.AStaticMethod());
        }

        [Fact]
        void testReferenceEmptyEnum() {
            Assert.Throws<Exception>(() => ReferenceEmptyEnum.NotGoingToHappen());
            Assert.Equal(5, ReferenceEmptyEnum.GetAStaticProperty());
            Assert.Equal(6, ReferenceEmptyEnum.AStaticMethod());
        }

        [Fact]
        void testSimpleEnum() {
            Assert.Equal(0xff0000, new SimpleEnum.Red().GetHex());
            Assert.Equal(0x00ff00, new SimpleEnum.Green().GetHex());
            Assert.Equal(0x0000ff, new SimpleEnum.Blue().GetHex());
            Assert.Equal(new SimpleEnum.Red(), SimpleEnum.PickAColor(0));
            Assert.Equal(new SimpleEnum.Green(), SimpleEnum.PickAColor(1));
            Assert.Equal(new SimpleEnum.Blue(), SimpleEnum.PickAColor(2));
        }

        [Fact]
        void testAssociatedDataEnum() {
            Func<nint, AssociatedDataEnum> shape1 = x => new AssociatedDataEnum.Thing(x);
            Func<string, string, nint, AssociatedDataEnum> shape2 = (x, y, z) => new AssociatedDataEnum.Bar(x, new AssociatedDataEnum.Other(y, z), true);

            Assert.Equal(4, shape1(4).GetIntValue());
            Assert.Equal(11, shape2("hello", "world", 8).GetIntValue());
            Assert.Equal(shape1(9), shape1(2).Plus(shape2("x", "y", 4)));
            Assert.Equal(shape2("y","z", 7), shape2("y", "z", 2).Plus(shape1(5)));
        }
    }
}
