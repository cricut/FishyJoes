import { TestAPI } from 'TestAPI';

test('Actors', async () => {
    const logger = TestAPI.Actors.TemperatureLogger.create("log", 3)
    await logger.update(7)
    await logger.update(1)
    await expect(logger.min()).resolves.toEqual(1)
    expect(logger.backwardsLabel).toEqual("gol")
});
