package com.cricut.testapi

import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(AssociatedDataEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class AssociatedDataEnum {
    data class Thing(
        var value: Long
    ) : AssociatedDataEnum()
    data class Other(
        var unnamed: kotlin.String,
        var _1: Long
    ) : AssociatedDataEnum()
    data class Bar(
        var named: kotlin.String,
        var _1: com.cricut.testapi.AssociatedDataEnum
    ) : AssociatedDataEnum()
    object NoValue : AssociatedDataEnum()
    data class SimpleEnum(
        var value: com.cricut.testapi.SimpleEnum
    ) : AssociatedDataEnum()
    /**
     * <!-- FishyJoes.export(intValue) -->
     */
    val intValue: Long
      get() = __jni_get_intValue()
    @JvmName("__jni_get_intValue")
    private external fun __jni_get_intValue(): Long

    /**
     * <!-- FishyJoes.export(plus) -->
     */
    fun plus(
        other: com.cricut.testapi.AssociatedDataEnum
    ): com.cricut.testapi.AssociatedDataEnum = __jni_plus(other)
    @JvmName("__jni_plus")
    private external fun __jni_plus(
        other: com.cricut.testapi.AssociatedDataEnum
    ): com.cricut.testapi.AssociatedDataEnum

    companion object {
        /**
         * <!-- FishyJoes.export(staticThing) -->
         */
        val staticThing: com.cricut.testapi.AssociatedDataEnum
          get() = __jni_get_staticThing()
        @JvmStatic
        @JvmName("__jni_get_staticThing")
        private external fun __jni_get_staticThing(): com.cricut.testapi.AssociatedDataEnum

        init { loadNativeLibs() }
    }
}
