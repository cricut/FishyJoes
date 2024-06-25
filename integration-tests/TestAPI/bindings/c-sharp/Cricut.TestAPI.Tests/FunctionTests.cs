using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class FunctionTests {
        [Fact]
        void testConst42() {
            Assert.Equal(42, Functions.Const42());
        }

        [Fact]
        void testAbs() {
            Assert.Equal(3, Functions.Abs(-3));
        }

        [Fact]
        void testIntCompose() {
            var composed = Functions.IntCompose(x => x + 1, x => x * 3);
            Assert.Equal(10, composed(3));
            Assert.Equal(7, composed(2));
        }

        class ComposeError: Exception {}

        [Fact]
        void testExceptionInCompose() {
            var composed = Functions.IntCompose(_=> throw new ComposeError(), x => x);
            Assert.Throws<ComposeError>(() => composed(3));
        }

        [Fact]
        void testTheRestOfTheFunctions() {
            Assert.Equal(8.5, Functions.Add3Things(3f, 4.5, 1));
            Assert.Equal(new string[] { "a", "b", "c", "d" }, Functions.MakeList("a", "b", "c", "d"));
            Assert.Equal(84, Functions.FifthThing("hi", 1, 1.0, "...", () => 84)());
            Assert.Equal(17, Functions.SixthThing("hi", 1, 1.0, "...", () => 84, 17));
        }

        [Fact]
        void testPassingFunctionsToSwift() {
            Assert.Equal("8", Functions.Exercise0(() => 8));
            Assert.Equal("3", Functions.Exercise1(x => -x));
            Assert.Equal("25", Functions.Exercise2((f, g) => x => f(g(x))));
            Assert.Equal("7.4", Functions.Exercise3((a, b, c) => a + b + c));
            Assert.Equal("[\"a\", \"b\", \"c\", \"d\"]", Functions.Exercise4((a, b, c, d) => new string[] { a, b, c, d }));
            Assert.Equal("83", Functions.Exercise5((_, _, _, _, f) => f));
            Assert.Equal("42", Functions.Exercise6((_, _, _, _, _, i) => i));
        }

        [Fact]
        void testSwiftThrows() {
            Assert.Throws<Exception>(() => Functions.WillThrow());
        }

        [Fact]
        void TestThunkMaker() {
            var timesCalled = 0;
            var thunk = Functions.ThunkTwiceMaker(() => { timesCalled++; });
            thunk();
            Assert.Equal(2, timesCalled);
        }
    }
}
