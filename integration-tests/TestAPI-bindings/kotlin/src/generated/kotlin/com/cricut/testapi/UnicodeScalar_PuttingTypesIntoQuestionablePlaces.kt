package com.cricut.testapi

/**
 * <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
 */
sealed class UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    object Thing : UnicodeScalar_PuttingTypesIntoQuestionablePlaces()
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
