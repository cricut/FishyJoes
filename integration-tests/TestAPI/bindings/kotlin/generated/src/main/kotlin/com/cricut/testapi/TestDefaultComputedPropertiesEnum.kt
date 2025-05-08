package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class TestDefaultComputedPropertiesEnum: com.cricut.testapi.TestDefaultComputedProperties {
    object Qux : TestDefaultComputedPropertiesEnum()
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    override val noot: Long
      get() = __jni_get_noot()
    @JvmName("__jni_get_noot")
    private external fun __jni_get_noot(): Long

    /**
     * <!-- FishyJoes.export(spam) -->
     */
    val spam: Boolean
      get() = __jni_get_spam()
    @JvmName("__jni_get_spam")
    private external fun __jni_get_spam(): Boolean

    companion object {
        init { loadNativeLibs() }
    }
}
