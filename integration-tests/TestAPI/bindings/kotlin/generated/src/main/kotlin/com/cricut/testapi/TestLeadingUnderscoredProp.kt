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

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
