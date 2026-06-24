// __AUTOGEN_WARNING__
// The browser entry of @cricut/__LOWERCASE_MODULE_NAME__-wasm (__MODULE_NAME__.browser.js) avoids
// top-level await for bundler compatibility, so its `__MODULE_NAME__` / `Runtime` exports start as
// `undefined`. Calling `init()` once populates the module's live ES bindings,
// which then propagate to every test file's `import { __MODULE_NAME__ } from '__MODULE_NAME__'`.
import { init } from '__MODULE_NAME__'
import { Buffer } from 'buffer'

// Tests that exercise Node-style `Buffer` (e.g. Bytes.test.ts) need the polyfill
// as a global, since the browser has no built-in `Buffer`.
globalThis.Buffer = Buffer

await init()
