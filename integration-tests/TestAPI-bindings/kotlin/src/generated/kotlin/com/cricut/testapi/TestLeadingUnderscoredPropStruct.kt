package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * // <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp, TestLeadingUnderscoredMethod]) -->
 * <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
 */
data class TestLeadingUnderscoredPropStruct(
    override var _leadingUnderscoreProp: kotlin.String
): com.cricut.testapi.TestLeadingUnderscoredProp {

    companion object {
        init { loadNativeLibs() }
    }
}
