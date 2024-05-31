package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDifferingExportNameStruct, conformances: [TestDifferingExportNameProtocolDiffy]) -->
 */
data class TestDifferingExportNameStruct(
    override var tata: Long
): com.cricut.testapi.TestDifferingExportNameProtocolDiffy {

    companion object {
        init { loadNativeLibs() }
    }
}
