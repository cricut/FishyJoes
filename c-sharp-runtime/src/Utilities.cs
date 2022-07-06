using System;
using System.Runtime.InteropServices;

namespace Cricut.FishyJoesRuntime {
    public class Utilities {
        public delegate R CheckBody<R>(out Exception? exn);
        public delegate void CheckVoidBody(out Exception? exn);

        public static R Check<R>(CheckBody<R> body) {
            Exception? exn = null;
            var result = body(out exn);
            if (exn != null) {
                throw exn;
            }
            return result;
        }

        public static void Check(CheckVoidBody body) {
            Exception? exn;
            body(out exn);
            if (exn != null) {
                throw exn;
            }
        }
    }
}
