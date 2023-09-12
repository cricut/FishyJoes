/// A half-open interval from a lower bound up to, but not including, an upper bound.
///
/// Represents the concept of a half-open range of values using rules identical to those used by Swift.
/// A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
///
/// Because a half-open range does not include its upper bound, a half-open range whose lower bound
/// is equal to the upper bound represents an empty range.
///
/// @property lowerBound The lower value of the range, inclusive.
/// @property upperBound The upper value of the range, exclusive.
class SwiftRange<T extends Comparable> {
  T lowerBound;
  T upperBound;

  SwiftRange(this.lowerBound, this.upperBound) {
    if (lowerBound.compareTo(upperBound) > 0) {
      throw ArgumentError("Swift ranges require lowerBound <= upperBound");
    }
  }
}

/// An interval from a lower bound up to, and including, an upper bound.
///
/// Represents the concept of a range of values using rules identical to those used by Swift.
/// A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
///
/// Because a closed range includes its upper bound, a closed range whose lower bound
/// is equal to the upper bound contains that value. Therefore, a SwiftClosedRange instance
/// cannot represent an empty range.
///
/// @property lowerBound The lower value of the range, inclusive.
/// @property upperBound The upper value of the range, inclusive.
class SwiftClosedRange<T extends Comparable> {
  T lowerBound;
  T upperBound;

  SwiftClosedRange(this.lowerBound, this.upperBound) {
    if (lowerBound.compareTo(upperBound) > 0) {
      throw ArgumentError("Swift ranges require lowerBound <= upperBound");
    }
  }
}