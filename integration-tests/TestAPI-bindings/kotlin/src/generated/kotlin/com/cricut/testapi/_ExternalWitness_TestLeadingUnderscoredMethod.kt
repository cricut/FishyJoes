package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestLeadingUnderscoredMethod private constructor(_swiftReference: Long): TestLeadingUnderscoredMethod, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(_leadingUnderscoreMethod) -->
     */
    @JvmName("__jni__leadingUnderscoreMethod")
    private external fun __jni__leadingUnderscoreMethod(
    ): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
