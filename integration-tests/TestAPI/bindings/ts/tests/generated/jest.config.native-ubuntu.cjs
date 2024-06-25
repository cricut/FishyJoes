/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */

const common = require("./jest.config.common.cjs")
module.exports = {
    ...common,
    moduleNameMapper: {
        ...common.moduleNameMapper,
        "^@cricut/fishyjoes-runtime$": "@cricut/fishyjoes-runtime-native-ubuntu",
        "^TestAPI$": "@cricut/testapi-native-ubuntu",
    }
}