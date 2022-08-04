using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {

        // MARK: - Memory management

        // Keep delegates from being collected, because they will be called after setup finishes.
        private static List<object?> DelegateBag = new List<object?>();

        public static R bag<R>(R obj) {
            // Console.WriteLine($"bagging {obj?.GetType()}");
            DelegateBag.Add(obj);
            return obj;
        }

        delegate IntPtr EnvNewRefFn(IntPtr obj);
        delegate void EnvDeleteRefFn(IntPtr obj);
        delegate IntPtr EnvNewErrorFn(string message);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Env_setup(
            EnvNewRefFn newRefFn,
            EnvDeleteRefFn deleteRefFn,
            EnvNewErrorFn newErrorFn
        );

        public static void ensureLoaded() { }
        static Loader() {
            // Must setup Env first!
            FishyJoesRuntime_Env_setup(
                bag<EnvNewRefFn>(obj => PassOwnership(PeekHandle<object?>(obj))),
                bag<EnvDeleteRefFn>(obj => { ConsumeHandle<object?>(obj); }),
                bag<EnvNewErrorFn>(message => PassOwnership(new Exception(message)))
            );

            setupPrimitives();
            setupCollections();
            setupTuples();
            setupReferences();
            setupFunctions();
            setupMisc();
        }
    }
}
