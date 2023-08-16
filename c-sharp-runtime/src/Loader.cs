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

        delegate CreatedRef EnvNewRefFn(UnownedRef obj);
        delegate void EnvDeleteRefFn(ConsumedRef obj);
        delegate CreatedRef EnvNewErrorFn(string message);
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
                bag<EnvNewRefFn>(obj => new CreatedRef(obj.Peek<object?>())),
                bag<EnvDeleteRefFn>(obj => { obj.Consume<object?>(); }),
                bag<EnvNewErrorFn>(message => new CreatedRef(new Exception(message)))
            );

            setupPrimitives();
            setupCollections();
            setupTuples();
            setupRanges();
            setupReferences();
            setupFunctions();
            setupMisc();
            setupAttributedString();
        }
    }
}
