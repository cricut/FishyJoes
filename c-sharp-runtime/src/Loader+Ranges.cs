using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef SwiftRangeLowerBoundGetter(IntPtr context, UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef SwiftRangeUpperBoundGetter(IntPtr context,UnownedRef obj, out CreatedRef exn);
    delegate CreatedRef SwiftRangeConstructor(IntPtr context, UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn);

    [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    extern static void FishyJoesCommonRuntime_RangeConverter_setup(
        IntPtr envRef,
        string name,
        SwiftRangeLowerBoundGetter getLowerBound,
        SwiftRangeUpperBoundGetter getUpperBound,
        SwiftRangeConstructor constructor,
        IntPtr context
    );

    public static void FishyJoesCommonRuntime_RangeConverter_setup<T>(IntPtr envRef, string name, out CreatedRef exn) where T: IComparable<T> {
        unsafe {
            FishyJoesCommonRuntime_RangeConverter_setup(
                envRef,
                name,
                bag<SwiftRangeLowerBoundGetter>((IntPtr context, UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftRange<T>>().lowerBound)
                )),
                bag<SwiftRangeUpperBoundGetter>((IntPtr context, UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftRange<T>>().upperBound)
                )),
                bag<SwiftRangeConstructor>((IntPtr context, UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new SwiftRange<T>(
                        lowerBound.Peek<T>(),
                        upperBound.Peek<T>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    public static void FishyJoesCommonRuntime_ClosedRangeConverter_setup<T>(IntPtr envRef, string name, out CreatedRef exn) where T: IComparable<T> {
        unsafe {
            FishyJoesCommonRuntime_RangeConverter_setup(
                envRef,
                name,
                bag<SwiftRangeLowerBoundGetter>((IntPtr context, UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftClosedRange<T>>().lowerBound)
                )),
                bag<SwiftRangeUpperBoundGetter>((IntPtr context, UnownedRef range, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(range.Peek<SwiftClosedRange<T>>().upperBound)
                )),
                bag<SwiftRangeConstructor>((IntPtr context, UnownedRef lowerBound, UnownedRef upperBound, out CreatedRef exn) => Catching(out exn, () =>
                    new CreatedRef(new SwiftClosedRange<T>(
                        lowerBound.Peek<T>(),
                        upperBound.Peek<T>()
                    ))
                )),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    private static void setupRanges() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
