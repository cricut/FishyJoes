/**
 * <!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->
 */
data class AttributedString_PuttingTypesIntoQuestionablePlaces(
    val x: kotlin.String
) {
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

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
