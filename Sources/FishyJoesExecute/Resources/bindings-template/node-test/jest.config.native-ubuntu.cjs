/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */

const common = require("./jest.config.common.cjs")
module.exports = {
    ...common,
    moduleNameMapper: {
        ...common.moduleNameMapper,
        "^@cricut/fishyjoes-runtime$": "@cricut/fishyjoes-runtime-node-native-ubuntu",
        "^__MODULE_NAME__$": "@cricut/__LOWERCASE_MODULE_NAME__-native-ubuntu",
    }
}