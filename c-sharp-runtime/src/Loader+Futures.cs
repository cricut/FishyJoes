using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    public static void FishyJoesCommonRuntime_FutureConverter_setup(IntPtr envRef, string name, out CreatedRef exn) {
        // TODO
        exn = CreatedRef.Null;
    }

    public static void FishyJoesCommonRuntime_FutureConverter_setup<T>(IntPtr envRef, string name, out CreatedRef exn) {
        // TODO
        exn = CreatedRef.Null;
    }

    private static void setupFutures() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
