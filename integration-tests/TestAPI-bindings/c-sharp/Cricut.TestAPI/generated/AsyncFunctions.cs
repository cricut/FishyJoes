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
        /// <!-- FishyJoes.export(const42) -->
        /// </summary>
        public static System.Func<nint> Const42 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_const42(Loader.env, out exn).Consume<System.Func<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_const42(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(abs) -->
        /// </summary>
        public static System.Func<nint, nint> Abs {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_abs(Loader.env, out exn).Consume<System.Func<nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_abs(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intCompose) -->
        /// </summary>
        public static System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>> IntCompose {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_intCompose(Loader.env, out exn).Consume<System.Func<System.Func<nint, nint>, System.Func<nint, nint>, System.Func<nint, nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_intCompose(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(add3Things) -->
        /// </summary>
        public static System.Func<float, double, nint, double> Add3Things {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_add3Things(Loader.env, out exn).Consume<System.Func<float, double, nint, double>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_add3Things(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(makeList) -->
        /// </summary>
        public static System.Func<string, string, string, string, System.Collections.Generic.IList<string>> MakeList {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_makeList(Loader.env, out exn).Consume<System.Func<string, string, string, string, System.Collections.Generic.IList<string>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_makeList(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(fifthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>> FifthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_fifthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, System.Func<nint>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_fifthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(sixthThing) -->
        /// </summary>
        public static System.Func<string, nint, double, string, System.Func<nint>, nint, nint> SixthThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AsyncFunctions_sixthThing(Loader.env, out exn).Consume<System.Func<string, nint, double, string, System.Func<nint>, nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AsyncFunctions_sixthThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.exportReference(AsyncFunctions.TheError) -->
        /// </summary>
        public class TheError : SwiftReference {
            internal TheError(ConsumedRef reference): base(reference) {}

            static TheError() { _TypeSetup._ensureLoaded(); }
        }
        static AsyncFunctions() { _TypeSetup._ensureLoaded(); }
    }
}
