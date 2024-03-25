package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctions) -->
 */
interface TestAsyncFunctions {
    /**
     * <!-- FishyJoes.export(const42) -->
     */
    val const42: (suspend () -> Long)

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
