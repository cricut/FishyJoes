using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(DefaultArguments) -->
    /// </summary>
    public record DefaultArguments {
        private DefaultArguments() {}

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
        /// </summary>
        public static string EchoDefaults(
            nint? x,
            nint? y = null,
            double /* theLabelForZ */ z = 3.14
        ) {
            using var _yHandle = new GCRef(y);
            using var _xHandle = new GCRef(x);
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaults(Loader.env, _yHandle.ptr, _xHandle.ptr, z, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_echoDefaults(
            IntPtr envRef,
            UnownedRef y,
            UnownedRef x,
            double z,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaultIntLimits) -->
        /// </summary>
        public static string EchoDefaultIntLimits(
            nint? minValue = null,
            nint? maxValue = null
        ) {
            nint _minValue = minValue ?? Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaultIntLimits_default_minValue(Loader.env, out _exn));
            nint _maxValue = maxValue ?? Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaultIntLimits_default_maxValue(Loader.env, out _exn));
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaultIntLimits(Loader.env, _minValue, _maxValue, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_echoDefaultIntLimits(
            IntPtr envRef,
            nint minValue,
            nint maxValue,
            out CreatedRef exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_DefaultArguments_echoDefaultIntLimits_default_minValue(IntPtr envRef, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_DefaultArguments_echoDefaultIntLimits_default_maxValue(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoExplicitIntMax) -->
        /// </summary>
        public static string EchoExplicitIntMax(
            nint? value = null
        ) {
            nint _value = value ?? Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoExplicitIntMax_default_value(Loader.env, out _exn));
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoExplicitIntMax(Loader.env, _value, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_echoExplicitIntMax(
            IntPtr envRef,
            nint value,
            out CreatedRef exn
        );

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_DefaultArguments_echoExplicitIntMax_default_value(IntPtr envRef, out CreatedRef exn);

        static DefaultArguments() { _TypeSetup._ensureLoaded(); }
    }
}
