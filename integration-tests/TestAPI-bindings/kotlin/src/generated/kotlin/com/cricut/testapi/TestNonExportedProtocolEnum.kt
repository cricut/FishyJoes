package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestNonExportedProtocolEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class TestNonExportedProtocolEnum {
    object Hogehoge : TestNonExportedProtocolEnum()
    /**
     * <!-- FishyJoes.export(fuga) -->
     */
    val fuga: Double
      get() = __jni_get_fuga()
    @JvmName("__jni_get_fuga")
    private external fun __jni_get_fuga(): Double

    /**
     * <!-- FishyJoes.export(hoge) -->
     */
    fun hoge(
    ): Double = __jni_hoge()
    @JvmName("__jni_hoge")
    private external fun __jni_hoge(
    ): Double

    companion object {
        init { loadNativeLibs() }
    }
}
