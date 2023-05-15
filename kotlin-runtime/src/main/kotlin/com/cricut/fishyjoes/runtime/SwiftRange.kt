package com.cricut.fishyjoes.runtime

// TODO: Conform to OpenEndRange<T> when it becomes available
data class SwiftRange<T: Comparable<T>>(
    var lowerBound: T,
    var upperBound: T
)/*: OpenEndRange<T>*/ {
    /*override*/ val start: T
        get() = lowerBound

    /*override*/ val endExclusive: T
        get() = upperBound

    constructor(range: kotlin.ranges.ClosedRange<T>): this(range.start, range.endInclusive) {
        require(lowerBound <= upperBound) { "Swift ranges require lowerBound <= upperBound" }
    }
}
