using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class ActorTests {
        [Fact]
        async Task TestActor() {
            var logger = Actors.TemperatureLogger.Create("log", 3);
            await logger.Update(7);
            await logger.Update(1);
            Assert.Equal(1, await logger.Min());
            Assert.Equal("gol", logger.GetBackwardsLabel());
        }
    }
}
