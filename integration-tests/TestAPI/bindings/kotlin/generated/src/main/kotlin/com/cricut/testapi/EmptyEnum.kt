package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(EmptyEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class EmptyEnum {

    companion object {
        /**
         * <!-- FishyJoes.export(noot) -->
         */
        val noot: Long
          get() = __jni_get_noot()
        @JvmStatic
        @JvmName("__jni_get_noot")
        private external fun __jni_get_noot(): Long

        /**
         * <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
         */
        fun notGoingToHappen(
        ): com.cricut.testapi.EmptyEnum = __jni_notGoingToHappen()
        @JvmStatic
        @JvmName("__jni_notGoingToHappen")
        private external fun __jni_notGoingToHappen(
        ): com.cricut.testapi.EmptyEnum

        /**
         * <!-- FishyJoes.export(mies) -->
         */
        fun mies(
        ): Long = __jni_mies()
        @JvmStatic
        @JvmName("__jni_mies")
        private external fun __jni_mies(
        ): Long

        init { loadNativeLibs() }
    }
}
