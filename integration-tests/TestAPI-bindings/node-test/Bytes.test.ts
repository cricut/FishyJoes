import { TestAPI } from 'TestAPI';

function arrayFrom(buffer: ArrayBuffer): number[] {
    return Array.from(new Uint8Array(buffer));
}

test('BytesValues', () => {
    expect(TestAPI.Bytes.bytes).toEqual([0xDE, 0xAD, 0xBE, 0xEF])
    expect(arrayFrom(TestAPI.Bytes.data)).toEqual([0x0B, 0xAD, 0xF0, 0x0D]);
});

test('BytesEcho', () => {
    const byteArray = Uint8Array.from([0xFE, 0xED, 0xFA, 0xCE]);
    expect(TestAPI.Bytes.echoBytes([...byteArray])).toEqual([...byteArray]);
    expect(arrayFrom(TestAPI.Bytes.echoData(byteArray.buffer)))
        .toEqual(arrayFrom(byteArray.buffer));
});

// typescript thinks node Buffers are ArrayBuffers for some reason, so test that that works anyway
test('ConsumeNodeBuffer', () => {

    const buffer = Buffer.alloc(8, 'na-');
    expect(arrayFrom(TestAPI.Bytes.echoData(buffer)))
        .toEqual([110, 97, 45, 110, 97, 45, 110, 97]);
});

// typescript also thinks Uint8Arrays are ArrayBuffers
test('ConsumeUint8Array', () => {
    const array = Uint8Array.from([1, 2, 3, 6, 11, 23, 47, 106, 235]);
    expect(arrayFrom(TestAPI.Bytes.echoData(array)))
        .toEqual([1, 2, 3, 6, 11, 23, 47, 106, 235]);
});
