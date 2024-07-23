using Xunit;

using ResStr = Cricut.FishyJoesRuntime.Result<string, Cricut.TestAPI.Results.Error>;
using ResNint = Cricut.FishyJoesRuntime.Result<nint, Cricut.TestAPI.Results.Error>;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class ResultTests {
        [Fact]
        void TestResult() {
            Assert.Equal(new ResNint.Success(42), Results.GetASuccess());
            Assert.Equal(new ResNint.Failure(new Results.Error("reboot needed")), Results.GetAFailure());

            Assert.Equal("YAY", Results.ProcessResult(new ResStr.Success("yay")));
            var failResult = new ResStr.Failure(new Results.Error("reasons"));
            Assert.Equal("fail: reasons", Results.ProcessResult(failResult));
        }
    }
}
