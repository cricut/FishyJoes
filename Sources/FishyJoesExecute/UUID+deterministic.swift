import Foundation

extension UUID {
    /// Pretends to be a version 5 uuid (sha1), but using a less secure hash to avoid dependencies
    public init(deterministicFrom key: String) {
        // Swift version of https://github.com/tidwall/th64
        func tinyHash64(_ data: Data, seed: UInt64 = 0) -> UInt64 {
            data.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) -> UInt64 in
                let r: UInt64 = 0x14020a57acced8b7
                var h: UInt64 = seed
                for offset in stride(from: 0, through: buffer.count - 8, by: 8) {
                    let x = buffer.loadUnaligned(fromByteOffset: offset, as: UInt64.self) &* r
                    h = h &* r ^ (x << 31 | x >> 33)
                    h = h << 31 | h >> 33
                }
                for byte in buffer[(buffer.count - buffer.count % 8)..<buffer.count] {
                    h = h &* r ^ UInt64(byte)
                }
                h = h &* r &+ UInt64(buffer.count)
                h = (h ^ (h >> 31)) &* r
                h = (h ^ (h >> 31)) &* r
                h = (h ^ (h >> 31)) &* r
                return h
            }
        }
        let utf8 = Data(key.utf8)
        var bytes = unsafeBitCast((tinyHash64(utf8, seed: 0), tinyHash64(utf8, seed: 1)), to: uuid_t.self)
        // set version nibble to 0x5
        bytes.6 = bytes.6 & 0x0f | 0x50
        // set variant bits to 0b10
        bytes.8 = bytes.8 & 0x3f | 0x80
        self.init(uuid: bytes)
    }
}
