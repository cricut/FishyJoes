using System;
using System.Threading.Tasks;
using System.Linq;
using System.Runtime.InteropServices;
using FluentAssertions;
using Xunit;

namespace Cricut.TestAPI.Tests {    
    public class ProtocolTests {
        public ProtocolTests() {
            _TypeSetup._ensureLoaded();
        }

        [Fact]
        public void TestProtocolImplementation() {
            AProtocol a = new AProtocolImplementation(Foo: "Garply", Baz: false);
            Assert.Equal("Garply", a.Foo);
            Assert.False(a.Baz);

            var b = a.Bar(x: 2, y: 128);
            Assert.Equal("130", b.Foo);
            Assert.True(b.Baz);

            Assert.Equal("-312 notBazzed", a.HasADefaultImplementation(9, -102.1));
            Assert.Equal("bazzy 3", a.HasADefaultImplementation(2, 0.345));

            Assert.Equal(3.7838466771424932E9, a.HasADefaultImplementation2("923.2185", true, 0.0898714));
            Assert.Equal(1.9556754407899822E-5, a.HasADefaultImplementation2("923.2185", false, 0.0898714));

            Assert.Equal(0.9589049888649063, a.HasADefaultImplementation2("0.9870923", true, 1.123123));
            Assert.Equal(1.686253813623996, a.HasADefaultImplementation2("0.9870923", false, 1.123123));
        }

        [Fact]
        public void TestProtocolEnum() {
            var testProtocolEnum = new TestProtocolEnum.Qux();
            testProtocolEnum.Foo();
            Assert.True(testProtocolEnum.Bar());
            testProtocolEnum.Baz(true);
            Assert.Equal("garply Navigate a nostril! garpity garp", testProtocolEnum.Garply("Navigate a nostril!"));
            Assert.Equal("thud: 42; grault: [1.234, 45.235890198, 892.8]", testProtocolEnum.Xyzzy(42, [1.234, 45.235890198, 892.80]));
            Assert.Equal(Tuple.Create<bool, nint, string>(false, 3, "Take a left at your intestines -<*>- Take the second right past Mars"), testProtocolEnum.Plugh(Tuple.Create(true, 3.14159265359, (System.Collections.Generic.IList<string>) new string[] {"Take a left at your intestines", "Take the second right past Mars"})));
        }

        [Fact]
        public void TestProtocolStruct() {
            var testProtocolStruct = new TestProtocolStruct("Raft a river of lava-ah!");
            Assert.Equal("Raft a river of lava-ah!", testProtocolStruct.Corge);
            testProtocolStruct.Corge = "Spank a plankton too! (take that)";
            Assert.Equal("Spank a plankton too! (take that)", testProtocolStruct.Corge);
            Assert.Equal([3.14159265359, 42.0, -1.23456789], testProtocolStruct.Frob);
            Assert.Equal(Tuple.Create<bool, nint, string>(true, 51, "Ride on the magic school bus *>-<* You might get baked into a pie"), testProtocolStruct.Plugh(Tuple.Create(true, 42.9, (System.Collections.Generic.IList<string>) new string[] {"Ride on the magic school bus", "You might get baked into a pie"})));

            testProtocolStruct.Foo();
            Assert.False(testProtocolStruct.Bar());
            testProtocolStruct.Baz(true);
            Assert.Equal("garp garpity An octopus in your neighborhood? garpee", testProtocolStruct.Garply("An octopus in your neighborhood?"));
            Assert.Equal("thud: 42 | grault: [1.234, 45.235890198, 892.8]", testProtocolStruct.Xyzzy(42, [1.234, 45.235890198, 892.80]));
        }

