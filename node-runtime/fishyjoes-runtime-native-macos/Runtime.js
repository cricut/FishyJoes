import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const { Runtime } = require('./Runtime.cjs');

const library = { Runtime };
import { applyExtensions } from './Runtime.extensions.js';
applyExtensions(library, {});

export { Runtime };
export default Runtime;
