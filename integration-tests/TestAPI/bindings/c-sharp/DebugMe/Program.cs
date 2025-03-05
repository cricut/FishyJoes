using System;
using System.Threading.Tasks;
using Cricut.TestAPI;
using Cricut.FishyJoesRuntime;

class Program {

    static async Task Main(string[] args) {
        int nProcessId = System.Diagnostics.Process.GetCurrentProcess().Id;
        System.Diagnostics.Debug.WriteLine($"nProcessId: {nProcessId}");

        Cricut.FishyJoesRuntime.Utilities.TrackAllocationsDebug = true;

        Loader.ensureLoaded();
        _TypeSetup._ensureLoaded();

        var composed = AsyncFunctions.IntCompose(x => Task.FromResult(x + 1), x => Task.FromResult(x * 3));
        Console.WriteLine(await composed(3));
        var a = new AProtocolImplementation(Foo: "Garply", Baz: false);            

        System.Diagnostics.Debug.WriteLine($"a: {a}");

        var b = a.Bar(x: 2, y: 128);
        System.Diagnostics.Debug.WriteLine($"b: {b}");

        Console.WriteLine("");
        Console.WriteLine("TEARDOWN");
        Cricut.FishyJoesRuntime.Utilities.PrintOutstandingHandles();
        // Currently this gives 4 handles, not sure why it's more than in tests
    }
}
