using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ByteTests {
        [Fact]
        void testBytesValues() {
            Assert.Equal(Bytes.TheBytes, new byte[] { 0xDE, 0xAD, 0xBE, 0xEF });
            Assert.Equal(Bytes.Data, new byte[] { 0x0B, 0xAD, 0xF0, 0x0D });
        }

        [Fact]
        void testEchoBytes() {
            Assert.Equal(Bytes.EchoBytes(Bytes.TheBytes), Bytes.TheBytes);
            Assert.Equal(Bytes.EchoData(Bytes.Data), Bytes.Data);
        }
    }
}
