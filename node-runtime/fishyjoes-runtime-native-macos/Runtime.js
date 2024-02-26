import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const { Optional, Runtime } = require('./Runtime.cjs');

const library = { Runtime };
import { applyExtensions } from './Runtime.extensions.js';
applyExtensions(library);

export { Optional, Runtime };
export default Runtime;
