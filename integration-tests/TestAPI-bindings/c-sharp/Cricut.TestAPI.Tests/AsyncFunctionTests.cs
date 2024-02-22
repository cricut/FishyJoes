using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class AsyncFunctionTests {
        // Helper to avoid warnings about trivial async functions
        private static async Task<T> Async<T>(T result) {
            await Task.Yield();
            return result;
        }

        [Fact]
        async Task testAsyncConst42() {
            Assert.Equal(42, await AsyncFunctions.Const42());
        }

        [Fact]
        async Task testAsyncAbs() {
            Assert.Equal(3, await AsyncFunctions.Abs(-3));
        }

        [Fact]
        async Task testAsyncIntCompose() {
            var composed = AsyncFunctions.IntCompose(async (x) => await Async(x + 1), async (x) => await Async(x * 3));
            Assert.Equal(10, await composed(3));
            Assert.Equal(7, await composed(2));
        }

        class ComposeError: Exception {}

        [Fact]
        async Task testAsyncExceptionInCompose() {
            var composed = AsyncFunctions.IntCompose(_=> throw new ComposeError(), async (x) => await Async(x));
            await Assert.ThrowsAsync<ComposeError>(() => composed(3));
        }

        [Fact]
        async Task testAsyncTheRestOfTheFunctions() {
            Assert.Equal(8.5, await AsyncFunctions.Add3Things(3f, 4.5, 1));
            Assert.Equal(new string[] { "a", "b", "c", "d" }, await AsyncFunctions.MakeList("a", "b", "c", "d"));
            Assert.Equal(84, await (await AsyncFunctions.FifthThing("hi", 1, 1.0, "...", async () => await Async(84)))());
            Assert.Equal(17, await AsyncFunctions.SixthThing("hi", 1, 1.0, "...", async () => await Async(84), 17));
        }

        [Fact]
        async Task testAsyncPassingFunctionsToSwift() {
            Assert.Equal("8", await AsyncFunctions.Exercise0(async () => await Async(8)));
            Assert.Equal("3", await AsyncFunctions.Exercise1(async x => await Async(-x)));
            Assert.Equal("25", await AsyncFunctions.Exercise2((f, g) => async x => await f(await g(x))));
            Assert.Equal("7.4", await AsyncFunctions.Exercise3(async (a, b, c) => await Async(a + b + c)));
            Assert.Equal("[\"a\", \"b\", \"c\", \"d\"]", await AsyncFunctions.Exercise4(async (a, b, c, d) => await Async(new[] { a, b, c, d })));
            Assert.Equal("83", await AsyncFunctions.Exercise5(async (_, _, _, _, f) => await Async(f)));
            Assert.Equal("42", await AsyncFunctions.Exercise6(async (_, _, _, _, _, i) => await Async(i)));
        }

        [Fact]
        async Task testAsyncSwiftThrows() {
            await Assert.ThrowsAsync<Exception>(async () => await AsyncFunctions.WillThrow());
        }

        [Fact]
        async Task TestThunkMaker() {
            var timesCalled = 0;
            var thunk = AsyncFunctions.ThunkTwiceMaker(async () => { await Task.Yield(); timesCalled++; });
            await thunk();
            Assert.Equal(2, timesCalled);
        }
    }
}
