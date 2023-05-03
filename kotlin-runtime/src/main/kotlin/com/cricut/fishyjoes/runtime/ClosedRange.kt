package com.cricut.fishyjoes.runtime

import kotlin.ranges.ClosedRange

data class ClosedRange<T: Comparable<T>>(
    override var start: T,
    override var endInclusive: T
): ClosedRange<T> {
    constructor(range: kotlin.ranges.ClosedRange<T>): this(range.start, range.endInclusive)
}
