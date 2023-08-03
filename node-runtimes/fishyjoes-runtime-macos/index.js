import { createRequire } from 'module';
const require = createRequire(import.meta.url);
export const { Runtime } = require('./Runtime.cjs');
export default Runtime;
