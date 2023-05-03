package com.cricut.fishyjoes.runtime

// TODO: Conform to OpenEndRange<T> when it becomes available
data class OpenRange<T: Comparable<T>>(
    var start: T,
    var endExclusive: T
)