        [Fact]
        public void TestProtocolClassTest() {
            var testProtocolClass = TestProtocolClass.Init("Step inside it's a wilder ride!");
            Assert.Equal("Step inside it's a wilder ride!", testProtocolClass.Corge);
            Assert.Equal([42.0, -1.23456789, 3.14159265359], testProtocolClass.Frob);

            Assert.Null(testProtocolClass.Flarp);
            testProtocolClass.Flarp = "Excellent observation Kiki!";
            Assert.Equal("Excellent observation Kiki!", testProtocolClass.Flarp);

            Assert.Equal(42.909, testProtocolClass.Wombat(null));
            Assert.Null(testProtocolClass.Wombat(57));
            Assert.Equal(7890.2, testProtocolClass.Wombat(56));

            Assert.Equal(23947889, testProtocolClass.Spqr(new AssociatedDataEnum.Thing(23947889)));
            Assert.Equal(89708973, testProtocolClass.Spqr(new AssociatedDataEnum.Other("zxc", 89708973)));
            Assert.Equal(45, testProtocolClass.Spqr(new AssociatedDataEnum.Bar("shme", new AssociatedDataEnum.NoValue())));
            Assert.Equal(42, testProtocolClass.Spqr(new AssociatedDataEnum.NoValue()));
            Assert.Equal(1, testProtocolClass.Spqr(new AssociatedDataEnum.SimpleEnum(new SimpleEnum.Blue())));

            testProtocolClass.Foo();
            Assert.True(testProtocolClass.Bar());
            testProtocolClass.Baz(true);
            Assert.Equal("garplify Surfin' on a sine wave parguino", testProtocolClass.Garply("Surfin' on a sine wave"));
            Assert.Equal("thud: 42 \\|/ grault: [1.234, 45.235890198, 892.8]", testProtocolClass.Xyzzy(42, [1.234, 45.235890198, 892.80]));
            Assert.Equal(Tuple.Create<bool, nint, string>(true, 83, "Please let this be a normal field trip _-^= I knew I should've stayed home today"), testProtocolClass.Plugh(Tuple.Create(true, 92.47, (System.Collections.Generic.IList<string>) new string[] {"Please let this be a normal field trip", "I knew I should've stayed home today"})));
        }

        [Fact]
        public void TestAProtocolImpl() {
            AProtocol a = new AProtocolCSharpImpl("Garply", false);
            Assert.Equal("Garply", a.Foo);
            Assert.True(a.Baz);

            var b = a.Bar(x: 2, y: 128);
            Assert.Equal("256", b.Foo);
            Assert.True(b.Baz);

            Assert.Equal("bazzy -2889", a.HasADefaultImplementation(9, -102.1));
            Assert.Equal("bazzy 2", a.HasADefaultImplementation(2, 0.345));

            Assert.Equal(3.7838466771424932E9, a.HasADefaultImplementation2("923.2185", true, 0.0898714));
            Assert.Equal(1.9556754407899822E-5, a.HasADefaultImplementation2("923.2185", false, 0.0898714));

            Assert.Equal(0.9589049888649063, a.HasADefaultImplementation2("0.9870923", true, 1.123123));
            Assert.Equal(1.686253813623996, a.HasADefaultImplementation2("0.9870923", false, 1.123123));
        }

        [Fact]
        public void TestLeadingUnderscoreInNames() {
            var lups = new TestLeadingUnderscoredPropStruct("With great power comes great responsibility.");
            Assert.Equal("With great power comes great responsibility.", lups._leadingUnderscoreProp);
            // test for _leadingUnderscoreMethod is just that tests build and run, since currently leading underscore on method name means it's only visible on the Swift side, not the Foreign/Dart side. For C#, leading underscore ought not be a problem, but just a test for it just in case you know.
        }

        // Helper to avoid warnings about trivial async functions
        private static async Task<T> Async<T>(T result) {
            await Task.Yield();
            return result;
        }

        static TestAsyncFunctions MakeAsyncForeignSideFunction() {
            return new TestAsyncForeignSideFunctionsStruct(
                Const42: async () => { return await Async(49); },
                Iabs: async (x) => { return await Async(Math.Abs(x)); },
                IntCompose: (f, g) => {                     
                    return async (x) => {
                        return await f( await g(x) );
                    };
                },
                Add3Things: async (x, y, z) => {
                    return await Async((double)x + y + (double)z);
                },
                MakeList: async (a, b, c, d) => {
                    return await Async<string[]>([a, b, c, d]);
                },
                FifthThing: async (a, b, c, d, e) => {
                    return await Async(e);
                },
                Six: async (a, b, c, d, e, f) => {
                    return await Async(f);
                },
                WillThrow: () => {
                    throw new Exception("Spoon!");
                },
                Exercise0Fun: async (fn) => {
                    return $"{await fn() * 2}";
                },
                Exercise1Fun: async (fn) => {
                    return $"{await fn(-7)}";
                },
                Exercise2Fun: async (fn) => {
                    return $"{await fn( (a) => { return Async(a + 1); }, (b) => { return Async(b * 3); } )(23)}";
                },
                Exercise3Fun: async (fn) => {
                    return $"{ await fn(1.0f, 4.4, 2) }";
                },
                Exercise4Fun: async (fn) => {
                    var strList = await fn("Pump", "up", "the", "jam");
                    return string.Join(", ", strList);
                },
                Exercise5Fun: async (fn) => {
                    var result = await fn("78", 6, 4.2, "12", async () => { return await Async(654); });
                    var resultPrime = await result();
                    return $"{ resultPrime }";
                },
                Exercise6Fun: async (fn) => {
                    return $"{ await fn("78", 6, 4.2, "12", async () => { return await Async(654); }, 98) }";
                },
                ThunkTwiceMakerFun: (thunk) => {
                    return async () => {
                        await thunk();
                        await thunk();
                    };
                }
            );
        }

