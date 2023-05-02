using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    // TODO: Docs
    // TODO: Easy conversion between System.Range and this type
    public record OpenRange<T> {
        public T start;
        public T endExclusive;

        public OpenRange(T start, T endExclusive) 
        {
            this.start = start;
            this.endExclusive = endExclusive;
        }
    }
}
