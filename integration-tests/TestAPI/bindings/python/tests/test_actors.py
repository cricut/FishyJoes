"""Actor integration tests."""

import asyncio
import sys
import os
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "generated", "src"))

from cricut_testapi import ensure_loaded
from cricut_testapi.TemperatureLogger import TemperatureLogger


class TestActors(unittest.TestCase):
    def setUp(self) -> None:
        ensure_loaded()

    @unittest.skip("Async/await not supported: FishyJoesCommonRuntime_runScheduledWork missing")
    def test_actor(self) -> None:
        async def run() -> None:
            logger = TemperatureLogger.create("log", 3)
            await logger.update(7)
            await logger.update(1)
            self.assertEqual(await logger.min(), 1)
            self.assertEqual(logger.backwardsLabel, "gol")

        asyncio.run(run())


if __name__ == "__main__":
    unittest.main()
