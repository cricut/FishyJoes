using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef TupleGetter(IntPtr context, UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef TupleConstructor(IntPtr context, UnownedRef* elements, out CreatedRef exn);

    [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesCommonRuntime_TupleConverter_setup(
        IntPtr envRef,
        string name,
        TupleGetter? get0,
        TupleGetter? get1,
        TupleGetter? get2,
        TupleGetter? get3,
        TupleGetter? get4,
        TupleGetter? get5,
        TupleConstructor constructor,
        IntPtr context
    );

    public static void FishyJoesCommonRuntime_Tuple2Converter_setup<T0, T1>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            FishyJoesCommonRuntime_TupleConverter_setup(
                envRef,
                name,
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1>>().Item1)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1>>().Item2)
                )),
                null,
                null,
                null,
                null,
                bag<TupleConstructor>((IntPtr context, UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesCommonRuntime_Tuple3Converter_setup<T0, T1, T2>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            FishyJoesCommonRuntime_TupleConverter_setup(
                envRef,
                name,
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item1)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item2)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2>>().Item3)
                )),
                null,
                null,
                null,
                bag<TupleConstructor>((IntPtr context, UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesCommonRuntime_Tuple4Converter_setup<T0, T1, T2, T3>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            FishyJoesCommonRuntime_TupleConverter_setup(
                envRef,
                name,
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item1)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item2)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item3)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3>>().Item4)
                )),
                null,
                null,
                bag<TupleConstructor>((IntPtr context, UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesCommonRuntime_Tuple5Converter_setup<T0, T1, T2, T3, T4>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            FishyJoesCommonRuntime_TupleConverter_setup(
                envRef,
                name,
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item1)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item2)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item3)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item4)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4>>().Item5)
                )),
                null,
                bag<TupleConstructor>((IntPtr context, UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>(),
                        elems[4].Peek<T4>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesCommonRuntime_Tuple6Converter_setup<T0, T1, T2, T3, T4, T5>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            FishyJoesCommonRuntime_TupleConverter_setup(
                envRef,
                name,
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item1)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item2)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item3)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item4)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item5)
                )),
                bag<TupleGetter>((IntPtr context, UnownedRef tuple, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(tuple.Peek<Tuple<T0, T1, T2, T3, T4, T5>>().Item6)
                )),
                bag<TupleConstructor>((IntPtr context, UnownedRef* elems, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(Tuple.Create(
                        elems[0].Peek<T0>(),
                        elems[1].Peek<T1>(),
                        elems[2].Peek<T2>(),
                        elems[3].Peek<T3>(),
                        elems[4].Peek<T4>(),
                        elems[5].Peek<T5>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    private static void setupTuples() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
