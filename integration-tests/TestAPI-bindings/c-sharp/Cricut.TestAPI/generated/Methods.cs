using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Methods) -->
    /// </summary>
    public class Methods : SwiftReference {
        internal Methods(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(staticGet) -->
        /// </summary>
        public static nint GetStaticGet() {
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_StaticGet(out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_StaticGet(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
        /// </summary>
        public static nint GetStaticGetMethod() {
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_StaticGetMethod(out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_StaticGetMethod(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(staticModifiable) -->
        /// </summary>
        public static nint GetStaticModifiable() {
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_StaticModifiable(out exn)
            );
        }
        public static void SetStaticModifiable(nint value) {
            Check((out CreatedRef exn) =>
                __iota_set_Methods_StaticModifiable(value, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_StaticModifiable(out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_Methods_StaticModifiable(nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(staticStored) -->
        /// </summary>
        public static nint StaticStored {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_Methods_StaticStored(out exn)
                );
            }
            set {
                Check((out CreatedRef exn) =>
                    __iota_set_Methods_StaticStored(value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_StaticStored(out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_Methods_StaticStored(nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceGet) -->
        /// </summary>
        public nint GetInstanceGet() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_InstanceGet(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_InstanceGet(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
        /// </summary>
        public nint GetInstanceGetMethod() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_InstanceGetMethod(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_InstanceGetMethod(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceModifiable) -->
        /// </summary>
        public nint GetInstanceModifiable() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_Methods_InstanceModifiable(thisHandle.ptr, out exn)
            );
        }
        public void SetInstanceModifiable(nint value) {
            using var thisHandle = new GCRef(this);
            Check((out CreatedRef exn) =>
                __iota_set_Methods_InstanceModifiable(thisHandle.ptr, value, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_InstanceModifiable(UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_Methods_InstanceModifiable(UnownedRef self, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceStored) -->
        /// </summary>
        public nint InstanceStored {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Methods_InstanceStored(thisHandle.ptr, out exn)
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                Check((out CreatedRef exn) =>
                    __iota_set_Methods_InstanceStored(thisHandle.ptr, value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Methods_InstanceStored(UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_Methods_InstanceStored(UnownedRef self, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.Methods Create(
        ) {
            return Check((out CreatedRef _exn) => __iota_Methods_create(out _exn)).Consume<Cricut.TestAPI.Methods>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Methods_create(
            out CreatedRef exn
        );

        static Methods() { _TypeSetup._ensureLoaded(); }
    }
}
