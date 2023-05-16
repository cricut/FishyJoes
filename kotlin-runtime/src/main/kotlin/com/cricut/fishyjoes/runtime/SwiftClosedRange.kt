package com.cricut.fishyjoes.runtime

import kotlin.ranges.ClosedRange

/**
 * An interval from a lower bound up to, and including, an upper bound.
 *
 * Represents the concept of a range of values using rules identical to those used by Swift.
 * In contrast to a Kotlin ClosedRange, a Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
 *
 * Because a closed range includes its upper bound, a closed range whose lower bound
 * is equal to the upper bound contains that value. Therefore, a SwiftClosedRange instance
 * cannot represent an empty range.
 *
 * @property lowerBound The lower value of the range, inclusive.
 * @property upperBound The upper value of the range, inclusive.
 */
data class SwiftClosedRange<T: Comparable<T>>(
    var lowerBound: T,
    var upperBound: T
): ClosedRange<T> {
    override val start: T
        get() = lowerBound

    override val endInclusive: T
        get() = upperBound

    constructor(range: kotlin.ranges.ClosedRange<T>): this(range.start, range.endInclusive) {
        require(lowerBound <= upperBound) { "Swift ranges require lowerBound <= upperBound" }
    }
}
