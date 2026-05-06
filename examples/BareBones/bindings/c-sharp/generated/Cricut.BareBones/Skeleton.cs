using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.BareBones {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Skeleton) -->
    /// </summary>
    public class Skeleton : SwiftReference {
        internal Skeleton(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(boneCount) -->
        /// </summary>
        public static nint BoneCount {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_BareBones_Skeleton_boneCount(Loader.env, out exn)
                );
            }
        }

        [DllImport("BareBones-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_BareBones_Skeleton_boneCount(IntPtr envRef, out CreatedRef exn);

        static Skeleton() { _TypeSetup._ensureLoaded(); }
    }
}
