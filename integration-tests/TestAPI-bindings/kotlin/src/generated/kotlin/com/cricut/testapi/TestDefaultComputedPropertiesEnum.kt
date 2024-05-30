package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum, conformances: [TestDefaultComputedProperties]) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class TestDefaultComputedPropertiesEnum: TestDefaultComputedProperties {
    object Qux : TestDefaultComputedPropertiesEnum()
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    override val noot: Long
      get() = __jni_get_noot()
    @JvmName("__jni_get_noot")
    private external fun __jni_get_noot(): Long

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
    val spam: Boolean
      get() = __jni_get_spam()
    @JvmName("__jni_get_spam")
    private external fun __jni_get_spam(): Boolean

    companion object {
        init { loadNativeLibs() }
    }
}
