import(`${MODULE_PATH}/TestAPI.js`).then(({ TestAPI }) => {
    console.log(TestAPI);
    if (TestAPI.ExportedByReference.create().text !== "Hello, World!") {
        throw "test failed. Also, figure out how to do TS tests better";
    }
})
