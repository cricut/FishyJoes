package com.cricut.testapi

/**
 * <!-- FishyJoes.export(TestProtocolEnum) -->
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
        /**
         * <!-- FishyJoes.export(waldo) -->
         */
        var waldo: kotlin.String
          get() = __jni_get_waldo()
          set(value) { __jni_set_waldo(value) } 
        @JvmStatic
        @JvmName("__jni_get_waldo")
        private external fun __jni_get_waldo(): kotlin.String
        @JvmStatic
        @JvmName("__jni_set_waldo")
        private external fun __jni_set_waldo(newValue: kotlin.String)

        init { loadNativeLibs() }
    }
}
