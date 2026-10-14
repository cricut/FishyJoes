package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
 */
interface TestDifferingExportNameProtocolDiffy {
    /**
     * <!-- FishyJoes.export(tata) -->
     */
    val tata: Long

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
