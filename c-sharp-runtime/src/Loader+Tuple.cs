using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef TupleGetter(UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef TupleConstructor(UnownedRef* elements, out CreatedRef exn);

    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_Tuple2Converter_setup(
        string name,
        TupleGetter get0,
        TupleGetter get1,
        TupleConstructor constructor
    );
    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_Tuple3Converter_setup(
        string name,
        TupleGetter get0,
        TupleGetter get1,
        TupleGetter get2,
        TupleConstructor constructor
    );
    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_Tuple4Converter_setup(
        string name,
        TupleGetter get0,
        TupleGetter get1,
        TupleGetter get2,
        TupleGetter get3,
        TupleConstructor constructor
    );
    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_Tuple5Converter_setup(
        string name,
        TupleGetter get0,
        TupleGetter get1,
        TupleGetter get2,
        TupleGetter get3,
        TupleGetter get4,
        TupleConstructor constructor
    );
    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_Tuple6Converter_setup(
        string name,
        TupleGetter get0,
        TupleGetter get1,
        TupleGetter get2,
        TupleGetter get3,
        TupleGetter get4,
        TupleGetter get5,
        TupleConstructor constructor
    );

    public static void FishyJoesRuntime_Tuple2Converter_setup<T0, T1>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_Tuple2Converter_setup(
                name,
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1>>().Item1)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1>>().Item2)
                )),
                bag<TupleConstructor>((UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesRuntime_Tuple3Converter_setup<T0, T1, T2>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_Tuple3Converter_setup(
                name,
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item1)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item2)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item3)
                )),
                bag<TupleConstructor>((UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesRuntime_Tuple4Converter_setup<T0, T1, T2, T3>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_Tuple4Converter_setup(
                name,
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item1)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item2)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item3)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item4)
                )),
                bag<TupleConstructor>((UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesRuntime_Tuple5Converter_setup<T0, T1, T2, T3, T4>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_Tuple5Converter_setup(
                name,
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item1)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item2)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item3)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item4)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item5)
                )),
                bag<TupleConstructor>((UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>(),
                        elems[4].Peek<T4>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesRuntime_Tuple6Converter_setup<T0, T1, T2, T3, T4, T5>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_Tuple6Converter_setup(
                name,
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item1)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item2)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item3)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item4)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item5)
                )),
                bag<TupleGetter>((UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item6)
                )),
                bag<TupleConstructor>((UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>(),
                        elems[4].Peek<T4>(),
                        elems[5].Peek<T5>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    private static void setupTuples() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
