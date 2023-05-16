package com.cricut.fishyjoes.runtime

// TODO: Conform to OpenEndRange<T> when it becomes available

/**
 * A half-open interval from a lower bound up to, but not including, an upper bound.
 *
 * Represents the concept of a half-open range of values using rules identical to those used by Swift.
 * In contrast to a Kotlin ClosedRange, a Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
 *
 * Because a half-open range does not include its upper bound, a half-open range whose lower bound
 * is equal to the upper bound represents an empty range.
 *
 * @property lowerBound The lower value of the range, inclusive.
 * @property upperBound The upper value of the range, exclusive.
 */
data class SwiftRange<T: Comparable<T>>(
    var lowerBound: T,
    var upperBound: T
)/*: OpenEndRange<T>*/ {
    /*override*/ val start: T
        get() = lowerBound

    /*override*/ val endExclusive: T
        get() = upperBound

    init {
        require(lowerBound <= upperBound) { "Swift ranges require lowerBound <= upperBound" }
    }

//    constructor(range: kotlin.ranges.OpenEndRange<T>): this(range.start, range.endExclusive)
}
