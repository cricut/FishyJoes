package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctionsStruct, conformances: [TestAsyncFunctions]) -->
 */
data class TestAsyncFunctionsStruct(
    override val const42: (suspend () -> Long),
    val iabs: (suspend (Long) -> Long),
    val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long)),
    val add3Things: (suspend (Float, Double, Long) -> Double),
    val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>),
    val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long)),
    val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
): TestAsyncFunctions {

    companion object {
        init { loadNativeLibs() }
    }
}
