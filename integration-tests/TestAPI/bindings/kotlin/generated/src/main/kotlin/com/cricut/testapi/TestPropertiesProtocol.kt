package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestPropertiesProtocol) -->
 */
interface TestPropertiesProtocol {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    val corge: kotlin.String
    /**
     * <!-- FishyJoes.export(frobby) -->
     */
    val frobby: kotlin.collections.List<Long>

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
