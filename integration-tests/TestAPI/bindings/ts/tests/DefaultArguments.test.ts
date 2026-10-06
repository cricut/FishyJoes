import { TestAPI } from 'TestAPI';

test('defaultArguments', () => {
    expect(TestAPI.DefaultArguments.echoDefaults(undefined)).toEqual("42 52 3.14");
    expect(TestAPI.DefaultArguments.echoDefaults(undefined, undefined)).toEqual("42 52 3.14");
    expect(TestAPI.DefaultArguments.echoDefaults(undefined, {})).toEqual("42 52 3.14");
    expect(TestAPI.DefaultArguments.echoDefaults(1)).toEqual("1 52 3.14");
    expect(TestAPI.DefaultArguments.echoDefaults(1, { theLabelForZ: 42 })).toEqual("1 52 42.0");
    expect(TestAPI.DefaultArguments.echoDefaults(undefined, { y: 8 })).toEqual("42 8 3.14");
    expect(TestAPI.DefaultArguments.echoDefaults(1, { theLabelForZ: 4.8, y: 2 })).toEqual("1 2 4.8");
});

test('defaultArgumentsAsync', async () => {
    await expect(TestAPI.DefaultArguments.echoDefaultsAsync(undefined)).resolves.toEqual("42 52 3.14");
    await expect(TestAPI.DefaultArguments.echoDefaultsAsync(1)).resolves.toEqual("1 52 3.14");
    await expect(TestAPI.DefaultArguments.echoDefaultsAsync(1, { theLabelForZ: 42 })).resolves.toEqual("1 52 42.0");
    await expect(TestAPI.DefaultArguments.echoDefaultsAsync(undefined, { y: 8 })).resolves.toEqual("42 8 3.14");
    await expect(TestAPI.DefaultArguments.echoDefaultsAsync(1, { theLabelForZ: 4.8, y: 2 })).resolves.toEqual("1 2 4.8");
});
