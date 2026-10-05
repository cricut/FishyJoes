import FishyJoesIotaRuntime
import XCTest

final class StringConversionTests: XCTestCase {
    private static var receivedBytes: [UInt8] = []
    private static var receivedCount = -1

    func testToIotaPassesExactUtf8BytesWithoutTerminator() throws {
        let envRef = UnsafeMutableRawPointer.allocate(byteCount: 1, alignment: 1)
        defer { envRef.deallocate() }
        String_iota_utf8_setup(
            envRef: envRef,
            getLengthMethod: { _, _ in 0 },
            getUtf8Method: { _, _, _ in },
            constructor: { pointer, count, _ in
                StringConversionTests.receivedCount = count
                let raw = UnsafeRawBufferPointer(start: UnsafeRawPointer(pointer), count: count)
                StringConversionTests.receivedBytes = Array(raw)
                return OpaquePointer(bitPattern: 0x1)
            }
        )
        let env = Env(envRef)

        // Spans 1-, 2-, 3-, and 4-byte UTF-8 sequences, plus a string large enough
        // that a narrow length type in the constructor path would corrupt the count.
        let values = [
            "",
            "A",
            "héllo",
            "こんにちは",
            "\u{1F92F}\u{1F436}\u{1F353}",
            String(repeating: "\u{1F30D}a", count: 20_000),
        ]
        for value in values {
            let expected = Array(value.utf8)
            _ = try String.toIota(value, env: env)
            XCTAssertEqual(
                Self.receivedCount, expected.count,
                "constructor must receive the UTF-8 byte count, with no terminator included"
            )
            XCTAssertEqual(Self.receivedBytes, expected, "constructor must receive exactly the UTF-8 bytes")
        }
    }
}
