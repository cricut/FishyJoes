using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef SwiftRangeLowerBoundGetter(UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef SwiftRangeUpperBoundGetter(UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef SwiftRangeConstructor(UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn);

    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesCommonRuntime_RangeConverter_setup(
        string name,
        SwiftRangeLowerBoundGetter getLowerBound,
        SwiftRangeUpperBoundGetter getUpperBound,
        SwiftRangeConstructor constructor
    );

    public static void FishyJoesCommonRuntime_RangeConverter_setup<T>(string name, out CreatedRef exn) where T: IComparable<T> {
        unsafe {
            FishyJoesCommonRuntime_RangeConverter_setup(
                name,
                bag<SwiftRangeLowerBoundGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftRange<T>>().lowerBound)
                )),
                bag<SwiftRangeUpperBoundGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftRange<T>>().upperBound)
                )),
                bag<SwiftRangeConstructor>((UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new SwiftRange<T>(
                        lowerBound.Peek<T>(),
                        upperBound.Peek<T>()
                    ))
                ))
            );
            exn = CreatedRef.Null;
        }
    }

    delegate CreatedRef SwiftClosedRangeLowerBoundGetter(UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef SwiftClosedRangeUpperBoundGetter(UnownedRef obj, out CreatedRef exn);
    unsafe delegate CreatedRef SwiftClosedRangeConstructor(UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn);

    [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesCommonRuntime_ClosedRangeConverter_setup(
        string name,
        SwiftClosedRangeLowerBoundGetter getLowerBound,
        SwiftClosedRangeUpperBoundGetter getEndInclusive,
        SwiftClosedRangeConstructor constructor
    );

    public static void FishyJoesCommonRuntime_ClosedRangeConverter_setup<T>(string name, out CreatedRef exn) where T: IComparable<T> {
        unsafe {
            FishyJoesCommonRuntime_ClosedRangeConverter_setup(
                name,
                bag<SwiftClosedRangeLowerBoundGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftClosedRange<T>>().lowerBound)
                )),
                bag<SwiftClosedRangeUpperBoundGetter>((UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftClosedRange<T>>().upperBound)
                )),
                bag<SwiftClosedRangeConstructor>((UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new SwiftClosedRange<T>(
                        lowerBound.Peek<T>(),
                        upperBound.Peek<T>()
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
