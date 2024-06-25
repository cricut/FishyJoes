using System;

namespace Cricut.TestAPI.Tests {
    public class Cleanup: IDisposable {
        public Cleanup() {
            Console.WriteLine("SETUP");
            Cricut.FishyJoesRuntime.Utilities.TrackAllocationsDebug = true;
        }

        public void Dispose() {
            Console.WriteLine("");
            Console.WriteLine("TEARDOWN");
            Cricut.FishyJoesRuntime.Utilities.PrintOutstandingHandles();
            if (Cricut.FishyJoesRuntime.Utilities.OutstandingHandleCount() != 2) {
                throw new Exception("Expected only 'true' and 'false' to still be referenced. Probably a memory leak!");
            }
        }
    }
}
