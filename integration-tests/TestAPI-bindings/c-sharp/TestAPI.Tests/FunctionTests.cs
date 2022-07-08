using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    public class FunctionTests {
        [Fact]
        void testConst42() {
            Assert.Equal(42, Functions.const42());
        }

        [Fact]
        void testAbs() {
            Assert.Equal(3, Functions.abs(-3));
        }

        [Fact]
        void testIntCompose() {
            var composed = Functions.intCompose(x => x + 1, x => x * 3);
            Assert.Equal(10, composed(3));
            Assert.Equal(7, composed(2));
        }

        class ComposeError: Exception {}

        [Fact]
        void testExceptionInCompose()
        {
            var composed = Functions.intCompose(_=> throw new ComposeError(), x => x);
            Assert.Throws<ComposeError>(() => composed(3));
        }

        [Fact]
        void testTheRestOfTheFunctions() {
            Assert.Equal(8.5, Functions.add3Things(3f, 4.5, 1));
            Assert.Equal(new string[] { "a", "b", "c", "d" }, Functions.makeList("a", "b", "c", "d"));
            Assert.Equal(84, Functions.fifthThing("hi", 1, 1.0, "...", () => 84)());
            Assert.Equal(17, Functions.sixthThing("hi", 1, 1.0, "...", () => 84, 17));
        }

        [Fact]
        void testPassingFunctionsToSwift() {
            Assert.Equal("8", Functions.exercise0(() => 8));
            Assert.Equal("3", Functions.exercise1(x => -x));
            Assert.Equal("25", Functions.exercise2((f, g) => x => f(g(x))));
            Assert.Equal("7.4", Functions.exercise3((a, b, c) => a + b + c ));
            Assert.Equal("[\"a\", \"b\", \"c\", \"d\"]", Functions.exercise4((a, b, c, d) => new string[] { a, b, c, d }));
            Assert.Equal("83", Functions.exercise5((_, _, _, _, f) => f));
            Assert.Equal("42", Functions.exercise6((_, _, _, _, _, i) => i));
        }

        [Fact]
        void testSwiftThrows() {
            Assert.Throws<Exception>(() => Functions.willThrow());
        }
    }
}
