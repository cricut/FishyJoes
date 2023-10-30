import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const { Runtime } = require('./Runtime.cjs');

import { applyExtensions } from './Runtime.extensions.js';
applyExtensions(Runtime);

export { Runtime };
export default Runtime;
