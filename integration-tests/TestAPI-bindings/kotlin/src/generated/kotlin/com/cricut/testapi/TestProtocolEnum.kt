package com.cricut.testapi

/**
 * <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestProtocol]) -->
 */
sealed class TestProtocolEnum {
    object Qux : TestProtocolEnum()
    /**
     * <!-- FishyJoes.export(xyzzy) -->
     */
    fun xyzzy(
        thud: Long,
        grault: kotlin.collections.List<Double>
    ): kotlin.Unit = __jni_xyzzy(thud, grault)
    @JvmName("__jni_xyzzy")
    private external fun __jni_xyzzy(
        thud: Long,
        grault: kotlin.collections.List<Double>
    ): kotlin.Unit

    companion object {
        init { loadNativeLibs() }
    }
}
