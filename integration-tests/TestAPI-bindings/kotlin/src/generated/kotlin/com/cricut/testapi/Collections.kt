package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.exportReference(Collections) -->
 */
class Collections private constructor(
    private val _swiftReference: Long
)
 {
    override fun toString(
    ): String = __jni_toString()
    @JvmName("__jni_toString")
    private external fun __jni_toString(
    ): String

    protected fun finalize() = __jni_finalize()
    private external fun __jni_finalize()

    companion object {
        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        val arrayOfInt: kotlin.collections.List<Long>
          get() = __jni_get_arrayOfInt()
        @JvmStatic
        @JvmName("__jni_get_arrayOfInt")
        private external fun __jni_get_arrayOfInt(): kotlin.collections.List<Long>

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        val setOfInt: kotlin.collections.Set<Long>
          get() = __jni_get_setOfInt()
        @JvmStatic
        @JvmName("__jni_get_setOfInt")
        private external fun __jni_get_setOfInt(): kotlin.collections.Set<Long>

        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        val dictionaryOfIntToInt: kotlin.collections.Map<Long, Long>
          get() = __jni_get_dictionaryOfIntToInt()
        @JvmStatic
        @JvmName("__jni_get_dictionaryOfIntToInt")
        private external fun __jni_get_dictionaryOfIntToInt(): kotlin.collections.Map<Long, Long>

        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
