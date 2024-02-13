using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class AsyncFunctionTests {
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
            var composed = AsyncFunctions.IntCompose(x => Task.FromResult(x + 1), x => Task.FromResult(x * 3));
            Assert.Equal(10, await composed(3));
            Assert.Equal(7, await composed(2));
        }

        class ComposeError: Exception {}

        [Fact]
        async Task testAsyncExceptionInCompose() {
            var composed = AsyncFunctions.IntCompose(_=> throw new ComposeError(), x => Task.FromResult(x));
            await Assert.ThrowsAsync<ComposeError>(() => composed(3));
        }

        [Fact]
        async Task testAsyncTheRestOfTheFunctions() {
            Assert.Equal(8.5, await AsyncFunctions.Add3Things(3f, 4.5, 1));
            Assert.Equal(new string[] { "a", "b", "c", "d" }, await AsyncFunctions.MakeList("a", "b", "c", "d"));
            Assert.Equal(84, await (await AsyncFunctions.FifthThing("hi", 1, 1.0, "...", () => Task.FromResult<nint>(84)))());
            Assert.Equal(17, await AsyncFunctions.SixthThing("hi", 1, 1.0, "...", () => Task.FromResult<nint>(84), 17));
        }

        [Fact]
        async Task testAsyncPassingFunctionsToSwift() {
            Assert.Equal("8", await AsyncFunctions.Exercise0(() => Task.FromResult<nint>(8)));
            Assert.Equal("3", await AsyncFunctions.Exercise1((x) => Task.FromResult(-x)));
            Assert.Equal("25", await AsyncFunctions.Exercise2((f, g) => async (x) => await f(await g(x))));
            Assert.Equal("7.4", await AsyncFunctions.Exercise3((a, b, c) => Task.FromResult(a + b + c)));
            Assert.Equal("[\"a\", \"b\", \"c\", \"d\"]", await AsyncFunctions.Exercise4((a, b, c, d) => Task.FromResult<IList<string>>(new string[] { a, b, c, d })));
            Assert.Equal("83", await AsyncFunctions.Exercise5((_, _, _, _, f) => Task.FromResult(f)));
            Assert.Equal("42", await AsyncFunctions.Exercise6((_, _, _, _, _, i) => Task.FromResult(i)));
        }

        [Fact]
        async Task testAsyncSwiftThrows() {
            await Assert.ThrowsAsync<Exception>(async () => await AsyncFunctions.WillThrow());
        }
    }
}
