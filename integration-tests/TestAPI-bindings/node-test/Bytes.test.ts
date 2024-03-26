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
