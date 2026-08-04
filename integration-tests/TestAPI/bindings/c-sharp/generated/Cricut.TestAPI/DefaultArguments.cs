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
        /// <!-- FishyJoes.export(describeEnumDefault) -->
        /// </summary>
        public static string DescribeEnumDefault(
            nint value,
            Cricut.TestAPI.SimpleEnum color
        ) {
            using var _colorHandle = new GCRef(color);
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_describeEnumDefault(Loader.env, value, _colorHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_describeEnumDefault(
            IntPtr envRef,
            nint value,
            UnownedRef color,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaultTolerance) -->
        /// </summary>
        public static double EchoDefaultTolerance(
            double tolerance = 1.4901161193847656E-8
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaultTolerance(Loader.env, tolerance, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_TestAPI_DefaultArguments_echoDefaultTolerance(
            IntPtr envRef,
            double tolerance,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaultIntLimits) -->
        /// </summary>
        public static string EchoDefaultIntLimits(
            nint minValue,
            nint maxValue
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaultIntLimits(Loader.env, minValue, maxValue, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_echoDefaultIntLimits(
            IntPtr envRef,
            nint minValue,
            nint maxValue,
            out CreatedRef exn
        );

        static DefaultArguments() { _TypeSetup._ensureLoaded(); }
    }
}
