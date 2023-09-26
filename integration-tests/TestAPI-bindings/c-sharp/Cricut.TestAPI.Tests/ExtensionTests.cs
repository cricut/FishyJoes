using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class ExtensionTests {
        [Fact]
        void testExtensionTypes() {
            Assert.Equal(42, new String_PuttingTypesIntoQuestionablePlaces("").TestCall());
            Assert.Equal(43, Structs_PuttingTypesIntoQuestionablePlaces.Create().TestCall());
            Assert.Equal(44, new UnicodeScalar_PuttingTypesIntoQuestionablePlaces.Thing().TestCall());
        }
    }
}
