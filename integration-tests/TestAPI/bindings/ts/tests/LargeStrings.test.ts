import { expect, jest, test } from '@jest/globals';

// Browser and web worker bundles give the WASM runtime the npm "buffer" package instead of Node's Buffer.
jest.unstable_mockModule('buffer', () => jest.requireActual('buffer/'));
const { Buffer } = await import('buffer');
const { TestAPI } = await import('TestAPI');

test('BufferIsTheBrowserPolyfill', () => {
    expect(Buffer).not.toBe(globalThis.Buffer)
});

test('LargeStringEcho', () => {
    // 16 UTF-8 bytes per repeat, 160 MiB in total: more elements than V8 can grow one array to, so a copy that holds one byte per element fails.
    const large = (TestAPI.Strings.accent + TestAPI.Strings.emoji).repeat(10 * 1024 * 1024)
    const echoed = TestAPI.Strings.echo(large)
    expect(echoed.length).toBe(large.length)
    expect(echoed === large).toBe(true)
});
