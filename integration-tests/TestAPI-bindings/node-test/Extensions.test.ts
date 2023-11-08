import { TestAPI } from 'TestAPI';

test('testExtensions', () => {
    expect(new TestAPI.String_PuttingTypesIntoQuestionablePlaces("").testCall()).toEqual(42)
    expect(TestAPI.Structs_PuttingTypesIntoQuestionablePlaces.create().testCall()).toEqual(43)
    expect(TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces.testCall("thing")).toEqual(44)
});
