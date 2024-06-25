package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestMethodsProtocol private constructor(_swiftReference: Long): TestMethodsProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    override fun foo(
    ): kotlin.Unit = __jni_foo()
    @JvmName("__jni_foo")
    private external fun __jni_foo(
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(bar) -->
     */
    override fun bar(
    ): Boolean = __jni_bar()
    @JvmName("__jni_bar")
    private external fun __jni_bar(
    ): Boolean

    /**
     * <!-- FishyJoes.export(baz) -->
     */
    override fun baz(
        qux: Boolean
    ): kotlin.Unit = __jni_baz(qux)
    @JvmName("__jni_baz")
    private external fun __jni_baz(
        qux: Boolean
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(garply) -->
     */
    override fun garply(
        _0: kotlin.String
    ): kotlin.String = __jni_garply(_0)
    @JvmName("__jni_garply")
    private external fun __jni_garply(
        _0: kotlin.String
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(xyzzy) -->
     */
    override fun xyzzy(
        thud: Long,
        grault: kotlin.collections.List<Double>
    ): kotlin.String = __jni_xyzzy(thud, grault)
    @JvmName("__jni_xyzzy")
    private external fun __jni_xyzzy(
        thud: Long,
        grault: kotlin.collections.List<Double>
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(plugh) -->
     */
    override fun plugh(
        fred: kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>
    ): kotlin.Triple<Boolean, Long, kotlin.String> = __jni_plugh(fred)
    @JvmName("__jni_plugh")
    private external fun __jni_plugh(
        fred: kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>
    ): kotlin.Triple<Boolean, Long, kotlin.String>

    companion object {
        init { loadNativeLibs() }
    }
}
