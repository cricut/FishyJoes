using System;
using Cricut.TestAPI;
using Cricut.FishyJoesRuntime;

class Program {

    static void Main(string[] args) {
        Loader.ensureLoaded();
        _TypeSetup._ensureLoaded();

        Console.WriteLine(Strings.Emoji);
    }
}
