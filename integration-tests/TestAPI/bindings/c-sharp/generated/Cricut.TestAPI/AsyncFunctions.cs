using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AsyncFunctions) -->
    /// </summary>
    public record AsyncFunctions {
        private AsyncFunctions() {}

        /// <summary>
        /// <!-- FishyJoes.export(add3Things) -->
        /// </summary>
        public static System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_add3Things(Loader.env, out exn).Consume<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_add3Things(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(const42) -->
        /// </summary>
        public static System.Func<System.Threading.Tasks.Task<nint>> Const42 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_const42(Loader.env, out exn).Consume<System.Func<System.Threading.Tasks.Task<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_const42(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(fifthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> FifthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_fifthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_fifthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(abs) -->
        /// </summary>
        public static System.Func<nint, System.Threading.Tasks.Task<nint>> Abs {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_abs(Loader.env, out exn).Consume<System.Func<nint, System.Threading.Tasks.Task<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_abs(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intCompose) -->
        /// </summary>
        public static System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_intCompose(Loader.env, out exn).Consume<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_intCompose(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(makeList) -->
        /// </summary>
        public static System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_makeList(Loader.env, out exn).Consume<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_makeList(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(sixthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> SixthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_sixthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_sixthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(willThrow) -->
        /// </summary>
        public static System.Func<System.Threading.Tasks.Task<nint>> WillThrow {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_willThrow(Loader.env, out exn).Consume<System.Func<System.Threading.Tasks.Task<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_willThrow(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise0(
            System.Func<System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise0(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise0(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise1) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise1(
            System.Func<nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise1(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise1(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise2) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise2(
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise2(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise2(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise3) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise3(
            System.Func<float, double, nint, System.Threading.Tasks.Task<double>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise3(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise3(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise4) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise4(
            System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise4(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise4(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise5) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise5(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise5(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise5(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise6) -->
        /// </summary>
        public static System.Threading.Tasks.Task<string> Exercise6(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_exercise6(Loader.env, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_exercise6(
            IntPtr envRef,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(thunkTwiceMaker) -->
        /// </summary>
        public static System.Func<System.Threading.Tasks.Task> ThunkTwiceMaker(
            System.Func<System.Threading.Tasks.Task> thunk
        ) {
            using var _thunkHandle = new GCRef(thunk);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AsyncFunctions_thunkTwiceMaker(Loader.env, _thunkHandle.ptr, out _exn)).Consume<System.Func<System.Threading.Tasks.Task>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AsyncFunctions_thunkTwiceMaker(
            IntPtr envRef,
            UnownedRef thunk,
            out CreatedRef exn
        );

        static AsyncFunctions() { _TypeSetup._ensureLoaded(); }
    }
}
