package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
 */
data class TestAsyncFunctionsStruct(
    val const42: (suspend () -> Long),
    val iabs: (suspend (Long) -> Long),
    val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long)),
    val add3Things: (suspend (Float, Double, Long) -> Double)
) {

    companion object {
        init { loadNativeLibs() }
    }
}
