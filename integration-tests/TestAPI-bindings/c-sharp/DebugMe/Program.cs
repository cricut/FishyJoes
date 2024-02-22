using System;
using System.Threading.Tasks;
using Cricut.TestAPI;
using Cricut.FishyJoesRuntime;

class Program {

    static async Task Main(string[] args) {
        Cricut.FishyJoesRuntime.Utilities.TrackAllocationsDebug = true;

        Loader.ensureLoaded();
        _TypeSetup._ensureLoaded();

        var composed = AsyncFunctions.IntCompose(x => Task.FromResult(x + 1), x => Task.FromResult(x * 3));
        Console.WriteLine(await composed(3));

        Console.WriteLine("");
        Console.WriteLine("TEARDOWN");
        Cricut.FishyJoesRuntime.Utilities.PrintOutstandingHandles();
        // Currently this gives 4 handles, not sure why it's more than in tests
    }
}
