using System;
using Xunit;

namespace Cricut.BareBones.Tests {
    public class ExampleTests {
        [Fact]
        public void BoneCount()
        {
            Assert.Equal(206, BareBones.Skeleton.BoneCount);
        }
    }
}
