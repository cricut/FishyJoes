import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('CollectionTests', () {
    test('testCollectionValues', () {
        expect(Collections.arrayOfInt, equals([2, 7, 3, 5, 8]));
        expect(Collections.setOfInt, equals(Set.of([5, 9, 2, 4, 3])));
        expect(Collections.dictionaryOfIntToInt, equals({1: 10, 2: 20, 3: 30, 4: 40, 5: 50}));
    });

    test('testOptionalCollectionValues', () {
        expect(Collections.maybeArrayOfInt, equals([2, 7, 3, 5, 8]));
        expect(Collections.maybeSetOfInt, equals(Set.of([5, 9, 2, 4, 3])));
        expect(Collections.maybeDictionaryOfIntToInt, equals({1: 10, 2: 20, 3: 30, 4: 40, 5: 50}));
    });

    test('testOptionalCollectionOfOptionalValues', () {
        expect(Collections.maybeArrayOfMaybeInt, equals([null, 2, 7, 3, 5, 8]));
        expect(Collections.maybeSetOfMaybeInt, equals(Set.of([null, 5, 9, 2, 4, 3])));
        expect(Collections.maybeDictionaryOfIntToMaybeInt, equals({100: null, 1: 10, 2: 20, 3: 30, 4: 40, 5: 50}));
    });

    test('testFunctionsTakingAndReturningCollectionTypes', () {
        final intArray = [2, 4, 6, 30, 32];
        final intSet = Set.of(intArray);
        final intDict = {1: 12, 123: 21};
        expect(Collections.echoArrayOfInt(intArray), equals(intArray));
        expect(Collections.echoSetOfInt(intSet), equals(intSet));
        expect(Collections.echoDictionaryOfIntToInt(intDict), equals(intDict));
    });

    test('testFunctionsTakingAndReturningOptionalCollectionTypes', () {
        final intArray = [2, 4, 6, null, 30, 32];
        final intSet = Set.of(intArray);
        final intDict = {1: 12, 123: 21, 18: null};
        expect(Collections.echoMaybeArrayOfMaybeInt(intArray), equals(intArray));
        expect(Collections.echoMaybeSetOfMaybeInt(intSet), equals(intSet));
        expect(Collections.echoMaybeDictionaryOfIntToMaybeInt(intDict), equals(intDict));
    });

    test('testFunctionsTakingClosuresWithCollectionTypes', () {
        expect(
          Collections.collectionMapper([10, 20, 30], (it) => (it ?? []).map((x) => (x ?? 0) * 2).toList()),
          equals([20, 40, 60])
        );
    });

    test('testObjectsWithCollectionMembers', () {
        expect(Collections_CollectionHolder.staticProperty, equals([null, 2, 7, 3, 5, 8]));
        expect(Collections_CollectionHolder.staticMutableProperty, equals([null, 2, 7, 3, 5, 8]));
        Collections_CollectionHolder.staticMutableProperty = [100, null, 200];
        expect(Collections_CollectionHolder.staticMutableProperty, equals([100, null, 200]));
        final s = Collections.defaultCollectionHolder;
        expect(s, equals(Collections.defaultCollectionHolder));
        s.boolDictionary = s.boolDictionary.map((key, value) => MapEntry(key, !value));
        expect(s, isNot(equals(Collections.defaultCollectionHolder)));
    });
  });
}
