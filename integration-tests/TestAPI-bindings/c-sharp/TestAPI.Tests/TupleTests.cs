using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    using T2 = Tuple<long, string>;
    using T3 = Tuple<string, double, string>;
    // C# is stupid
    namespace T4
    {
        using T4 = Tuple<T2, T3, string, bool>;
        namespace T5
        {
            using T5 = Tuple<string, byte, T4, T3, T2>;
            namespace T6
            {
                using T6 = Tuple<string, long, double, T4, T5, bool>;

                public class TupleTests {

                    private T2 tuple2; 
                    private T3 tuple3; 
                    private T4 tuple4; 
                    private T5 tuple5; 
                    private T6 tuple6; 

                    public TupleTests() {
                        tuple2 = Tuple.Create(1L, "two");
                        tuple3 = Tuple.Create("one", 2.1, "three");
                        tuple4 = Tuple.Create(tuple2, tuple3, "IV", true);
                        tuple5 = Tuple.Create("I", (byte)2, tuple4, tuple3, tuple2);
                        tuple6 = Tuple.Create("one", 2L, 3.14, tuple4, tuple5, false);
                    }

/*
                    [Fact]
                    void testSwiftTuplesToKotlin() {
                        Assert.Equal(tuple2, Tuples.tuple2);
                        Assert.Equal(tuple3, Tuples.tuple3);
                        Assert.Equal(tuple4, Tuples.tuple4);
                        Assert.Equal(tuple5, Tuples.tuple5);
                        Assert.Equal(tuple6, Tuples.tuple6);
                    }

                    [Fact]
                    void testKotlinTuplesToSwift() {
                        Assert.True(Tuples.checkTuples(tuple2, tuple3, tuple4, tuple5, tuple6));
                    }
*/
                }
            }
        }
    }
}