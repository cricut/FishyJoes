using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

using static Cricut.FishyJoesRuntime.Loader;

namespace Cricut.BareBones {
    public class _TypeSetup {
        [DllImport("BareBones-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoes_BareBones_registerTypes();

        [DllImport("BareBones-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void BareBones_Skeleton_setup(
            IntPtr envRef,
            SwiftReference.ConstructorDelegate constructorMethod,
            out CreatedRef _exn
        );

        public static void _ensureLoaded() {}

        static _TypeSetup() {
            // There's no explicit way to call the static constructor, so do this instead
            FishyJoesRuntime.Loader.ensureLoaded();
            FishyJoes_BareBones_registerTypes();

            Once("setup_BareBones.Skeleton", () => {
                // Console.WriteLine("setting up BareBones.Skeleton...");
                Utilities.Check((out CreatedRef exn) => BareBones_Skeleton_setup(
                    Loader.env,
                    bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {
                        return new CreatedRef(new Cricut.BareBones.Skeleton(ptr));
                    })),
                    out exn
                ));
            });
        }
    }
}
