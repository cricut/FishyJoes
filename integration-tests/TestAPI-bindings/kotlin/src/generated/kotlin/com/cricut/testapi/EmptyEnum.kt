package com.cricut.testapi

import kotlinx.coroutines.*
import kotlinx.coroutines.future.future
import java.lang.Exception

/**
 * <!-- FishyJoes.export(EmptyEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class EmptyEnum {

    companion object {
        /**
         * <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
         */
        fun notGoingToHappen(
        ): com.cricut.testapi.EmptyEnum = __jni_notGoingToHappen()
        @JvmStatic
        @JvmName("__jni_notGoingToHappen")
        private external fun __jni_notGoingToHappen(
        ): com.cricut.testapi.EmptyEnum

        init { loadNativeLibs() }
    }
}
