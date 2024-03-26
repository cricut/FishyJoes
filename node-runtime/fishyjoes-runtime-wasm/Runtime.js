import { createRequire } from 'module';
const require = createRequire(import.meta.url);
// Does this even ever get run? I don't think there's a "Runtime.cjs" for wasm...
const { Runtime } = require('./Runtime.cjs');

import { applyExtensions } from './Runtime.extensions.js';
applyExtensions(Runtime, {});

export { Runtime };
export default Runtime;
