using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Functions) -->
    /// </summary>
    public record Functions {
        private Functions() {}

        /// <summary>
        /// <!-- FishyJoes.export(const42) -->
        /// </summary>
        public static System.Func<nint> Const42 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_const42(Loader.env, out exn).Consume<System.Func<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_const42(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(abs) -->
        /// </summary>
        public static System.Func<nint, nint> Abs {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_abs(Loader.env, out exn).Consume<System.Func<nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_abs(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intCompose) -->
        /// </summary>
        public static System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> IntCompose {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_intCompose(Loader.env, out exn).Consume<System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_intCompose(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(add3Things) -->
        /// </summary>
        public static System.Func<float, double, nint, double> Add3Things {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_add3Things(Loader.env, out exn).Consume<System.Func<float, double, nint, double>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_add3Things(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(makeList) -->
        /// </summary>
        public static System.Func<string, string, string, string, System.Collections.Generic.IList<string>> MakeList {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_makeList(Loader.env, out exn).Consume<System.Func<string, string, string, string, System.Collections.Generic.IList<string>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_makeList(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(fifthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> FifthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_fifthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_fifthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(sixthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, nint, nint> SixthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Functions_sixthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Functions_sixthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public static string Exercise0(
            System.Func<nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise0(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise0(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise1) -->
        /// </summary>
        public static string Exercise1(
            System.Func<nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise1(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise1(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise2) -->
        /// </summary>
        public static string Exercise2(
            System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise2(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise2(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise3) -->
        /// </summary>
        public static string Exercise3(
            System.Func<float, double, nint, double> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise3(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise3(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise4) -->
        /// </summary>
        public static string Exercise4(
            System.Func<string, string, string, string, System.Collections.Generic.IList<string>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise4(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise4(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise5) -->
        /// </summary>
        public static string Exercise5(
            System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise5(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise5(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise6) -->
        /// </summary>
        public static string Exercise6(
            System.Func<string, nint, double, string, System.Func<nint>, nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_exercise6(Loader.env, _fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_exercise6(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(willThrow) -->
        /// </summary>
        public static string WillThrow(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Functions_willThrow(Loader.env, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Functions_willThrow(
            IntPtr envRef,
            out CreatedRef exn
        );

        static Functions() { _TypeSetup._ensureLoaded(); }
    }
}
