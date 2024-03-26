package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
 */
data class TestAsyncFunctionsStruct(
    val const42: (suspend () -> Long),
    val iabs: (suspend (Long) -> Long)
) {

    companion object {
        init { loadNativeLibs() }
    }
}
