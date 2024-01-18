package com.cricut.testapi

/**
 * <!-- FishyJoes.export(SimpleEnum) -->
 */
sealed class SimpleEnum {
    object Red : SimpleEnum()
    /**
     * <!-- FishyJoes.export(testFuncCall) -->
     */
    fun testFuncCall(
        x: Long,
        y: Long
    ): Long = __jni_testFuncCall(x, y)
    @JvmName("__jni_testFuncCall")
    private external fun __jni_testFuncCall(
        x: Long,
        y: Long
    ): Long

    companion object {
        init { loadNativeLibs() }
    }
}
