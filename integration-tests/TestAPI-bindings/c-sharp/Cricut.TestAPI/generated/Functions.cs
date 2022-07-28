using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.exportReference(Functions) --></para>
    /// </summary>
    public class Functions : SwiftReference {
        internal Functions(IntPtr reference): base(reference) {}

        /// <summary>
        /// <para><!-- FishyJoes.export(const42) --></para>
        /// </summary>
        public static System.Func<nint> Const42 {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<nint>>(__cs_get_Functions_Const42(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_Const42(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(abs) --></para>
        /// </summary>
        public static System.Func<nint, nint> Abs {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<nint, nint>>(__cs_get_Functions_Abs(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_Abs(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(intCompose) --></para>
        /// </summary>
        public static System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> IntCompose {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>>(__cs_get_Functions_IntCompose(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_IntCompose(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(add3Things) --></para>
        /// </summary>
        public static System.Func<float, double, nint, double> Add3Things {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<float, double, nint, double>>(__cs_get_Functions_Add3Things(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_Add3Things(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(makeList) --></para>
        /// </summary>
        public static System.Func<string, string, string, string, System.Collections.Generic.IList<string>> MakeList {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<string, string, string, string, System.Collections.Generic.IList<string>>>(__cs_get_Functions_MakeList(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_MakeList(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(fifthThing) --></para>
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> FifthThing {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>>>(__cs_get_Functions_FifthThing(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_FifthThing(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(sixthThing) --></para>
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, nint, nint> SixthThing {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Func<string, nint, double, string, System.Func<nint>, nint, nint>>(__cs_get_Functions_SixthThing(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Functions_SixthThing(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise0) --></para>
        /// </summary>
        public static string Exercise0(
            System.Func<nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise0(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise0(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise1) --></para>
        /// </summary>
        public static string Exercise1(
            System.Func<nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise1(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise1(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise2) --></para>
        /// </summary>
        public static string Exercise2(
            System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise2(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise2(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise3) --></para>
        /// </summary>
        public static string Exercise3(
            System.Func<float, double, nint, double> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise3(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise3(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise4) --></para>
        /// </summary>
        public static string Exercise4(
            System.Func<string, string, string, string, System.Collections.Generic.IList<string>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise4(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise4(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise5) --></para>
        /// </summary>
        public static string Exercise5(
            System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise5(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise5(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(exercise6) --></para>
        /// </summary>
        public static string Exercise6(
            System.Func<string, nint, double, string, System.Func<nint>, nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise6(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_exercise6(
            IntPtr fn,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(willThrow) --></para>
        /// </summary>
        public static string WillThrow(
        ) {
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_willThrow(out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Functions_willThrow(
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.exportReference(Functions.TheError) --></para>
        /// </summary>
        public class TheError : SwiftReference {
            internal TheError(IntPtr reference): base(reference) {}

            static TheError() { _TypeSetup._ensureLoaded(); }
        }
        static Functions() { _TypeSetup._ensureLoaded(); }
    }
}
