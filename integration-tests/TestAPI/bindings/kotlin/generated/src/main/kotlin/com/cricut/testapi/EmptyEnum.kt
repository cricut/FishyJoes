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
         * <!-- FishyJoes.export(aStaticProperty) -->
         */
        val aStaticProperty: Long
          get() = __jni_get_aStaticProperty()
        @JvmStatic
        @JvmName("__jni_get_aStaticProperty")
        private external fun __jni_get_aStaticProperty(): Long

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
         * <!-- FishyJoes.export(aStaticMethod) -->
         */
        fun aStaticMethod(
        ): Long = __jni_aStaticMethod()
        @JvmStatic
        @JvmName("__jni_aStaticMethod")
        private external fun __jni_aStaticMethod(
        ): Long

        init { loadNativeLibs() }
    }
}
