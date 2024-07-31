using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestPropertiesProtocol) -->
    /// </summary>
    public class ExternalWitness_TestPropertiesProtocol : SwiftReference, Cricut.TestAPI.TestPropertiesProtocol {
        internal ExternalWitness_TestPropertiesProtocol(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(corge) -->
        /// </summary>
        public string Corge {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestPropertiesProtocol_corge(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestPropertiesProtocol_corge(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(frobby) -->
        /// </summary>
        public System.Collections.Generic.IList<nint> Frobby {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestPropertiesProtocol_frobby(Loader.env, thisHandle.ptr, out exn).Consume<System.Collections.Generic.IList<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestPropertiesProtocol_frobby(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static ExternalWitness_TestPropertiesProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
