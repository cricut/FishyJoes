using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para>An inhabited enum that the product annotated `exportReference` rather than</para>
    /// <para>`export`. An enum's cases are its only construction surface, so the generator</para>
    /// <para>must still surface the cases (mirroring the `export` enum path) instead of</para>
    /// <para>emitting an unconstructable, members-less opaque reference shell. Mirrors the</para>
    /// <para>real CriRaster `Image.Kind` / `Image.Color.Channel` shape.</para>
    /// <!-- FishyJoes.exportReference(ReferenceCaseEnum) -->
    /// </summary>
    public record ReferenceCaseEnum {
        private ReferenceCaseEnum() {}

        public sealed record North : ReferenceCaseEnum;

        public sealed record South : ReferenceCaseEnum;

        public sealed record East : ReferenceCaseEnum;

        public sealed record West : ReferenceCaseEnum;

        /// <summary>
        /// <para>Mirrors `Image.kind`: a value-returning accessor whose result must be</para>
        /// <para>comparable to a known case from Python.</para>
        /// <!-- FishyJoes.export(defaultDirection) -->
        /// </summary>
        public static Cricut.TestAPI.ReferenceCaseEnum GetDefaultDirection() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_ReferenceCaseEnum_defaultDirection(Loader.env, out exn).Consume<Cricut.TestAPI.ReferenceCaseEnum>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ReferenceCaseEnum_defaultDirection(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(opposite) -->
        /// </summary>
        public Cricut.TestAPI.ReferenceCaseEnum GetOpposite() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_ReferenceCaseEnum_opposite(Loader.env, thisHandle.ptr, out exn).Consume<Cricut.TestAPI.ReferenceCaseEnum>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ReferenceCaseEnum_opposite(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>A method that both consumes (parameter) and produces (return) the</para>
        /// <para>reference-annotated enum — only callable from Python if the cases bridge.</para>
        /// <!-- FishyJoes.export(rotate180) -->
        /// </summary>
        public static Cricut.TestAPI.ReferenceCaseEnum Rotate180(
            Cricut.TestAPI.ReferenceCaseEnum direction
        ) {
            using var _directionHandle = new GCRef(direction);
            return Check((out CreatedRef _exn) => __iota_TestAPI_ReferenceCaseEnum_rotate180(Loader.env, _directionHandle.ptr, out _exn)).Consume<Cricut.TestAPI.ReferenceCaseEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ReferenceCaseEnum_rotate180(
            IntPtr envRef,
            UnownedRef direction,
            out CreatedRef exn
        );

        static ReferenceCaseEnum() { _TypeSetup._ensureLoaded(); }
    }
}
