import { createRequire } from 'module';
const require = createRequire(import.meta.url);
export const { FishyJoesRuntime } = require('./FishyJoesRuntime.cjs');
export default FishyJoesRuntime;
