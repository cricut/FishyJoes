using System;
using System.Threading.Tasks;
using FluentAssertions;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class MethodTests {
        [Fact]
        void testStaticMethods() {
            Assert.Equal(123, Methods.GetStaticGet());
            Assert.Equal(234, Methods.GetStaticGetMethod());

            Assert.Equal(345, Methods.GetStaticModifiable());
            Methods.SetStaticModifiable(987);
            Assert.Equal(987, Methods.GetStaticModifiable());

            Assert.Equal(567, Methods.StaticStored);
            Methods.StaticStored = 765;
            Assert.Equal(765, Methods.StaticStored);
        }

        [Fact]
        void testInstanceMethods() {
            var instance = Methods.Create();

            Assert.Equal(1234, instance.GetInstanceGet());
            Assert.Equal(2345, instance.GetInstanceGetMethod());

            Assert.Equal(3456, instance.GetInstanceModifiable());
            instance.SetInstanceModifiable(9876);
            Assert.Equal(9876, instance.GetInstanceModifiable());

            Assert.Equal(5678, instance.InstanceStored);
            instance.InstanceStored = 7654;
            Assert.Equal(7654, instance.InstanceStored);
        }

        public class AsyncInstanceTests {
            [Fact]
            async Task TestAsyncFunctionCall() {
                var value = await Methods.Create().Async42();
                Assert.Equal(42, value);
            }

            [Fact]
            async Task TestAsyncYieldingFunctionCall() {
                await Methods.Create().AsyncYield();
            }

            [Fact]
            async Task TestAsyncSleepFunctionCall() {
                await Methods.Create().AsyncSleep();
            }

            [Fact]
            async Task TestAsyncVoidFunctionCall() {
                await Methods.Create().AsyncVoid();
            }

            [Fact]
            async Task TestAsyncCallbackFunctionCall0() {
                var threw = false;
                nint value = 42;
                var ran = false;
                try {
                    value = await Methods.Create().AsyncCallbackFunc0(() => {
                        ran = true;
                        return Task.FromResult<nint>(42);
                    });
                } catch {
                    threw = true;
                }
                Assert.False(threw);
                Assert.Equal(42, value);
                Assert.True(ran);
            }

            [Fact]
            async Task TestAsyncCallbackFunctionCallThrow() {
                var theException = new Exception("asyncErr");
                var exception = await Assert.ThrowsAsync<Exception>(() =>
                    Methods.Create().AsyncCallbackFunc0(() => throw theException)
                );
                Assert.Equal(theException, exception);
            }

            [Fact]
            async Task TestAsyncDoubleFunctionCall() {
                var value = await Methods.Create().AsyncDouble(1.0);
                Assert.Equal(2.0, value);
            }

            [Fact]
            async Task TestAsyncMultipleArgsFunctionCall() {
                Assert.Equal(3, await Methods.Create().AsyncMultipleArgs(1, () => Task.FromResult<nint>(2)));
            }

            [Fact]
            async Task TestAsyncThrowingFunctionCall() {
                var exception = await Assert.ThrowsAsync<Exception>(async () => await Methods.Create().AsyncThrowing());
                Assert.Equal("TheMethodError()", exception.Message);
            }
        }
    }

    public class AsyncStaticTests {
        [Fact]
        async Task TestAsyncFunctionCall() {
            var value = await Methods.StaticAsync42();
            Assert.Equal(42, value);
        }

        [Fact]
        async Task TestAsyncYieldingFunctionCall() {
            await Methods.StaticAsyncYield();
        }

        [Fact]
        async Task TestAsyncSleepFunctionCall() {
            await Methods.StaticAsyncSleep();
        }

        [Fact]
        async Task TestAsyncVoidFunctionCall() {
            await Methods.StaticAsyncVoid();
        }

        [Fact]
        async Task TestAsyncCallbackFunctionCall0() {
            var threw = false;
            nint value = 42;
            var ran = false;
            try {
                value = await Methods.StaticAsyncCallbackFunc0(() => {
                    ran = true;
                    return Task.FromResult<nint>(42);
                });
            } catch {
                threw = true;
            }
            Assert.False(threw);
            Assert.Equal(42, value);
            Assert.True(ran);
        }

        [Fact]
        async Task TestAsyncCallbackFunctionCallThrow() {
            var theException = new Exception("asyncErr");
            var exception = await Assert.ThrowsAsync<Exception>(() =>
                Methods.StaticAsyncCallbackFunc0(() => throw theException)
            );
            Assert.Equal(theException, exception);
        }

        [Fact]
        async Task TestAsyncDoubleFunctionCall() {
            var value = await Methods.StaticAsyncDouble(1.0);
            Assert.Equal(2.0, value);
        }

        [Fact]
        async Task TestAsyncMultipleArgsFunctionCall() {
            Assert.Equal(3, await Methods.StaticAsyncMultipleArgs(1, () => Task.FromResult<nint>(2)));
        }

        [Fact]
        async Task TestAsyncThrowingFunctionCall() {
            var exception = await Assert.ThrowsAsync<Exception>(async () => await Methods.StaticAsyncThrowing());
            Assert.Equal("TheMethodError()", exception.Message);
        }
    }
}
