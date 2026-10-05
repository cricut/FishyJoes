package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(TestDefaultComputedPropertiesReference) -->
 */
class TestDefaultComputedPropertiesReference private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    override var noot: Long
      get() = __jni_get_noot()
      set(value) { __jni_set_noot(value) }
    @JvmName("__jni_get_noot")
    private external fun __jni_get_noot(): Long
    @JvmName("__jni_set_noot")
    private external fun __jni_set_noot(newValue: Long)

    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    override val plutonic: kotlin.String
      get() = __jni_get_plutonic()
    @JvmName("__jni_get_plutonic")
    private external fun __jni_get_plutonic(): kotlin.String

    /**
     * <!-- FishyJoes.export(spam) -->
     */
    var spam: Boolean
      get() = __jni_get_spam()
      set(value) { __jni_set_spam(value) }
    @JvmName("__jni_get_spam")
    private external fun __jni_get_spam(): Boolean
    @JvmName("__jni_set_spam")
    private external fun __jni_set_spam(newValue: Boolean)

    companion object {
        /**
         * <!-- FishyJoes.export(init) -->
         */
        fun init(
            spam: Boolean,
            noot: Long
        ): com.cricut.testapi.TestDefaultComputedPropertiesReference = __jni_init(spam, noot)
        @JvmStatic
        @JvmName("__jni_init")
        private external fun __jni_init(
            spam: Boolean,
            noot: Long
        ): com.cricut.testapi.TestDefaultComputedPropertiesReference

        init { loadNativeLibs() }
    }
}
