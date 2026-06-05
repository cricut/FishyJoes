using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->
    /// </summary>
    public class TestDefaultComputedPropertiesReference : SwiftReference, Cricut.TestAPI.TestDefaultComputedProperties {
        internal TestDefaultComputedPropertiesReference(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(noot) -->
        /// </summary>
        publicnint Noot {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.env, thisHandle.ptr, out exn)
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(Loader.env, thisHandle.ptr, value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_TestDefaultComputedPropertiesClass_noot(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_TestDefaultComputedPropertiesClass_noot(IntPtr envRef, UnownedRef self, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(plutonic) -->
        /// </summary>
        publicstring GetPlutonic() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota__default_TestAPI_TestDefaultComputedPropertiesClass_plutonic(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(spam) -->
        /// </summary>
        publicbool Spam {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.env, thisHandle.ptr, out exn)
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(Loader.env, thisHandle.ptr, value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        [return: MarshalAs(UnmanagedType.I1)]
        private static extern bool __iota_get_TestAPI_TestDefaultComputedPropertiesClass_spam(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_TestDefaultComputedPropertiesClass_spam(IntPtr envRef, UnownedRef self, [MarshalAs(UnmanagedType.I1)] bool value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(noot) -->
        /// </summary>
        publicnint GetNoot(
        ) {
            return Noot;
        }

        /// <summary>
        /// <!-- FishyJoes.export(init) -->
        /// </summary>
        public staticCricut.TestAPI.TestDefaultComputedPropertiesReference Init(
            bool spam,
            nint noot
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestDefaultComputedPropertiesClass_init(Loader.env, spam, noot, out _exn)).Consume<Cricut.TestAPI.TestDefaultComputedPropertiesReference>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestDefaultComputedPropertiesClass_init(
            IntPtr envRef,
            [MarshalAs(UnmanagedType.I1)] bool spam,
            nint noot,
            out CreatedRef exn
        );

        static TestDefaultComputedPropertiesReference() { _TypeSetup._ensureLoaded(); }
    }
}
