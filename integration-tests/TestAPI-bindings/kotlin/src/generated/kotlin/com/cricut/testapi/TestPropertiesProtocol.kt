package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestPropertiesProtocol) -->
 */
interface TestPropertiesProtocol {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    val corge: kotlin.String
    /**
     * <!-- FishyJoes.export(frob) -->
     */
    val frob: kotlin.collections.List<Double>

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
