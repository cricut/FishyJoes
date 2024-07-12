/**
 * <!-- FishyJoes.export(TestDefaultComputedProperties) -->
 */
interface TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    val noot: Long
        get() = __jni__default_noot(this)
    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    val plutonic: kotlin.String
        get() = __jni__default_plutonic(this)

    companion object {
        @JvmName("__jni__default_noot")
        private external fun __jni__default_noot(
            self: TestDefaultComputedProperties
        ): Long

        @JvmName("__jni__default_plutonic")
        private external fun __jni__default_plutonic(
            self: TestDefaultComputedProperties
        ): kotlin.String

        init {
            loadNativeLibs()
        }
    }
}

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
