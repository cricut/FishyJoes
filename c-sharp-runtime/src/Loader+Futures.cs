using System;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime;

public partial class Loader
{
    unsafe delegate CreatedRef future_Create(IntPtr context, CreatedRef* outPromise, out CreatedRef exn);
    delegate void future_SinkMethod(IntPtr context, UnownedRef future, ConsumedRef handlerContext, out CreatedRef exn);
    delegate void future_ResolveRejectMethod(IntPtr context, ConsumedRef promise, ConsumedRef result, out CreatedRef exn);

    [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode, EntryPoint = "FishyJoesCommonRuntime_FutureConverter_setup")]
    static extern void _FishyJoesCommonRuntime_FutureConverter_setup(
        IntPtr env,
        string name,
        future_Create create,
        future_SinkMethod sinkMethod,
        future_ResolveRejectMethod resolveMethod,
        future_ResolveRejectMethod rejectMethod,
        IntPtr context,
        out CreatedRef exn
    );

    [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
    static extern void FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
        IntPtr env,
        ConsumedRef handlerContext,
        Boolean success,
        ConsumedRef result,
        out CreatedRef foreignOutExn
    );

    public static void FishyJoesCommonRuntime_FutureConverter_setup<T>(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            _FishyJoesCommonRuntime_FutureConverter_setup(
                envRef,
                name,
                bag<future_Create>(
                    (IntPtr _, CreatedRef* outPromise, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            var source = new TaskCompletionSource<T>();
                            *outPromise = new CreatedRef(source);
                            return new CreatedRef(source.Task);
                        })
                ),
                bag<future_SinkMethod>(
                    (IntPtr _, UnownedRef future, ConsumedRef handlerContext, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            future.Peek<Task<T>>().ContinueWith((Task<T> task) =>
                                Check((out CreatedRef exn) => {
                                    if (task.IsCompletedSuccessfully) {
                                        FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                                            envRef,
                                            handlerContext,
                                            true,
                                            ConsumedRef.Create(task.Result),
                                            out exn
                                        );
                                    } else {
                                        FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                                            envRef,
                                            handlerContext,
                                            false,
                                            ConsumedRef.Create(task.Exception),
                                            out exn
                                        );
                                    }
                                })
                            );
                        })
                ),
                bag<future_ResolveRejectMethod>(
                    (IntPtr _, ConsumedRef promise, ConsumedRef result, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            promise.Consume<TaskCompletionSource<T>>().SetResult(result.Consume<T>());
                        })
                ),
                bag<future_ResolveRejectMethod>(
                    (IntPtr _, ConsumedRef promise, ConsumedRef result, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            promise.Consume<TaskCompletionSource<T>>().SetException(result.Consume<Exception>());
                        })
                ),
                IntPtr.Zero,
                out exn
            );
        }
    }

    // Near duplicate of above code, but with generics removed because of the whole C#-void thing
    public static void FishyJoesCommonRuntime_FutureConverter_setup(IntPtr envRef, string name, out CreatedRef exn) {
        unsafe {
            _FishyJoesCommonRuntime_FutureConverter_setup(
                envRef,
                name,
                bag<future_Create>(
                    (IntPtr _, CreatedRef* outPromise, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            var source = new TaskCompletionSource();
                            *outPromise = new CreatedRef(source);
                            return new CreatedRef(source.Task);
                        })
                ),
                bag<future_SinkMethod>(
                    (IntPtr _, UnownedRef future, ConsumedRef handlerContext, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            future.Peek<Task>().ContinueWith((Task task) =>
                                Check((out CreatedRef exn) => {
                                    if (task.IsCompletedSuccessfully) {
                                        FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                                            envRef,
                                            handlerContext,
                                            true,
                                            new ConsumedRef(IntPtr.Zero),
                                            out exn
                                        );
                                    } else {
                                        FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(
                                            envRef,
                                            handlerContext,
                                            false,
                                            ConsumedRef.Create(task.Exception),
                                            out exn
                                        );
                                    }
                                })
                            );
                        })
                ),
                bag<future_ResolveRejectMethod>(
                    (IntPtr _, ConsumedRef promise, ConsumedRef result, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            result.Consume<object?>();
                            promise.Consume<TaskCompletionSource>().SetResult();
                        })
                ),
                bag<future_ResolveRejectMethod>(
                    (IntPtr _, ConsumedRef promise, ConsumedRef result, out CreatedRef exn) =>
                        Catching(out exn, () => {
                            promise.Consume<TaskCompletionSource>().SetException(result.Consume<Exception>());
                        })
                ),
                IntPtr.Zero,
                out exn
            );
        }
    }


    private static void setupFutures() {
        // Generic types need to be set up as instantiated types, so nothing to do here.
    }
}
