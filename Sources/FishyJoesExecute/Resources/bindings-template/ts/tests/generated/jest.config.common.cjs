/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  extensionsToTreatAsEsm: ['.ts', '.wasm'],
  rootDir: "../",
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  modulePaths: [
    "<rootDir>/node_modules",
  ],
  moduleNameMapper: {
    "^@wasmer/wasi$": "<rootDir>/node_modules/@wasmer/wasi",
    "^@wasmer/wasmfs$": "<rootDir>/node_modules/@wasmer/wasmfs",
  },
  transformIgnorePatterns: [
    "node_modules",
  ],
  verbose: true,
  detectOpenHandles: true,
  forceExit: true,
  watchman: false,
};
