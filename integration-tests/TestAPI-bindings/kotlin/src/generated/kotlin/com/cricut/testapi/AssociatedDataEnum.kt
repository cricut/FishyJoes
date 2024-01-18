package com.cricut.testapi

/**
 * <!-- FishyJoes.export(AssociatedDataEnum) -->
 */
sealed class AssociatedDataEnum {
    data class Thing(
        var value: Long
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
        init { loadNativeLibs() }
    }
}
