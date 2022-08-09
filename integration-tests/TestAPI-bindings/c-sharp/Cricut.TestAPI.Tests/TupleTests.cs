using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    using T2 = Tuple<nint, string>;
    using T3 = Tuple<string, double, string>;
    // C# is stupid and won't let you define typealias that refer to other typealiases in the same namespace;
    namespace T4 {
        using T4 = Tuple<T2, T3, string, bool>;
        namespace T5 {
            using T5 = Tuple<string, byte, T4, T3, T2>;
            namespace T6 {
                using T6 = Tuple<string, nint, double, T4, T5, bool>;

                public class TupleTests {

                    private T2 tuple2; 
                    private T3 tuple3; 
                    private T4 tuple4; 
                    private T5 tuple5; 
                    private T6 tuple6; 

                    public TupleTests() {
                        tuple2 = Tuple.Create((nint)1, "two");
                        tuple3 = Tuple.Create("one", 2.1, "three");
                        tuple4 = Tuple.Create(tuple2, tuple3, "IV", true);
                        tuple5 = Tuple.Create("I", (byte)2, tuple4, tuple3, tuple2);
                        tuple6 = Tuple.Create("one", (nint)2, 3.14, tuple4, tuple5, false);
                    }

                    [Fact]
                    void testSwiftTuplesToCSharp() {
                        Assert.Equal(tuple2, Tuples.Tuple2);
                        Assert.Equal(tuple3, Tuples.Tuple3);
                        Assert.Equal(tuple4, Tuples.Tuple4);
                        Assert.Equal(tuple5, Tuples.Tuple5);
                        Assert.Equal(tuple6, Tuples.Tuple6);
                    }

                    [Fact]
                    void testCSharpTuplesToSwift() {
                        Assert.True(Tuples.CheckTuples(tuple2, tuple3, tuple4, tuple5, tuple6));
                    }
                }
            }
        }
    }
}