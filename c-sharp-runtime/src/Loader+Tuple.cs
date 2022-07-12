using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        delegate IntPtr TupleGetter(IntPtr obj, out IntPtr exn);
        unsafe delegate IntPtr TupleConstructor(IntPtr* elements, out IntPtr exn);

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

        public static void FishyJoesRuntime_Tuple2Converter_setup<T0, T1>(string name, out IntPtr exn) {
            unsafe {
                FishyJoesRuntime_Tuple2Converter_setup(
                    name,
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1>>(tuple).Item1)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1>>(tuple).Item2)
                    )),
                    bag<TupleConstructor>((IntPtr* elems, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(Tuple.Create(
                            PeekHandle<T0>(elems[0]),
                            PeekHandle<T1>(elems[1])
                        ))
                    ))
                );
                exn = IntPtr.Zero;
            }
        }

        public static void FishyJoesRuntime_Tuple3Converter_setup<T0, T1, T2>(string name, out IntPtr exn) {
            unsafe {
                FishyJoesRuntime_Tuple3Converter_setup(
                    name,
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2>>(tuple).Item1)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2>>(tuple).Item2)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2>>(tuple).Item3)
                    )),
                    bag<TupleConstructor>((IntPtr* elems, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(Tuple.Create(
                            PeekHandle<T0>(elems[0]),
                            PeekHandle<T1>(elems[1]),
                            PeekHandle<T2>(elems[2])
                        ))
                    ))
                );
                exn = IntPtr.Zero;
            }
        }

        public static void FishyJoesRuntime_Tuple4Converter_setup<T0, T1, T2, T3>(string name, out IntPtr exn) {
            unsafe {
                FishyJoesRuntime_Tuple4Converter_setup(
                    name,
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3>>(tuple).Item1)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3>>(tuple).Item2)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3>>(tuple).Item3)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3>>(tuple).Item4)
                    )),
                    bag<TupleConstructor>((IntPtr* elems, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(Tuple.Create(
                            PeekHandle<T0>(elems[0]),
                            PeekHandle<T1>(elems[1]),
                            PeekHandle<T2>(elems[2]),
                            PeekHandle<T3>(elems[3])
                        ))
                    ))
                );
                exn = IntPtr.Zero;
            }
        }

        public static void FishyJoesRuntime_Tuple5Converter_setup<T0, T1, T2, T3, T4>(string name, out IntPtr exn) {
            unsafe {
                FishyJoesRuntime_Tuple5Converter_setup(
                    name,
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4>>(tuple).Item1)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4>>(tuple).Item2)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4>>(tuple).Item3)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4>>(tuple).Item4)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4>>(tuple).Item5)
                    )),
                    bag<TupleConstructor>((IntPtr* elems, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(Tuple.Create(
                            PeekHandle<T0>(elems[0]),
                            PeekHandle<T1>(elems[1]),
                            PeekHandle<T2>(elems[2]),
                            PeekHandle<T3>(elems[3]),
                            PeekHandle<T4>(elems[4])
                        ))
                    ))
                );
                exn = IntPtr.Zero;
            }
        }

        public static void FishyJoesRuntime_Tuple6Converter_setup<T0, T1, T2, T3, T4, T5>(string name, out IntPtr exn) {
            unsafe {
                FishyJoesRuntime_Tuple6Converter_setup(
                    name,
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item1)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item2)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item3)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item4)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item5)
                    )),
                    bag<TupleGetter>((IntPtr tuple, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(PeekHandle<Tuple<T0, T1, T2, T3, T4, T5>>(tuple).Item6)
                    )),
                    bag<TupleConstructor>((IntPtr* elems, out IntPtr exn) => Catching(out exn, () =>
                        PassOwnership(Tuple.Create(
                            PeekHandle<T0>(elems[0]),
                            PeekHandle<T1>(elems[1]),
                            PeekHandle<T2>(elems[2]),
                            PeekHandle<T3>(elems[3]),
                            PeekHandle<T4>(elems[4]),
                            PeekHandle<T5>(elems[5])
                        ))
                    ))
                );
                exn = IntPtr.Zero;
            }
        }

        private static void setupTuples() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}