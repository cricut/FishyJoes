package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
 */
interface TestLeadingUnderscoredProp {
    /**
     * <!-- FishyJoes.export(_leadingUnderscoreProp) -->
     */
    val _leadingUnderscoreProp: kotlin.String

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
