package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(TestProtocolClass, protocols: [TestMethodsProtocol, TestPropertiesProtocol]) -->
 */
class TestProtocolClass private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    var corge: kotlin.String
      get() = __jni_get_corge()
      set(value) { __jni_set_corge(value) } 
    @JvmName("__jni_get_corge")
    private external fun __jni_get_corge(): kotlin.String
    @JvmName("__jni_set_corge")
    private external fun __jni_set_corge(newValue: kotlin.String)

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

    companion object {
        init { loadNativeLibs() }
    }
}
