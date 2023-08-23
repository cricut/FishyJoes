using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// Holds a retained reference to a swift heap object. Use as the base class for adding more specific reference behavior
    public class SwiftReference : IDisposable {
        protected IntPtr reference;

        internal UnownedRef internalReference {
            get => new UnownedRef(reference);
        }

        public override string ToString() {
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_AnyBox_toString(new UnownedRef(reference), out exn)).Consume<string>();
        }

        public delegate CreatedRef ConstructorDelegate(ConsumedRef reference, out CreatedRef exn);

        protected SwiftReference(ConsumedRef reference) {
            this.reference = reference.__ptr;
        }

        ~SwiftReference() {
            Dispose();
        }

        public void Dispose() {
            GC.SuppressFinalize(this);
            if (this.reference != IntPtr.Zero) {
                Check((out CreatedRef exn) => SwiftReference.FishyJoesCommonRuntime_AnyBox_releaseRef(new ConsumedRef(reference), out exn));
            }
            this.reference = IntPtr.Zero;
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void FishyJoesCommonRuntime_AnyBox_releaseRef(ConsumedRef swiftReference, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef FishyJoesCommonRuntime_AnyBox_toString(UnownedRef swiftReference, out CreatedRef exn);

        internal static void ensureLoaded() {}
    }

    public partial class Loader {
        delegate UnownedRef AnyBoxRefGetter(UnownedRef obj, out CreatedRef exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_AnyBox_setup(AnyBoxRefGetter refGetter);

        private static void setupReferences() {
            FishyJoesCommonRuntime_AnyBox_setup(
                Loader.bag<AnyBoxRefGetter>((UnownedRef obj, out CreatedRef exn) => Catching(out exn, () => obj.Peek<SwiftReference>().internalReference))
            );
        }
    }
}
