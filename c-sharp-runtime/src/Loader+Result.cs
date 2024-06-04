using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader {
    delegate CreatedRef ResultGetContents(IntPtr context, UnownedRef result, out byte isSuccess, out CreatedRef exn);
    delegate CreatedRef ResultConstructor(IntPtr context, byte isSuccess, ConsumedRef contents, out CreatedRef exn);

    [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    extern static void FishyJoesCommonRuntime_ResultConverter_setup(
        IntPtr envRef,
        string name,
        ResultGetContents getContents,
        ResultConstructor constructor,
        IntPtr context
    );

    public static void FishyJoesCommonRuntime_ResultConverter_setup<T, F>(IntPtr envRef, string name, out CreatedRef exn) where T: IComparable<T> {
        unsafe
        {
            FishyJoesCommonRuntime_ResultConverter_setup(
                envRef,
                name,
                bag<ResultGetContents>((IntPtr context, UnownedRef result, out byte outIsSuccess, out CreatedRef exn) => {
                    var (isSuccess, contents) = Catching(out exn, () =>
                        result.Peek<Result<T, F>>().Match(
                            value => (true, new CreatedRef(value)),
                            error => (false, new CreatedRef(error))
                        )
                    );
                    outIsSuccess = (byte)(isSuccess ? 1 : 0);
                    return contents;
                }),
                bag<ResultConstructor>((IntPtr context, byte isSuccess, ConsumedRef contents, out CreatedRef exn) => Catching(out exn, () =>
                    isSuccess != 0 ?
                        new CreatedRef(new Result<T, F>.Success(contents.Consume<T>())) :
                        new CreatedRef(new Result<T, F>.Failure(contents.Consume<F>())))),
                IntPtr.Zero
            );
            exn = CreatedRef.Null;
        }
    }

    private static void setupResults() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
