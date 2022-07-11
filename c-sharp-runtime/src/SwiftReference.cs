using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// Holds a retained reference to a swift heap object. Use as the base class for adding more specific reference behavior
    public class SwiftReference : IDisposable {
        private IntPtr reference;

        public delegate IntPtr ConstructorDelegate(IntPtr reference, out IntPtr exn);

        protected SwiftReference(IntPtr reference) {
            this.reference = reference;
        }

        ~SwiftReference() {
            Dispose();
        }

        public void Dispose() {
            GC.SuppressFinalize(this);
            if (this.reference != IntPtr.Zero) {
                Check((out IntPtr exn) => SwiftReference.FJRuntime_SwiftReference_releaseRef(reference, out exn));
            }
            this.reference = IntPtr.Zero;
        }

        [DllImport("FishyJoesCSharpRuntime")]
        private static extern void FJRuntime_SwiftReference_releaseRef(IntPtr swiftReference, out IntPtr exn);
    }
}
