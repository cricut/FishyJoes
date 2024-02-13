using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Threading.Tasks;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public partial class Loader {
        public static IntPtr env;

        // MARK: - Memory management

        // Keep delegates from being collected, because they will be called after setup finishes.
        private static List<object?> DelegateBag = new List<object?>();

        public static R bag<R>(R obj) {
            // Console.WriteLine($"bagging {obj?.GetType()}");
            DelegateBag.Add(obj);
            return obj;
        }

        delegate CreatedRef EnvNewRefFn(UnownedRef obj);
        delegate void EnvDeleteRefFn(ConsumedRef obj);
        unsafe delegate CreatedRef EnvNewErrorFn(ushort* message);
        unsafe delegate byte* EnvDescribeFn(UnownedRef obj);
        delegate void EnvScheduleThreadWorkFn(IntPtr envRef, IntPtr handlerContext);

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesCommonRuntime_Env_setup(
            EnvNewRefFn newRefFn,
            EnvDeleteRefFn deleteRefFn,
            EnvNewErrorFn newErrorFn,
            EnvDescribeFn describeFn,
            EnvScheduleThreadWorkFn scheduleThreadWorkFn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_runScheduledWork(IntPtr envRef, IntPtr context, out CreatedRef exn);

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern unsafe byte* FishyJoesCommonRuntime_strdup([MarshalAs(UnmanagedType.LPUTF8Str)] string? str);

        public static void ensureLoaded() { }
        static Loader() {
            unsafe {
                // Must setup Env first!
                env = FishyJoesCommonRuntime_Env_setup(
                    bag<EnvNewRefFn>(obj => new CreatedRef(obj.Peek<object?>())),
                    bag<EnvDeleteRefFn>(obj => { obj.Consume<object?>(); }),
                    bag<EnvNewErrorFn>(messagePtr => new CreatedRef(new Exception(Marshal.PtrToStringUni((IntPtr)messagePtr)))),
                    bag<EnvDescribeFn>(obj => FishyJoesCommonRuntime_strdup(obj.Peek<object?>()?.ToString())),
                    bag<EnvScheduleThreadWorkFn>((envRef, handlerContext) => {
                        // All threads are good C# threads, I think.
                        // https://learn.microsoft.com/en-us/dotnet/standard/threading/managed-and-unmanaged-threading-in-windows
                        // At least on windows??
                        Check((out CreatedRef exn) => FishyJoesCommonRuntime_runScheduledWork(envRef, handlerContext, out exn));
                    })
                );

                setupPrimitives();
                setupCollections();
                setupTuples();
                setupRanges();
                setupReferences();
                setupFunctions();
                setupMisc();
                setupAttributedString();
                setupFutures();
            }
        }
    }
}
