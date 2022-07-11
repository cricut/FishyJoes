using System;
using System.Runtime.InteropServices;

namespace Cricut.FishyJoesRuntime {
    public class Utilities {
        /// Holds onto a GC Handle for the lifetime of the object
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

        /// Returns the target of a handle, and frees the handle.
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

        /// Passes an exception out-parameter for body to report any errors, If set to non-null, it will then throw the exception.
        /// `body` passes ownership of `exn` to `Check`
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

        /// Passes an exception out-parameter for body to report any errors, If set to non-null, it will then throw the exception.
        /// `body` passes ownership of `exn` to `Check`
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

        /// Converts any thrown exceptions in `body` into setting of out parameter `exn`. Caller is responsible for ownership of `exn`
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

        /// Converts any thrown exceptions in `body` into setting of out parameter `exn`. Caller is responsible for ownership of `exn`
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