        [Fact]
        async Task TestAsyncForeignSideFunctions() {
            var a = ProtocolTests.MakeAsyncForeignSideFunction();
            await TestAsyncForeignSideFunctionsCore(a);
        }

        async Task TestAsyncForeignSideFunctionsCore(TestAsyncFunctions a) {
            Assert.Equal(49, await a.Const42());
            Assert.Equal(4, await a.Iabs(-4));

            var b = a.IntCompose(
                async (x) => {
                    await Task.Delay(1);
                    return x * 3;
                },
                async (y) => {
                    await Task.Delay(1);
                    return y * 5;
                }
            );
            Assert.Equal(1380, await b(92));

            var c = await a.Add3Things(3.14f, 3.14159, 128);
            Assert.Equal(134.28159, c, 5);

            var d = await a.MakeList("By", "your", "powers", "combined");
            Assert.Equal(["By", "your", "powers", "combined"], d);

            var e = await a.FifthThing(
                "I, am",
                int.MaxValue,
                double.MinValue,
                "Captain Planet!",
                async () => {
                    await Task.Delay(1);
                    return 42;
                }
            );
            Assert.Equal(42, await e());

            var f = await a.Six(
                "Big, bad",
                24,
                3.14159265359,
                "Beetleborgs",
                async () => {
                    await Task.Delay(1);
                    return 43;
                },
                int.MinValue
            );
            Assert.Equal(int.MinValue, f);

            var exception = await Assert.ThrowsAsync<Exception>(async () => await a.WillThrow());
            Assert.Equal("Spoon!", exception.Message);

            var g = await a.Exercise0(e);
            Assert.Equal("84", g);

            var h = await a.Exercise1(b);
            Assert.Equal("-105", h);

            var i = await a.Exercise2(
                (a, b) => {
                    return async (z) => {
                        return (await a(3)) + (await b(3)) + z;
                    };
                }
            );
            Assert.Equal("36", i);

            var j = await a.Exercise3(
                async (fl, d, l) => {
                    return await Async((fl / d) + (9 * l));
                }
            );
            Assert.Equal("18.227272727272727", j);

            var k = await a.Exercise4(
                async (a, b, c, d) => {
                    return await Async<string[]>([d, c, b, a]);
                }
            );
            Assert.Equal("jam, the, up, Pump", k);

            var l = await a.Exercise5(
                async (a, b, c, d, e) => {
                    var ePrime = await e();
                    return () => {
                        double aDbl;
                        double.TryParse(a, out aDbl);
                        double dDbl;
                        double.TryParse(d, out dDbl);
                        return Async((nint)(aDbl + b + c + dDbl + ePrime));
                    };
                }
            );
            Assert.Equal("754", l);

            var m = await a.Exercise6(                
                async (a, b, c, d, e, f) => {
                    double aDbl;
                    double.TryParse(a, out aDbl);
                    double dDbl;
                    double.TryParse(d, out dDbl);
                    return (nint)(aDbl + b + c + dDbl + await e() + f);
                }
            );
            Assert.Equal("852", m);

            var o = 1;
            var n = a.ThunkTwiceMaker(
                async () => {
                    await Task.Delay(1);
                    o += 1;
                    System.Diagnostics.Debug.WriteLine("Thunker in Paradise");
                }
            );
            await n();
            Assert.Equal(3, o);

            var p = await a.DefaultExercise6(
                async (a, b, c, d, e, f) => {
                    double aDbl;
                    double.TryParse(a, out aDbl);
                    double dDbl;
                    double.TryParse(d, out dDbl);
                    return (nint)(aDbl + b + c + dDbl + await e() + f);
                }
            );
            Assert.Equal("962", p);
        }
    }

    public record AProtocolCSharpImpl: AProtocol {
        public string Foo { get; set; }
        public bool Baz { get; set; }

        public AProtocolCSharpImpl(
            string Foo,
            bool Baz
        ) {
            this.Foo = Foo;
            this.Baz = !Baz;
        }

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public Cricut.TestAPI.AProtocol Bar(
            nint x,
            nint y
        ) {
            return new AProtocolCSharpImpl($"{x * y}", false);
        }
    }
}
