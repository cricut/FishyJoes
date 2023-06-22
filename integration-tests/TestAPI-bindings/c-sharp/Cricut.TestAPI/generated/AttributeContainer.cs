using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(AttributeContainer) -->
    /// </summary>
    public class AttributeContainer : SwiftReference {
        internal AttributeContainer(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(attributes) -->
        /// </summary>
        public System.Collections.Generic.IDictionary<string, string> GetAttributes() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributeContainerASDF_Attributes(thisHandle.ptr, out exn).Consume<System.Collections.Generic.IDictionary<string, string>>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributeContainerASDF_Attributes(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        /// </summary>
        public static Cricut.TestAPI.AttributeContainer CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributeContainer>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributeContainerASDF_createEmpty(
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(merge) -->
        /// </summary>
        public void Merge(
            Cricut.TestAPI.AttributeContainer other,
            Cricut.TestAPI.AttributedString.AttributeMergePolicy? mergePolicy = null
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other);
            using var _mergePolicyHandle = new GCRef(mergePolicy);
            Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_merge(_thisHandle.ptr, _otherHandle.ptr, _mergePolicyHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributeContainerASDF_merge(
            UnownedRef self,
            UnownedRef other,
            UnownedRef mergePolicy,
            out CreatedRef exn
        );

        static AttributeContainer() { _TypeSetup._ensureLoaded(); }
    }
}
