import { init, protoLibrary } from 'TestAPI';

test('Init', async () => {
    const library = await init();
    expect(library.TestAPI.EmptyClass1.create().blarg).toEqual("Blarg!");
});

test('ProtoLibrary', async () => {
    const compiled = await protoLibrary();
    const first = await init(compiled);
    const second = await init(compiled);
    expect(first.TestAPI.EmptyClass1.create().blarg).toEqual("Blarg!");
    expect(second.TestAPI.EmptyClass1.create().blarg).toEqual("Blarg!");
});

test('ProtoLibraryStructuredClone', async () => {
    const compiled = await protoLibrary();
    const library = await init(structuredClone(compiled));
    expect(library.TestAPI.EmptyClass1.create().blarg).toEqual("Blarg!");
});
