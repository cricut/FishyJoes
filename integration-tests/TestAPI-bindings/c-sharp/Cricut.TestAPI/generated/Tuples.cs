using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Tuples) -->
    /// </summary>
    public record Tuples {
        private Tuples() {}

        /// <summary>
        /// <!-- FishyJoes.export(tuple2) -->
        /// </summary>
        public static System.Tuple<nint, string> Tuple2 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Tuples_Tuple2(out exn).Consume<System.Tuple<nint, string>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Tuples_Tuple2(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tuple3) -->
        /// </summary>
        public static System.Tuple<string, double, string> Tuple3 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Tuples_Tuple3(out exn).Consume<System.Tuple<string, double, string>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Tuples_Tuple3(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tuple4) -->
        /// </summary>
        public static System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool> Tuple4 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Tuples_Tuple4(out exn).Consume<System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Tuples_Tuple4(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tuple5) -->
        /// </summary>
        public static System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>> Tuple5 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Tuples_Tuple5(out exn).Consume<System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Tuples_Tuple5(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tuple6) -->
        /// </summary>
        public static System.Tuple<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool> Tuple6 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Tuples_Tuple6(out exn).Consume<System.Tuple<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Tuples_Tuple6(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(checkTuples) -->
        /// </summary>
        public static bool CheckTuples(
            System.Tuple<nint, string> t2,
            System.Tuple<string, double, string> t3,
            System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool> t4,
            System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>> t5,
            System.Tuple<string, nint, double, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, byte, System.Tuple<System.Tuple<nint, string>, System.Tuple<string, double, string>, string, bool>, System.Tuple<string, double, string>, System.Tuple<nint, string>>, bool> t6
        ) {
            using var _t2Handle = new GCRef(t2);
            using var _t3Handle = new GCRef(t3);
            using var _t4Handle = new GCRef(t4);
            using var _t5Handle = new GCRef(t5);
            using var _t6Handle = new GCRef(t6);
            return Check((out CreatedRef _exn) => __cs_Tuples_checkTuples(_t2Handle.ptr, _t3Handle.ptr, _t4Handle.ptr, _t5Handle.ptr, _t6Handle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_Tuples_checkTuples(
            UnownedRef t2,
            UnownedRef t3,
            UnownedRef t4,
            UnownedRef t5,
            UnownedRef t6,
            out CreatedRef exn
        );

        static Tuples() { _TypeSetup._ensureLoaded(); }
    }
}
