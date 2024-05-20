package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct, conformances: [TestDefaultComputedProperties]) -->
 */
data class TestDefaultComputedPropertiesStruct(
    var spam: Boolean,
    override var noot: Long
): TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    override val plutonic: kotlin.String
      get() = __jni_get_plutonic()
    @JvmName("__jni_get_plutonic")
    private external fun __jni_get_plutonic(): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
