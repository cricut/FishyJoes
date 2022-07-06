using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    public class SwiftReference : IDisposable {
        private IntPtr reference;

        protected SwiftReference(IntPtr reference) {
            this.reference = reference;
        }

        ~SwiftReference() {
            Dispose();
        }

        public void Dispose() {
            GC.SuppressFinalize(this);
            if (this.reference != IntPtr.Zero) {
                Check((out Exception? exn) => SwiftReference.FJRuntime_SwiftReference_releaseRef(reference, out exn));
            }
            this.reference = IntPtr.Zero;
        }

        [DllImport("FishyJoesCSharpRuntime")]
        private static extern void FJRuntime_SwiftReference_releaseRef(IntPtr swiftReference, out Exception exn);
    }
}
