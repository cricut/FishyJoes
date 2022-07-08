using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Functions) -->
     */
    public class Functions : SwiftReference {
        internal Functions(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(const42) -->
         */
        public static System.Func<nint> const42 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<nint>>(__cs_get_Functions_const42(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_const42(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        public static System.Func<nint, nint> abs {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<nint, nint>>(__cs_get_Functions_abs(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_abs(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        public static System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> intCompose {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>>(__cs_get_Functions_intCompose(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_intCompose(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        public static System.Func<float, double, nint, double> add3Things {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<float, double, nint, double>>(__cs_get_Functions_add3Things(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_add3Things(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        public static System.Func<string, string, string, string, string[]> makeList {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<string, string, string, string, string[]>>(__cs_get_Functions_makeList(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_makeList(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        public static System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> fifthThing {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>>>(__cs_get_Functions_fifthThing(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_fifthThing(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        public static System.Func<string, nint, double, string, System.Func<nint>, nint, nint> sixthThing {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Func<string, nint, double, string, System.Func<nint>, nint, nint>>(__cs_get_Functions_sixthThing(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Functions_sixthThing(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        public static string exercise0(
            System.Func<nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise0(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise0(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        public static string exercise1(
            System.Func<nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise1(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise1(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        public static string exercise2(
            System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise2(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise2(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        public static string exercise3(
            System.Func<float, double, nint, double> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise3(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise3(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        public static string exercise4(
            System.Func<string, string, string, string, string[]> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise4(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise4(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        public static string exercise5(
            System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise5(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise5(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        public static string exercise6(
            System.Func<string, nint, double, string, System.Func<nint>, nint, nint> fn
        ) {
            using var _fnHandle = new GCRef(fn);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_exercise6(_fnHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_exercise6(
            IntPtr fn,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        public static string willThrow(
        ) {
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Functions_willThrow(out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Functions_willThrow(
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.exportReference(Functions.TheError) -->
         */
        public class TheError : SwiftReference {
            internal TheError(IntPtr reference): base(reference) {}

            static TheError() { _TypeSetup._ensureLoaded(); }
        }
        static Functions() { _TypeSetup._ensureLoaded(); }
    }
}
