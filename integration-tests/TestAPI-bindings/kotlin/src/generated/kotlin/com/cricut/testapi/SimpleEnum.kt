package com.cricut.testapi

/**
 * <!-- FishyJoes.export(SimpleEnum) -->
 */
sealed class SimpleEnum {
    object Red : SimpleEnum()
    object Green : SimpleEnum()
    object Blue : SimpleEnum()
    /**
     * <!-- FishyJoes.export(hex) -->
     */
    val hex: Long
      get() = __jni_get_hex()
    @JvmName("__jni_get_hex")
    private external fun __jni_get_hex(): Long

    companion object {
        /**
         * <!-- FishyJoes.export(pickAColor) -->
         */
        fun pickAColor(
            rawValue: Long
        ): com.cricut.testapi.SimpleEnum? = __jni_pickAColor(rawValue)
        @JvmStatic
        @JvmName("__jni_pickAColor")
        private external fun __jni_pickAColor(
            rawValue: Long
        ): com.cricut.testapi.SimpleEnum?

        init { loadNativeLibs() }
    }
}
