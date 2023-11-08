package com.cricut.testapi

import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
 */
data class String_PuttingTypesIntoQuestionablePlaces(
    val x: kotlin.String
)
 {
    /**
     * <!-- FishyJoes.export(testCall) -->
     */
    fun testCall(
    ): Long = __jni_testCall()
    @JvmName("__jni_testCall")
    private external fun __jni_testCall(
    ): Long

    companion object {
        init { loadNativeLibs() }
    }
}
