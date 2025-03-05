import { Runtime, TestAPI } from 'TestAPI';
const { Results } = TestAPI;
const { Result } = Runtime;

test('results', () => {
    expect(Results.aSuccess.getOrUndefined()).toEqual(42)
    expect(Results.aFailure.exceptionOrUndefined()?.message).toEqual("reboot needed")

    expect(Results.processResult(Result.success("yay"))).toEqual("YAY")
    const failResult = Result.failure(new Results.Error("reasons"))
    expect(Results.processResult(failResult)).toEqual("fail: reasons")
});
