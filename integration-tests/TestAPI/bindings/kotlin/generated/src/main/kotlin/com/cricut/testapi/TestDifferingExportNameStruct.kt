/**
 * <!-- FishyJoes.export(TestDifferingExportNameStruct) -->
 */
data class TestDifferingExportNameStruct(
    override var tata: Long
): com.cricut.testapi.TestDifferingExportNameProtocolDiffy {

    companion object {
        init { loadNativeLibs() }
    }
}

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
