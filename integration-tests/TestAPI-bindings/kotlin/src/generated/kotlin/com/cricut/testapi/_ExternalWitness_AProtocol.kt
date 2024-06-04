package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_AProtocol private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.AProtocol {
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    override val baz: Boolean
      get() = __jni_get_baz()
    @JvmName("__jni_get_baz")
    private external fun __jni_get_baz(): Boolean

    /**
     * <!-- FishyJoes.export(foo) -->
     */
    override val foo: kotlin.String
      get() = __jni_get_foo()
    @JvmName("__jni_get_foo")
    private external fun __jni_get_foo(): kotlin.String

    /**
     * <!-- FishyJoes.export(bar) -->
     */
    override fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol = __jni_bar(x, y)
    @JvmName("__jni_bar")
    private external fun __jni_bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is _ExternalWitness_AProtocol) {
            return false
        }
        return this.baz == other.baz &&
            this.foo == other.foo
    }

    override fun hashCode(): kotlin.Int {
        return (baz.hashCode()).xor(foo.hashCode())
    }

    override fun toString(): kotlin.String {
        return "_ExternalWitness_AProtocol(baz = ${baz}, foo = ${foo})"
    }

    companion object {
        init { loadNativeLibs() }
    }
}
