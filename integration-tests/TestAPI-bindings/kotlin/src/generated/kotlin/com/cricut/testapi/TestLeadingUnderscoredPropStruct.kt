package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * // <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp, TestLeadingUnderscoredMethod]) -->
 * <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
 */
data class TestLeadingUnderscoredPropStruct(
    override var _leadingUnderscoreProp: kotlin.String
): TestAPI.TestLeadingUnderscoredProp {

    companion object {
        init { loadNativeLibs() }
    }
}
