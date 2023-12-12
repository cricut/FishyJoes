using System;
using System.Diagnostics;

namespace Cricut.FishyJoesRuntime {
    // TODO: Easy conversion between System.Range and this type

    /// <summary>
    /// A half-open interval from a lower bound up to, but not including, an upper bound.
    /// Represents the concept of a half-open range of values using rules identical to those used by Swift.
    /// In contrast to a Kotlin ClosedRange, a Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
    ///
    /// Because a half-open range does not include its upper bound, a half-open range whose lower bound
    /// is equal to the upper bound represents an empty range.
    /// </summary>
    public record SwiftRange<T> where T : IComparable<T> {
        /// <summary>The range lower bound value, inclusive.</summary>
        public T LowerBound;
        /// <summary>The range upper bound value, exclusive.</summary>
        public T UpperBound;

        /// <summary>
        /// Constructs a range with an inclusive lower bound and exclusive upper bound.
        /// </summary>
        /// <param name="lowerBound">The range lower bound value, inclusive.</param>
        /// <param name="upperBound">The range upper bound value, exclusive. Must be equal to or greater than <c>lowerBound</c>.</param>
        public SwiftRange(T lowerBound, T upperBound) {
            Trace.Assert(lowerBound.CompareTo(upperBound) <= 0, "Swift ranges require lowerBound <= upperBound");
            this.LowerBound = lowerBound;
            this.UpperBound = upperBound;
        }
    }
}
