package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
 */
data class TestAsyncFunctionsStruct(
    var const42: (suspend () -> Long)
) {

    companion object {
        init { loadNativeLibs() }
    }
}
