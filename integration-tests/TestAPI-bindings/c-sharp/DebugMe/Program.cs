using System;
using Cricut.TestAPI;
using Cricut.FishyJoesRuntime;

record Vector {
    public double X { get; init; }
    public double Y { get; init; }

    public Vector(double x, double y) {
        X = x;
        Y = y;
    }
// record Vector(double X, double Y) {

    public Vector Normalized() {
        var length = Math.Sqrt(X * X + Y * Y);
        return new Vector(X / length, Y / length);
    }
}

class Program {

    static void Main(string[] args) {
        Loader.ensureLoaded();
        _TypeSetup._ensureLoaded();

        Console.WriteLine(Collections.MaybeArrayOfInt);

        var vec = new Vector(1, 2);
        vec = vec with { X = 2 };
        // vec.X = 3;
        Console.WriteLine(vec);
        Console.WriteLine(vec.Normalized());
    }
}
