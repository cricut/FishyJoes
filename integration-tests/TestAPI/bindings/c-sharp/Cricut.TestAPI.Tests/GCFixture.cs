using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    // https://stackoverflow.com/a/33778396/73681
    public sealed class GCFixture: IDisposable {
        public GCFixture() {
            Console.WriteLine("SETUP");
            Cricut.FishyJoesRuntime.Utilities.TrackAllocationsDebug = true;
        }

        public void Dispose() {
            Console.WriteLine("");
            Console.WriteLine("TEARDOWN");
            Cricut.FishyJoesRuntime.Utilities.PrintOutstandingHandles();
            #if DEBUG
            // The Swift handles for `true` and `false` are created lazily: they exist only
            // once the runtime's Loader initialization has called Swift_Bool_setup, which a
            // filtered test run may never trigger. So a clean run ends with either 0
            // outstanding handles (Bool setup never ran) or exactly 2 (the Bool singletons).
            // Any other count is a leak.
            var outstandingHandleCount = Cricut.FishyJoesRuntime.Utilities.OutstandingHandleCount();
            if (outstandingHandleCount != 0 && outstandingHandleCount != 2) {
                throw new Exception(
                    "Expected no outstanding handles, or only 'true' and 'false' to still be referenced. Probably a memory leak!\n"
                    + "Or possibly a test class was run without the [Collection(\"root\")] annotation"
                );
            }
            #else
            Console.WriteLine("Not in debug mode, didn't perform leak check")
            #endif
        }
    }

    [CollectionDefinition("root")]
    public class RootCollection : ICollectionFixture<GCFixture> {
        // This class has no code, and is never created. Its purpose is simply
        // to be the place to apply [CollectionDefinition] and all the
        // ICollectionFixture<> interfaces.
    }
}
