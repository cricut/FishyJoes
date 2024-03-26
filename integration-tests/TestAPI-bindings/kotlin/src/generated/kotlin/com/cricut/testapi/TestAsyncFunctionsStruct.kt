package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctionsStruct, conformances: [TestAsyncFunctions]) -->
 */
data class TestAsyncFunctionsStruct(
    override val const42: (suspend () -> Long),
    override val iabs: (suspend (Long) -> Long),
    override val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long)),
    override val add3Things: (suspend (Float, Double, Long) -> Double),
    override val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>),
    override val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long)),
    override val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
): TestAsyncFunctions {

    companion object {
        init { loadNativeLibs() }
    }
}
