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
    private external fun __jni_get_text(): kotlin.String
    private external fun __jni_set_text(newValue: kotlin.String)

    override fun toString(
    ): String = __jni_toString()
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
        private external fun __jni_create(
        ): com.cricut.testapi.ExportedByReference

        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
