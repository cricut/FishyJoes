import { TestAPI } from 'TestAPI';

test('testEmptyEnum', () => {
    expect(() => TestAPI.EmptyEnum.notGoingToHappen()).toThrow()
    expect(54546).toEqual(TestAPI.EmptyEnum.aStaticProperty)
    expect(62645).toEqual(TestAPI.EmptyEnum.aStaticMethod())
});

test('testReferenceEmptyEnum', () => {
    expect(() => TestAPI.ReferenceEmptyEnum.notGoingToHappen()).toThrow()
    expect(5).toEqual(TestAPI.ReferenceEmptyEnum.aStaticProperty)
    expect(6).toEqual(TestAPI.ReferenceEmptyEnum.aStaticMethod())
});

test('testSimpleEnum', () => {
    expect(0xff0000).toEqual(TestAPI.SimpleEnum.getHex("red"))
    expect(0x00ff00).toEqual(TestAPI.SimpleEnum.getHex("green"))
    expect(0x0000ff).toEqual(TestAPI.SimpleEnum.getHex("blue"))
    expect("" + 0xff0000).toEqual(TestAPI.SimpleEnum.hexMethod("red"))
    expect("" + 0x00ff00).toEqual(TestAPI.SimpleEnum.hexMethod("green"))
    expect("" + 0x0000ff).toEqual(TestAPI.SimpleEnum.hexMethod("blue"))
    expect("red").toEqual(TestAPI.SimpleEnum.pickAColor(0))
    expect("green").toEqual(TestAPI.SimpleEnum.pickAColor(1))
    expect("blue").toEqual(TestAPI.SimpleEnum.pickAColor(2))

    expect(TestAPI.SimpleEnum.favoriteColor).toEqual("blue")
    TestAPI.SimpleEnum.favoriteColor = "green"
    expect(TestAPI.SimpleEnum.favoriteColor).toEqual("green")
    TestAPI.SimpleEnum.resetFavoriteColor()
    expect(TestAPI.SimpleEnum.favoriteColor).toEqual("blue")
});

test('AssociatedDataEnum', () => {
    const shape1 = (x: number) => new TestAPI.AssociatedDataEnum.Thing(x)
    const shape2 = (x: string, y: string, z: number) => new TestAPI.AssociatedDataEnum.Bar(x, new TestAPI.AssociatedDataEnum.Other(y, z), true)

    expect((shape2("1", "2", 3)._1 as TestAPI.AssociatedDataEnum.Other)._1).toEqual(3)
    expect(TestAPI.AssociatedDataEnum.staticThing).toEqual(shape1(2))
    expect(4).toEqual(shape1(4).intValue)
    expect(11).toEqual(shape2("hello", "world", 8).intValue)
    expect(shape1(9)).toEqual(shape1(2).plus(shape2("x", "y", 4)))
    expect(shape2("y", "z", 7)).toEqual(shape2("y", "z", 2).plus(shape1(5)))

    const switchMe = shape1(0) as TestAPI.AssociatedDataEnum

    if (switchMe instanceof TestAPI.AssociatedDataEnum.Thing) {
        expect(switchMe.value).toEqual(0)
    } else if (switchMe instanceof TestAPI.AssociatedDataEnum.Other) {
        expect(true).toBe(false)
    } else if (switchMe instanceof TestAPI.AssociatedDataEnum.Bar) {
        expect(true).toBe(false)
    } else if (switchMe instanceof TestAPI.AssociatedDataEnum.NoValue) {
        expect(true).toBe(false)
    } else if (switchMe instanceof TestAPI.AssociatedDataEnum.None) {
        expect(true).toBe(false)
    } else if (switchMe instanceof TestAPI.AssociatedDataEnum.SimpleEnum) {
        // ensure definitions are qualified with namespace (TestApi.SimpleEnum instead of SimpleEnum)
        const _ = TestAPI.SimpleEnum.getHex(switchMe.value);
        expect(true).toBe(false);
    } else {
        const exhaustiveCheck: never = switchMe
        throw new Error(`Unhandled case: ${exhaustiveCheck}`)
    }
});
