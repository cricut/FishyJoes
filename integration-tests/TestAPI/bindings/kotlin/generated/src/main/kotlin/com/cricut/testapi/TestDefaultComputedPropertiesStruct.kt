package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
 */
data class TestDefaultComputedPropertiesStruct(
    var spam: Boolean,
    override var noot: Long
): com.cricut.testapi.TestDefaultComputedProperties {

    companion object {
        init { loadNativeLibs() }
    }
}
