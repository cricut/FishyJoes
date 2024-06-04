package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
 */
class Structs_PuttingTypesIntoQuestionablePlaces private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(testCall) -->
     */
    fun testCall(
    ): Long = __jni_testCall()
    @JvmName("__jni_testCall")
    private external fun __jni_testCall(
    ): Long

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is Structs_PuttingTypesIntoQuestionablePlaces) {
            return false
        }
        return true
    }

    override fun hashCode(): kotlin.Int {
        return 42
    }

    override fun toString(): kotlin.String {
        return "Structs_PuttingTypesIntoQuestionablePlaces()"
    }

    companion object {
        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.Structs_PuttingTypesIntoQuestionablePlaces = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.Structs_PuttingTypesIntoQuestionablePlaces

        init { loadNativeLibs() }
    }
}
