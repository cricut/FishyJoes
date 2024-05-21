package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

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
