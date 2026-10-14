package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->
 */
data class TestLeadingUnderscoredPropStruct(
    override var _leadingUnderscoreProp: kotlin.String
): com.cricut.testapi.TestLeadingUnderscoredProp {

    companion object {
        init { loadNativeLibs() }
    }
}
