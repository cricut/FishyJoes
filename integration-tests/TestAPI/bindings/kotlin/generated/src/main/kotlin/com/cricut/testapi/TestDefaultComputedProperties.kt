package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDefaultComputedProperties) -->
 */
interface TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    val noot: Long
    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    val plutonic: kotlin.String

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
