import { TestAPI } from 'TestAPI';
// Currently not supported in TS
// test('testEmptyEnum', () => {
//     expect(() => TestAPI.EmptyEnum.notGoingToHappen()).toThrow()
// });
// function testSimpleEnum() {
//     expect(0xff0000).toEqual(TestAPI.SimpleEnum.red.hex)
//     expect(0x00ff00).toEqual(TestAPI.SimpleEnum.green.hex)
//     expect(0x0000ff).toEqual(TestAPI.SimpleEnum.blue.hex)
//     expect(TestAPI.SimpleEnum.red).toEqual(TestAPI.SimpleEnum.pickAColor(0))
//     expect(TestAPI.SimpleEnum.green).toEqual(TestAPI.SimpleEnum.pickAColor(1))
//     expect(TestAPI.SimpleEnum.blue).toEqual(TestAPI.SimpleEnum.pickAColor(2))
// }
// testSimpleEnum()

test('AssociatedDataEnum', () => {
    const shape1 = (x: number) => new TestAPI.AssociatedDataEnum.Thing(x)
    const shape2 = (x: string, y: string, z: number) => new TestAPI.AssociatedDataEnum.Bar(x, new TestAPI.AssociatedDataEnum.Other(y, z))

    expect(4).toEqual(shape1(4).intValue)
    expect(11).toEqual(shape2("hello", "world", 8).intValue)
    expect(shape1(9)).toEqual(shape1(2).plus(shape2("x", "y", 4)))
    expect(shape2("y", "z", 7)).toEqual(shape2("y", "z", 2).plus(shape1(5)))
});
