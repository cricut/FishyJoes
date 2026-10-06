import * as TestAPIModule from 'TestAPI';
import { readFileSync } from 'fs';

// `tests/generated/TestAPI.d.ts` holds the last generated platform's declarations, and native ones
// have no `init()`, so the wasm loader is typed here and the suite is skipped where `init()` is absent.
interface WasmLoader {
    init?(options?: { module?: WebAssembly.Module; source?: BufferSource }): Promise<{
        TestAPI: typeof TestAPIModule.TestAPI;
        wasmModule: WebAssembly.Module;
    }>;
}

const init = (TestAPIModule as unknown as WasmLoader).init;
const wasmTest = init ? test : test.skip;

const wasmBytes = (): Buffer => readFileSync('../generated/packages/wasm/TestAPI.wasm');

wasmTest('init() exposes the module it compiled', async () => {
    const library = await init!();
    expect(library.wasmModule).toBeInstanceOf(WebAssembly.Module);
    expect(library.TestAPI.EmptyClass1).toBeDefined();
});

wasmTest('init({ module }) instantiates a pre-compiled module and exposes that module', async () => {
    const module = await WebAssembly.compile(wasmBytes());
    const library = await init!({ module });
    expect(library.wasmModule).toBe(module);
    expect(library.TestAPI.EmptyClass1).toBeDefined();
});

wasmTest('init({ module }) rejects anything but a WebAssembly.Module', async () => {
    const notAModule = wasmBytes() as unknown as WebAssembly.Module;
    await expect(init!({ module: notAModule })).rejects.toThrow(TypeError);
});

wasmTest('init({ source }) compiles caller-supplied bytes', async () => {
    const library = await init!({ source: wasmBytes() });
    expect(library.wasmModule).toBeInstanceOf(WebAssembly.Module);
    expect(library.TestAPI.EmptyClass1).toBeDefined();
});
