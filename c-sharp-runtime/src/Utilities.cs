using System;
using System.Runtime.InteropServices;

namespace Cricut.FishyJoesRuntime {
    public class Utilities {
        public class GCRef : IDisposable {
            public GCRef(object? obj) {
                handle = GCHandle.Alloc(obj);
            }
            private GCHandle handle;

            public IntPtr ptr {
                get => (IntPtr)handle;
            }
            
            ~GCRef() {
                Dispose();
            }

            public void Dispose() {
                handle.Free();
                GC.SuppressFinalize(this);
            }
        }

        public static R ConsumeHandle<R>(IntPtr ptr) {
            if (ptr == IntPtr.Zero) {
                return default(R)!;
            }
            var handle = GCHandle.FromIntPtr(ptr);
            var ret = (R)handle.Target!;
            handle.Free();
            return ret;
        }

        public delegate R CheckBody<R>(out IntPtr exn);
        public delegate void CheckVoidBody(out IntPtr exn);

        public static R Check<R>(CheckBody<R> body) {
            IntPtr exn = IntPtr.Zero;
            var result = body(out exn);
            if (exn != IntPtr.Zero) {
                var handle = GCHandle.FromIntPtr(exn);
                var exception = (Exception)handle.Target!;
                handle.Free();
                throw exception;
            }
            return result;
        }

        public static void Check(CheckVoidBody body) {
            IntPtr exn = IntPtr.Zero;
            body(out exn);
            if (exn != IntPtr.Zero) {
                var handle = GCHandle.FromIntPtr(exn);
                var exception = (Exception)handle.Target!;
                handle.Free();
                throw exception;
            }
        }

        public static R? Catching<R>(out IntPtr exn, Func<R> body) {
            try {
                var ret = body();
                exn = IntPtr.Zero;
                return ret;
            } catch (Exception e) {
                exn = GCHandle.ToIntPtr(GCHandle.Alloc(e));
                return default(R);
            }
        }

        public static void Catching(out IntPtr exn, Action body) {
            try {
                body();
                exn = IntPtr.Zero;
            } catch (Exception e) {
                exn = (IntPtr)GCHandle.Alloc(e);
            }
        }
    }
}
