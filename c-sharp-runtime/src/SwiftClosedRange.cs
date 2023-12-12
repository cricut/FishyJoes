using System;
using System.Diagnostics;

namespace Cricut.FishyJoesRuntime {
    // TODO: Easy conversion between System.Range and this type
    
    /// <summary>
    /// An interval from a lower bound up to, and including, an upper bound.
    ///
    /// Represents the concept of a range of values using rules identical to those used by Swift.
    /// In contrast to a System.Range, a Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
    /// 
    /// Because a closed range includes its upper bound, a closed range whose lower bound
    /// is equal to the upper bound contains that value. Therefore, a SwiftClosedRange instance
    /// cannot represent an empty range.
    /// </summary>
    public record SwiftClosedRange<T> where T : IComparable<T> {
        /// <summary>The lower value of the range, inclusive.</summary>
        public T LowerBound;
        /// <summary>The upper value of the range, inclusive.</summary>
        public T UpperBound;

        /// <summary>
        /// Constructs a range with an inclusive lower bound and inclusive upper bound.
        /// </summary>
        /// <param name="lowerBound">The range lower bound value, inclusive.</param>
        /// <param name="upperBound">The range upper bound value, inclusive. Must be equal to or greater than <c>lowerBound</c>.</param>
        public SwiftClosedRange(T lowerBound, T upperBound) {
            Trace.Assert(lowerBound.CompareTo(upperBound) <= 0, "Swift ranges require lowerBound <= upperBound");
            this.LowerBound = lowerBound;
            this.UpperBound = upperBound;
        }
    }
}
