package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestDefaultComputedProperties private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    override val noot: Long
      get() = __jni_get_noot()
    @JvmName("__jni_get_noot")
    private external fun __jni_get_noot(): Long

    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    override val plutonic: kotlin.String
      get() = __jni_get_plutonic()
    @JvmName("__jni_get_plutonic")
    private external fun __jni_get_plutonic(): kotlin.String

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is _ExternalWitness_TestDefaultComputedProperties) {
            return false
        }
        return this.noot == other.noot &&
            this.plutonic == other.plutonic
    }

    override fun hashCode(): kotlin.Int {
        return (noot.hashCode()).xor(plutonic.hashCode())
    }

    override fun toString(): kotlin.String {
        return "_ExternalWitness_TestDefaultComputedProperties(noot = ${noot}, plutonic = ${plutonic})"
    }

    companion object {
        init { loadNativeLibs() }
    }
}
