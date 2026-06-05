using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AssociatedDataEnum) -->
    /// </summary>
    public record AssociatedDataEnum {
        private AssociatedDataEnum() {}

        /// <summary>
        /// <para>Documentation about thing</para>
        /// </summary>
        public sealed record Thing(
            nint Value
        ) : AssociatedDataEnum;

        public sealed record Other(
            string Unnamed,
            nint _1
        ) : AssociatedDataEnum;

        /// <summary>
        /// <para>Documentation about bar</para>
        /// </summary>
        public sealed record Bar(
            string Named,
            Cricut.TestAPI.AssociatedDataEnum _1,
            bool Toggled
        ) : AssociatedDataEnum;

        /// <summary>
        /// <para>Documentation about noValue</para>
        /// </summary>
        public sealed record NoValue : AssociatedDataEnum;

        public sealed record None : AssociatedDataEnum;

        public sealed record SimpleEnum(
            Cricut.TestAPI.SimpleEnum Value
        ) : AssociatedDataEnum;

        /// <summary>
        /// <!-- FishyJoes.export(intValue) -->
        /// </summary>
        publicnint GetIntValue() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_AssociatedDataEnum_intValue(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(staticThing) -->
        /// </summary>
        public staticCricut.TestAPI.AssociatedDataEnum StaticThing {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AssociatedDataEnum_staticThing(Loader.env, out exn).Consume<Cricut.TestAPI.AssociatedDataEnum>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AssociatedDataEnum_staticThing(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(plus) -->
        /// </summary>
        publicCricut.TestAPI.AssociatedDataEnum Plus(
            Cricut.TestAPI.AssociatedDataEnum other
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AssociatedDataEnum_plus(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AssociatedDataEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AssociatedDataEnum_plus(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef other,
            out CreatedRef exn
        );

        static AssociatedDataEnum() { _TypeSetup._ensureLoaded(); }
    }
}
