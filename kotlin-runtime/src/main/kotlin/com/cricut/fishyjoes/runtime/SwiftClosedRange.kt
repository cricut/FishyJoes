package com.cricut.fishyjoes.runtime

import kotlin.ranges.ClosedRange

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
