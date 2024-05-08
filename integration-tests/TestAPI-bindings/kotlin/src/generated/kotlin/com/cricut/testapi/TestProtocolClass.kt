package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(TestProtocolClass, conformances: [TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol]) -->
 */
class TestProtocolClass private constructor(_swiftReference: Long): TestMethodsProtocol, TestOptionalsProtocol, TestPropertiesProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    override var corge: kotlin.String
      get() = __jni_get_corge()
      set(value) { __jni_set_corge(value) } 
    @JvmName("__jni_get_corge")
    private external fun __jni_get_corge(): kotlin.String
    @JvmName("__jni_set_corge")
    private external fun __jni_set_corge(newValue: kotlin.String)

    /**
     * <!-- FishyJoes.export(flarp) -->
     */
    override var flarp: kotlin.String?
      get() = __jni_get_flarp()
      set(value) { __jni_set_flarp(value) } 
    @JvmName("__jni_get_flarp")
    private external fun __jni_get_flarp(): kotlin.String?
    @JvmName("__jni_set_flarp")
    private external fun __jni_set_flarp(newValue: kotlin.String?)

    /**
     * <!-- FishyJoes.export(frobby) -->
     */
    override val frobby: kotlin.collections.List<Double>
      get() = __jni_get_frobby()
    @JvmName("__jni_get_frobby")
    private external fun __jni_get_frobby(): kotlin.collections.List<Double>

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
        str: kotlin.String
    ): kotlin.String = __jni_garply(str)
    @JvmName("__jni_garply")
    private external fun __jni_garply(
        str: kotlin.String
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

    /**
     * <!-- FishyJoes.export(wombat) -->
     */
    override fun wombat(
        zxc: Long?
    ): Double? = __jni_wombat(zxc)
    @JvmName("__jni_wombat")
    private external fun __jni_wombat(
        zxc: Long?
    ): Double?

    /**
     * <!-- FishyJoes.export(spqr) -->
     */
    override fun spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long = __jni_spqr(pippo)
    @JvmName("__jni_spqr")
    private external fun __jni_spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long

    companion object {
        /**
         * <!-- FishyJoes.export(init) -->
         */
        fun init(
            corge: kotlin.String,
            flarp: kotlin.String? = null
        ): com.cricut.testapi.TestProtocolClass = __jni_init(corge, flarp)
        @JvmStatic
        @JvmName("__jni_init")
        private external fun __jni_init(
            corge: kotlin.String,
            flarp: kotlin.String?
        ): com.cricut.testapi.TestProtocolClass

        init { loadNativeLibs() }
    }
}
