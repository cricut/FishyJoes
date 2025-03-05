package com.cricut.testapi

import com.cricut.fishyjoes.runtime.TypedResult
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.lang.reflect.Type

internal class ResultsTests {
    @Test
    fun testResults() {
        assertEquals(Results.aSuccess.getOrNull(), 42)
        assertEquals(Results.aFailure.exceptionOrNull()?.message, "reboot needed")

        assertEquals(Results.processResult(TypedResult.Success("yay")), "YAY")
        val failResult = TypedResult.Failure<String, _>(Results.Error("reasons"))
        assertEquals(Results.processResult(failResult), "fail: reasons")
    }
}
