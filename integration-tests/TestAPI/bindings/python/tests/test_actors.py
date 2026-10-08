import unittest

import testapi.actors


class ActorTests(unittest.IsolatedAsyncioTestCase):
    async def test_temperature_logger_actor(self) -> None:
        logger = testapi.actors.TemperatureLogger.create(label="log", measurement=3)

        await logger.update(7)
        await logger.update(1)

        self.assertEqual(await logger.min_(), 1)
        self.assertEqual(logger.backwards_label, "gol")
        self.assertEqual(logger.label, "log")
        self.assertEqual(await logger.extension_isolated_get_label(), "log")
        self.assertEqual(logger.extension_nonisolated_get_label(), "log")
        self.assertEqual(logger.extension_nonisolated_var_label, "log")


if __name__ == "__main__":
    unittest.main()
