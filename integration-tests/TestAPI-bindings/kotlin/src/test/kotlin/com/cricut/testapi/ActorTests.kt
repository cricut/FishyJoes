package com.cricut.testapi

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Test

class ActorTests {
    @Test
    fun testLogger() = runTest {
        val logger = Actors.TemperatureLogger.create(label = "log", measurement = 3L)
        logger.update(7L)
        logger.update(1L)
        assertEquals(1L, logger.min())
        assertEquals("gol", logger.backwardsLabel)
    }
}
