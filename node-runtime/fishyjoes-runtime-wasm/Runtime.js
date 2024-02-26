import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const { Optional, Runtime } = require('./Runtime.cjs');

import { applyExtensions } from './Runtime.extensions.js';
applyExtensions(Runtime);

export { Optional, Runtime };
export default Runtime;
