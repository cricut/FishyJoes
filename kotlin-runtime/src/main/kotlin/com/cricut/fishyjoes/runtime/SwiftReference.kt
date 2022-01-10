package com.cricut.fishyjoes.runtime

abstract class SwiftReference protected constructor(private val swiftReference: Long) {
    override fun hashCode(): Int = swiftReference.hashCode()
    override fun toString(): String = swiftToString()
    protected fun finalize() = swiftFinalize()

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is SwiftReference) return false
        return swiftReference == other.swiftReference
    }

    private external fun swiftFinalize()
    private external fun swiftToString(): String
}