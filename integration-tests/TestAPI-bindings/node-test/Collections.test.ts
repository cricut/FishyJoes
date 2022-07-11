import { TestAPI } from 'TestAPI';
import { sortedEntries } from './testUtils';

test('CollectionValues', () => {
    expect(TestAPI.Collections.arrayOfInt).toEqual([2,7,3,5,8])
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.setOfInt.has(x)).toBe(true)
    }
    let map = new Map([[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(sortedEntries(TestAPI.Collections.dictionaryOfIntToInt)).toEqual(sortedEntries(map))
});

test('OptionalCollectionValues', () => {
    expect(TestAPI.Collections.maybeArrayOfInt).toEqual([2,7,3,5,8])
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.maybeSetOfInt!.has(x)).toBe(true)
    }
    let map = new Map([[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(sortedEntries(TestAPI.Collections.maybeDictionaryOfIntToInt!)).toEqual(sortedEntries(map))
});

test('OptionalCollectionOfOptionalValues', () => {
    expect(TestAPI.Collections.maybeArrayOfMaybeInt).toEqual([undefined, 2,7,3,5,8])
    // TODO: What happened to the nil value on the Swift side?!?
    for (let x of [5, 9, 2, 4, 3]) {
        expect(TestAPI.Collections.maybeSetOfMaybeInt!.has(x)).toBe(true)
    }
    let map = new Map([[100,undefined],[1,10],[2,20],[3,30],[4,40],[5,50]])
    expect(sortedEntries(TestAPI.Collections.maybeDictionaryOfIntToMaybeInt!)).toEqual(sortedEntries(map))
});

test('FunctionsTakingAndReturningCollectionTypes', () => {
    expect(TestAPI.Collections.echoArrayOfInt(TestAPI.Collections.arrayOfInt)).toEqual(TestAPI.Collections.arrayOfInt)
    // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoSetOfInt(TestAPI.Collections.setOfInt)).toEqual(TestAPI.Collections.setOfInt)
    // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoDictionaryOfIntToInt(TestAPI.Collections.dictionaryOfIntToInt)).toEqual(TestAPI.Collections.dictionaryOfIntToInt)
});

test('FunctionsTakingAndReturningOptionalCollectionTypes', () => {
    expect(TestAPI.Collections.echoMaybeArrayOfMaybeInt(TestAPI.Collections.maybeArrayOfMaybeInt)).toEqual(TestAPI.Collections.maybeArrayOfMaybeInt!)
    // TODO: Dies with: TODO: implement Swift.Set.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoMaybeSetOfMaybeInt(TestAPI.Collections.maybeSetOfMaybeInt)).toEqual(TestAPI.Collections.maybeSetOfMaybeInt)
    // TODO: Dies with: TODO: implement Swift.Dictionary.static func fromNode(_:env:)
    // expect(TestAPI.Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(TestAPI.Collections.maybeDictionaryOfIntToMaybeInt)).toEqual(TestAPI.Collections.maybeDictionaryOfMaybeIntToMaybeInt)
});

test('FunctionsTakingClosuresWithCollectionTypes', () => {
    // TODO: Fix breakage
    // expect(TestAPI.Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }).toEqual(arrayListOf(20,40,60))
});

test('ObjectsWithCollectionMembers', () => {
    expect(TestAPI.Collections.CollectionHolder.staticPropery).toEqual([undefined, 2, 7, 3, 5, 8]);
    expect(TestAPI.Collections.CollectionHolder.staticMutablePropery).toEqual([undefined, 2, 7, 3, 5, 8]);
    // TODO: type annotation is buggy
    TestAPI.Collections.CollectionHolder.staticMutablePropery = [100, undefined as any, 200];
    expect(TestAPI.Collections.CollectionHolder.staticMutablePropery).toEqual([100, undefined, 200]);
    let s = TestAPI.Collections.defaultCollectionHolder;
    expect(s).toEqual(TestAPI.Collections.defaultCollectionHolder);
    var map = new Map<boolean, boolean>()
    s.boolDictionary.forEach((value: boolean, key: boolean) => {
        map.set(key, !value);
    });
    s.boolDictionary = map
    expect(s).not.toEqual(TestAPI.Collections.defaultCollectionHolder);
});
