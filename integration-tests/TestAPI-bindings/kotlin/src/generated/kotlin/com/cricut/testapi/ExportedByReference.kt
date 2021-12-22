package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.exportReference(ExportedByReference) -->
 */
class ExportedByReference private constructor(
    private val _swiftReference: Long
)
 {
    /**
     * <!-- FishyJoes.export(text) -->
     */
    var text: kotlin.String
      get() = __jni_get_text()
      set(value) { __jni_set_text(value) } 
    @JvmName("__jni_get_text")
    private external fun __jni_get_text(): kotlin.String
    @JvmName("__jni_set_text")
    private external fun __jni_set_text(newValue: kotlin.String)

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.testapi.ExportedByReference) && __jni__swiftEquals(this, other)

    override fun toString(
    ): String = __jni_toString()
    @JvmName("__jni_toString")
    private external fun __jni_toString(
    ): String

    protected fun finalize() = __jni_finalize()
    private external fun __jni_finalize()

    companion object {
        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.ExportedByReference = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.ExportedByReference

        @JvmStatic
        @JvmName("__jni__swiftEquals")
        private external fun __jni__swiftEquals(
            lhs: com.cricut.testapi.ExportedByReference,
            rhs: com.cricut.testapi.ExportedByReference
        ): Boolean

        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
