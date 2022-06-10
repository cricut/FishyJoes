import { TestAPI } from 'TestAPI';

test('BytesValues', () => {
    expect(TestAPI.Bytes.bytes).toEqual([0xDE, 0xAD, 0xBE, 0xEF])
    var buffer = new ArrayBuffer(4)
    var int8View = new Int8Array(buffer)
    int8View[0] = 0x0B
    int8View[1] = 0xAD
    int8View[2] = 0xF0
    int8View[3] = 0x0D
    expect(TestAPI.Bytes.data).toEqual(buffer)
});

test('BytesEcho', () => {
    expect(TestAPI.Bytes.echoBytes(TestAPI.Bytes.bytes)).toEqual(TestAPI.Bytes.bytes)
    expect(TestAPI.Bytes.echoData(TestAPI.Bytes.data)).toEqual(TestAPI.Bytes.data)
});
