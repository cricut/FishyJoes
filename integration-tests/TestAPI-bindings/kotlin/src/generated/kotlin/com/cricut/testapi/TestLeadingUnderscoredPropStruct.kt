package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
 */
data class TestLeadingUnderscoredPropStruct(
    override var _leadingUnderscoreProp: kotlin.String
): TestLeadingUnderscoredProp {

    companion object {
        init { loadNativeLibs() }
    }
}
