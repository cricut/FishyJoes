using System;
using Xunit;
using Cricut.TestAPI;

namespace TestAPI.Tests {
    public class ByteTests {
        [Fact]
        void testBytesValues() {
            Assert.Equal(Bytes.bytes, new byte[] { 0xDE, 0xAD, 0xBE, 0xEF });
            Assert.Equal(Bytes.data, new byte[] { 0x0B, 0xAD, 0xF0, 0x0D });
        }

        [Fact]
        void testEchoBytes() {
            Assert.Equal(Bytes.echoBytes(Bytes.bytes), Bytes.bytes);
            Assert.Equal(Bytes.echoData(Bytes.data), Bytes.data);
        }
    }
}
