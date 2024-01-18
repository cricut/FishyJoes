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

    companion object {
        init { loadNativeLibs() }
    }
}
