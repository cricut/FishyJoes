using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Functions) -->
    /// </summary>
    public class Functions : SwiftReference {
        internal Functions(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(const42) -->
        /// </summary>
        public static System.Func<nint> Const42 {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_Const42(out exn).Consume<System.Func<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_Const42(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(abs) -->
        /// </summary>
        public static System.Func<nint, nint> Abs {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_Abs(out exn).Consume<System.Func<nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_Abs(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intCompose) -->
        /// </summary>
        public static System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> IntCompose {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_IntCompose(out exn).Consume<System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_IntCompose(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(add3Things) -->
        /// </summary>
        public static System.Func<float, double, nint, double> Add3Things {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_Add3Things(out exn).Consume<System.Func<float, double, nint, double>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_Add3Things(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(makeList) -->
        /// </summary>
        public static System.Func<string, string, string, string, System.Collections.Generic.IList<string>> MakeList {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_MakeList(out exn).Consume<System.Func<string, string, string, string, System.Collections.Generic.IList<string>>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_MakeList(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(fifthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> FifthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_FifthThing(out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_FifthThing(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(sixthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, nint, nint> SixthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Functions_SixthThing(out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Functions_SixthThing(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public static string Exercise0(
            System.Func<nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __cs_Functions_exercise0(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise0(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise1(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise1(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise2(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise2(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise3(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise3(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise4(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise4(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise5(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise5(
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
            return Check((out CreatedRef _exn) => __cs_Functions_exercise6(_fnHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_exercise6(
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(willThrow) -->
        /// </summary>
        public static string WillThrow(
        ) {
            return Check((out CreatedRef _exn) => __cs_Functions_willThrow(out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Functions_willThrow(
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.exportReference(Functions.TheError) -->
        /// </summary>
        public class TheError : SwiftReference {
            internal TheError(ConsumedRef reference): base(reference) {}

            static TheError() { _TypeSetup._ensureLoaded(); }
        }
        static Functions() { _TypeSetup._ensureLoaded(); }
    }
}
