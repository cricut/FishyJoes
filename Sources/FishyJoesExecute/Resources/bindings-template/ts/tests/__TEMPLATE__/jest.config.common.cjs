// __AUTOGEN_WARNING__

/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  extensionsToTreatAsEsm: ['.ts', '.wasm'],
  rootDir: "../",
  setupFilesAfterEnv: [
    "<rootDir>/generated/fishyjoes.cleanup.ts",
  ],
  globals: {
    'ts-jest': {
      useESM: true,
    },
  },
  modulePaths: [
    "<rootDir>/node_modules",
  ],
  transformIgnorePatterns: [
    "node_modules",
  ],
  verbose: true,
  detectOpenHandles: true,
  forceExit: true,
  watchman: false,
};
