using System;
using Xunit;
using Cricut.TestAPI;

/*
namespace TestAPI.Tests {
    public class EnumTests {
        [Fact]
        void testEmptyEnum() {
            assertThrows<Error> {
                EmptyEnum.notGoingToHappen();
            }
        }

        [Fact]
        void testSimpleEnum() {
            Assert.Equal(0xff0000, SimpleEnum.Red.hex);
            Assert.Equal(0x00ff00, SimpleEnum.Green.hex);
            Assert.Equal(0x0000ff, SimpleEnum.Blue.hex);
            Assert.Equal(SimpleEnum.Red, SimpleEnum.pickAColor(0));
            Assert.Equal(SimpleEnum.Green, SimpleEnum.pickAColor(1));
            Assert.Equal(SimpleEnum.Blue, SimpleEnum.pickAColor(2));
        }

        [Fact]
        void testAssociatedDataEnum() {
            void shape1(x: Long) = AssociatedDataEnum.Thing(x);
            void shape2(x: String, y: String, z: Long) = AssociatedDataEnum.Bar(x, AssociatedDataEnum.Other(y, z));

            Assert.Equal(4, shape1(4).intValue);
            Assert.Equal(11, shape2("hello", "world", 8).intValue);
            Assert.Equal(shape1(9), shape1(2).plus(shape2("x", "y", 4)));
            Assert.Equal(shape2("y","z", 7), shape2("y", "z", 2).plus(shape1(5)));
        }
    }
}
*/