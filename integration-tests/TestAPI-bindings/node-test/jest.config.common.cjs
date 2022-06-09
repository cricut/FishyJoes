/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  extensionsToTreatAsEsm: ['.ts', '.wasm'],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  moduleNameMapper: {
    // "^TestAPI$": "@cricut/testapi-wasm",
    // "^TestAPI$": "@cricut/testapi-native-macos",
    "^@wasmer/wasi$": "<rootDir>/node_modules/@wasmer/wasi",
    "^@wasmer/wasmfs$": "<rootDir>/node_modules/@wasmer/wasmfs",
  },
  transformIgnorePatterns: [
    "node_modules",
  ],
  verbose: true,
};
