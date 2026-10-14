package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(ShadowBox) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class ShadowBox {
    data class Shade(
        var _0: com.cricut.testapi.Shade
    ) : ShadowBox()
    object Empty : ShadowBox()
    /**
     * <!-- FishyJoes.export(allShades) -->
     */
    val allShades: kotlin.collections.List<com.cricut.testapi.Shade>
      get() = __jni_get_allShades()
    @JvmName("__jni_get_allShades")
    private external fun __jni_get_allShades(): kotlin.collections.List<com.cricut.testapi.Shade>

    companion object {
        /**
         * <!-- FishyJoes.export(darkest) -->
         */
        fun darkest(
            /* of */ shades: kotlin.collections.List<com.cricut.testapi.Shade>
        ): com.cricut.testapi.Shade? = __jni_darkest(shades)
        @JvmStatic
        @JvmName("__jni_darkest")
        private external fun __jni_darkest(
            shades: kotlin.collections.List<com.cricut.testapi.Shade>
        ): com.cricut.testapi.Shade?

        init { loadNativeLibs() }
    }
}
