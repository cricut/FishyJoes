package com.cricut.testapi

/**
 * <!-- FishyJoes.export(TestProtocolStruct, protocols: [TestMethodsProtocol, TestPropertiesProtocol, TestStaticProtocol]) -->
 */
data class TestProtocolStruct(
    var corge: kotlin.String
)
 {
    /**
     * <!-- FishyJoes.export(frob) -->
     */
    val frob: kotlin.collections.List<Double>
      get() = __jni_get_frob()
    @JvmName("__jni_get_frob")
    private external fun __jni_get_frob(): kotlin.collections.List<Double>

    /**
     * <!-- FishyJoes.export(foo) -->
     */
    fun foo(
    ): kotlin.Unit = __jni_foo()
    @JvmName("__jni_foo")
    private external fun __jni_foo(
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
    ): Boolean = __jni_bar()
    @JvmName("__jni_bar")
    private external fun __jni_bar(
    ): Boolean

    /**
     * <!-- FishyJoes.export(baz) -->
     */
    fun baz(
        qux: Boolean
    ): kotlin.Unit = __jni_baz(qux)
    @JvmName("__jni_baz")
    private external fun __jni_baz(
        qux: Boolean
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(garply) -->
     */
    fun garply(
        str: kotlin.String
    ): kotlin.String = __jni_garply(str)
    @JvmName("__jni_garply")
    private external fun __jni_garply(
        str: kotlin.String
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(xyzzy) -->
     */
    fun xyzzy(
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
    fun plugh(
        fred: kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>
    ): kotlin.Triple<Boolean, Long, kotlin.String> = __jni_plugh(fred)
    @JvmName("__jni_plugh")
    private external fun __jni_plugh(
        fred: kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>
    ): kotlin.Triple<Boolean, Long, kotlin.String>

    companion object {
        /**
         * <!-- FishyJoes.export(blarg) -->
         */
        val blarg: kotlin.String
          get() = __jni_get_blarg()
        @JvmStatic
        @JvmName("__jni_get_blarg")
        private external fun __jni_get_blarg(): kotlin.String

        /**
         * <!-- FishyJoes.export(wibble) -->
         */
        fun wibble(
        ): kotlin.String = __jni_wibble()
        @JvmStatic
        @JvmName("__jni_wibble")
        private external fun __jni_wibble(
        ): kotlin.String

        init { loadNativeLibs() }
    }
}
