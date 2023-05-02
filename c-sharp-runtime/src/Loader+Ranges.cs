using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef OpenRangeStartGetter(UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef OpenRangeEndExclusiveGetter(UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef OpenRangeConstructor(UnownedRef start, UnownedRef endExclusive, out CreatedRef exn);

    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_RangeConverter_setup(
        string name,
        OpenRangeStartGetter getStart,
        OpenRangeEndExclusiveGetter getEndExclusive,
        OpenRangeConstructor constructor
    );

    public static void FishyJoesRuntime_RangeConverter_setup<T>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_RangeConverter_setup(
                name,
                bag<OpenRangeStartGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<OpenRange<T>>().start)
                )),
                bag<OpenRangeEndExclusiveGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<OpenRange<T>>().endExclusive)
                )),
                bag<OpenRangeConstructor>((UnownedRef start, UnownedRef endExclusive, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new OpenRange<T>(
                        start.Peek<T>(),
                        endExclusive.Peek<T>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    delegate CreatedRef ClosedRangeStartGetter(UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef ClosedRangeEndInclusiveGetter(UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef ClosedRangeConstructor(UnownedRef start, UnownedRef endInclusive, out CreatedRef exn);

    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesRuntime_ClosedRangeConverter_setup(
        string name,
        ClosedRangeStartGetter getStart,
        ClosedRangeEndInclusiveGetter getEndInclusive,
        ClosedRangeConstructor constructor
    );

    public static void FishyJoesRuntime_ClosedRangeConverter_setup<T>(string name, out CreatedRef exn) {
        unsafe {
            FishyJoesRuntime_ClosedRangeConverter_setup(
                name,
                bag<ClosedRangeStartGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<ClosedRange<T>>().start)
                )),
                bag<ClosedRangeEndInclusiveGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<ClosedRange<T>>().endInclusive)
                )),
                bag<ClosedRangeConstructor>((UnownedRef start, UnownedRef endInclusive, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new ClosedRange<T>(
                        start.Peek<T>(),
                        endInclusive.Peek<T>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    private static void setupRanges() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
