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
            if (Cricut.FishyJoesRuntime.Utilities.OutstandingHandleCount() != 2) {
                throw new Exception(
                    "Expected only 'true' and 'false' to still be referenced. Probably a memory leak!\n"
                    + "Or possibly a test class was run without the [Collection(\"root\")] annotation"
                );
            }
        }
    }

    [CollectionDefinition("root")]
    public class RootCollection : ICollectionFixture<GCFixture> {
        // This class has no code, and is never created. Its purpose is simply
        // to be the place to apply [CollectionDefinition] and all the
        // ICollectionFixture<> interfaces.
    }
}
