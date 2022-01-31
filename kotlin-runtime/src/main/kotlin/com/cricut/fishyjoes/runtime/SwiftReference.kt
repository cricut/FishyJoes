package com.cricut.fishyjoes.runtime

abstract class SwiftReference protected constructor(protected val swiftReference: Long) {
    override fun hashCode(): Int = swiftHashCode()
    override fun toString(): String = swiftToString()
    protected fun finalize() = swiftFinalize()

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (other !is SwiftReference) return false
        return swiftEquals(other.swiftReference)
    }

    private external fun swiftHashCode(): Int
    private external fun swiftToString(): String
    private external fun swiftFinalize()
    private external fun swiftEquals(otherReference: Long): Boolean
}