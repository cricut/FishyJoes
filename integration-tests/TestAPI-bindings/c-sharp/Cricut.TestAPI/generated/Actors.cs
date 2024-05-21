using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Actors) -->
    /// </summary>
    public record Actors {
        private Actors() {}

        /// <summary>
        /// <!-- FishyJoes.export(Actors.TemperatureLogger) -->
        /// </summary>
        public class TemperatureLogger : SwiftReference {
            internal TemperatureLogger(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <!-- FishyJoes.export(label) -->
            /// </summary>
            public string Label {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Actors_TemperatureLogger_label(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Actors_TemperatureLogger_label(IntPtr envRef, UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(backwardsLabel) -->
            /// </summary>
            public string GetBackwardsLabel() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Actors_TemperatureLogger_backwardsLabel(IntPtr envRef, UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
            /// </summary>
            public string GetExtensionNonisolatedVarLabel() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Actors_TemperatureLogger_extensionNonisolatedVarLabel(IntPtr envRef, UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Actors.TemperatureLogger Create(
                string label,
                nint measurement
            ) {
                using var _labelHandle = new GCRef(label);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Actors_TemperatureLogger_create(Loader.env, _labelHandle.ptr, measurement, out _exn)).Consume<Cricut.TestAPI.Actors.TemperatureLogger>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Actors_TemperatureLogger_create(
                IntPtr envRef,
                UnownedRef label,
                nint measurement,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(update) -->
            /// </summary>
            public System.Threading.Tasks.Task Update(
                nint /* with */ measurement
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Actors_TemperatureLogger_update(Loader.env, _thisHandle.ptr, measurement, out _exn)).Consume<System.Threading.Tasks.Task>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Actors_TemperatureLogger_update(
                IntPtr envRef,
                UnownedRef self,
                nint measurement,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(min) -->
            /// </summary>
            public System.Threading.Tasks.Task<nint> Min(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Actors_TemperatureLogger_min(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Actors_TemperatureLogger_min(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
            /// </summary>
            public System.Threading.Tasks.Task<string> ExtensionIsolatedGetLabel(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Actors_TemperatureLogger_extensionIsolatedGetLabel(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
            /// </summary>
            public string ExtensionNonisolatedGetLabel(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Actors_TemperatureLogger_extensionNonisolatedGetLabel(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            static TemperatureLogger() { _TypeSetup._ensureLoaded(); }
        }
        static Actors() { _TypeSetup._ensureLoaded(); }
    }
}
