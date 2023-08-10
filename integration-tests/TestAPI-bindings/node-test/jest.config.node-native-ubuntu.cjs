/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */

const common = require("./jest.config.common.cjs")
module.exports = {
    ...common,
    moduleNameMapper: {
        ...common.moduleNameMapper,
        "^TestAPI$": "@cricut/testapi-node-native-ubuntu",
        "^@cricut/fishyjoes-runtime$": "@cricut/fishyjoes-runtime-node-native-ubuntu",
    }
}