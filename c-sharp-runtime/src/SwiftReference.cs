using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// Holds a retained reference to a swift heap object. Use as the base class for adding more specific reference behavior
    public class SwiftReference : IDisposable {
        protected IntPtr reference;

        internal IntPtr internalReference {
            get => reference;
        }

        public override string ToString() {
            return ConsumeHandle<string>(Check((out IntPtr exn) => FishyJoesRuntime_AnyBox_toString(reference, out exn)));
        }

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
                Check((out IntPtr exn) => SwiftReference.FishyJoesRuntime_AnyBox_releaseRef(reference, out exn));
            }
            this.reference = IntPtr.Zero;
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void FishyJoesRuntime_AnyBox_releaseRef(IntPtr swiftReference, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr FishyJoesRuntime_AnyBox_toString(IntPtr swiftReference, out IntPtr exn);

        internal static void ensureLoaded() {}
    }

    public partial class Loader {
        delegate IntPtr AnyBoxRefGetter(IntPtr obj, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_AnyBox_setup(AnyBoxRefGetter refGetter);

        private static void setupReferences() {
            FishyJoesRuntime_AnyBox_setup(
                Loader.bag<AnyBoxRefGetter>((IntPtr obj, out IntPtr exn) => Catching(out exn, () => PeekHandle<SwiftReference>(obj).internalReference))
            );
        }
    }
}
