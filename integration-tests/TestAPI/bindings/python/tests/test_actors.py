import importlib
import sys
import unittest
from pathlib import Path


GENERATED_SRC = Path(__file__).resolve().parents[1] / "generated" / "src"
sys.path.insert(0, str(GENERATED_SRC))


class ActorTests(unittest.IsolatedAsyncioTestCase):
    def setUp(self) -> None:
        self.testapi = importlib.import_module("testapi")

    async def test_temperature_logger_actor(self) -> None:
        logger = self.testapi.Actors_TemperatureLogger.create(label="log", measurement=3)

        await logger.update(7)
        await logger.update(1)

        self.assertEqual(await logger.min(), 1)
        self.assertEqual(logger.backwards_label, "gol")
        self.assertEqual(logger.label, "log")
        self.assertEqual(await logger.extension_isolated_get_label(), "log")
        self.assertEqual(logger.extension_nonisolated_get_label(), "log")
        self.assertEqual(logger.extension_nonisolated_var_label, "log")


if __name__ == "__main__":
    unittest.main()
