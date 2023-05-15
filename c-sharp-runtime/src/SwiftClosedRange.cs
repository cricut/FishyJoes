using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    // TODO: Docs
    // TODO: Easy conversion between System.Range and this type
    public record SwiftClosedRange<T> {
        public T lowerBound;
        public T upperBound;

        public SwiftClosedRange(T lowerBound, T upperBound) {
            this.lowerBound = lowerBound;
            this.upperBound = upperBound;
        }
    }
}
