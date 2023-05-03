using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    // TODO: Docs
    // TODO: Easy conversion between System.Range and this type
    public record ClosedRange<T> {
        public T start;
        public T endInclusive;

        public ClosedRange(T start, T endInclusive) {
            this.start = start;
            this.endInclusive = endInclusive;
        }
    }
}
