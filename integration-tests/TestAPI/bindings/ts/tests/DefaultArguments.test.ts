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

test('explicitIntMaxDefault', () => {
    // Swift evaluates the omitted default, so the result is the platform's Int.max
    // (64-bit natively, 32-bit on wasm32)
    expect(["9223372036854775807", "2147483647"]).toContain(TestAPI.DefaultArguments.echoExplicitIntMax());
    expect(TestAPI.DefaultArguments.echoExplicitIntMax({ value: 7 })).toEqual("7");
});
