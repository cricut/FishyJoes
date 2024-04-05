using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestAsyncFunctions) -->
    /// </summary>
    public interface TestAsyncFunctions {
        public System.Func<System.Threading.Tasks.Task<nint>> Const42 { get;  }
        public System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs { get;  }
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose { get;  }
        public System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things { get;  }
        public System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList { get;  }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> FifthThing { get;  }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> Six { get;  }
        public System.Func<System.Threading.Tasks.Task<nint>> WillThrow { get;  }

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise0(
            System.Func<System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise0(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise0(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise1) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise1(
            System.Func<nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise1(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise1(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise2) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise2(
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise2(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise2(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise3) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise3(
            System.Func<float, double, nint, System.Threading.Tasks.Task<double>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise3(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise3(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise4) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise4(
            System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise4(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise4(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise5) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise5(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise5(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise5(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise6) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise6(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_exercise6(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_exercise6(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(thunkTwiceMaker) -->
        /// </summary>
        public System.Func<System.Threading.Tasks.Task> ThunkTwiceMaker(
            System.Func<System.Threading.Tasks.Task> thunk
        ) {
            using var _thisHandle = new GCRef(this);
            using var _thunkHandle = new GCRef(thunk);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker(Loader.env, _thisHandle.ptr, _thunkHandle.ptr, out _exn)).Consume<System.Func<System.Threading.Tasks.Task>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_thunkTwiceMaker(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef thunk,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(defaultExercise6) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> DefaultExercise6(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_defaultExercise6(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_defaultExercise6(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(witness) -->
        /// </summary>
        public Cricut.TestAPI.TestAsyncFunctions Witness(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncFunctions_witness(Loader.env, _thisHandle.ptr, out _exn)).Consume<Cricut.TestAPI.TestAsyncFunctions>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncFunctions_witness(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static TestAsyncFunctions() { _TypeSetup._ensureLoaded(); }
    }
}
