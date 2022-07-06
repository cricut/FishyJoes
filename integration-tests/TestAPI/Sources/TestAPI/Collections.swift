//
//  Collections.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/20/21.
//

/// <!-- FishyJoes.exportReference(Collections) -->
public enum Collections {
    // MARK: - Collection Values

    /// <!-- FishyJoes.export(arrayOfInt) -->
    public static let arrayOfInt: [Int] = [2, 7, 3, 5, 8]
    /// <!-- FishyJoes.export(setOfInt) -->
    public static let setOfInt: Set<Int> = [5, 9, 2, 4, 3]
    /// <!-- FishyJoes.export(dictionaryOfIntToInt) -->
    public static let dictionaryOfIntToInt: [Int: Int] = [1: 10, 2: 20, 3: 30, 4: 40, 5: 50]

    // MARK: - Optional Collection Values

    /// <!-- FishyJoes.export(maybeArrayOfInt) -->
    public static let maybeArrayOfInt: [Int]? = [2, 7, 3, 5, 8]
    /// <!-- FishyJoes.export(maybeSetOfInt) -->
    public static let maybeSetOfInt: Set<Int>? = [5, 9, 2, 4, 3]
    /// <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
    public static let maybeDictionaryOfIntToInt: [Int: Int]? = [1: 10, 2: 20, 3: 30, 4: 40, 5: 50]

    // MARK: - Optional Collection of Optional Values

    /// <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
    public static let maybeArrayOfMaybeInt: [Int?]? = [nil, 2, 7, 3, 5, 8]
    /// <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
    public static let maybeSetOfMaybeInt: Set<Int?>? = [nil, 5, 9, 2, 4, 3]
    /// <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
    public static let maybeDictionaryOfIntToMaybeInt: [Int: Int?]? = [100: nil, 1: 10, 2: 20, 3: 30, 4: 40, 5: 50]

    // MARK: - Functions Taking / Returning Collection Types

    /// <!-- FishyJoes.export(echoArrayOfInt) -->
    public static func echo(arrayOfInt: [Int]) -> [Int] { return arrayOfInt }
    /// <!-- FishyJoes.export(echoSetOfInt) -->
    public static func echo(setOfInt: Set<Int>) -> Set<Int> { return setOfInt }
    /// <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
    public static func echo(dictionaryOfIntToInt: [Int: Int]) -> [Int: Int] { return dictionaryOfIntToInt }

    // MARK: - Functions Taking / Returning Optional Collection Types

    /// <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
    public static func echo(maybeArrayOfMaybeInt: [Int?]?) -> [Int?]? { return maybeArrayOfMaybeInt }
    /// <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
    public static func echo(maybeSetOfMaybeInt: Set<Int?>?) -> Set<Int?>? { return maybeSetOfMaybeInt }
    /// <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
    public static func echo(maybeDictionaryOfIntToMaybeInt: [Int: Int?]?) -> [Int: Int?]? { return maybeDictionaryOfIntToMaybeInt }

    // MARK: - Functions Taking Closures with Collection Types

    // TODO: Breaks during generation with error: invalid conversion from throwing function of type
//    /// <!-- FishyJoes.export(collectionMapper) -->
//    public static func collectionMapper(collection: [Int?]?, _ mapper: ([Int?]?) -> [Int?]?) -> [Int?]? { return mapper(collection) }

    // MARK: - Objects with Collection Members

    /// <!-- FishyJoes.export(Collections.CollectionHolder) -->
    public struct CollectionHolder {
        /// <!-- FishyJoes.export(staticPropery) -->
        public static let staticPropery: [Int?] = [nil, 2, 7, 3, 5, 8]
        /// <!-- FishyJoes.export(staticMutablePropery) -->
        public static var staticMutablePropery: [Int?] = [nil, 2, 7, 3, 5, 8]

        public var boolArray: [Bool]
        public var boolSet: Set<Bool>
        public var boolDictionary: [Bool: Bool]
        public var integerArray: [Int]
        public var integerSet: Set<Int>
        public var integerDictionary: [Int: Int]
        public var stringArray: [String]
        public var stringSet: Set<String>
        public var stringDictionary: [String: String]

        public init(
            boolArray: [Bool] = [false, true],
            boolSet: Set<Bool> = [false, true],
            boolDictionary: [Bool: Bool] = [true: false, false: true],
            integerArray: [Int] = [2, 7, 3, 5, 8],
            integerSet: Set<Int> = [5, 9, 2, 4, 3],
            integerDictionary: [Int: Int] = [1: 10, 2: 20, 3: 30, 4: 40, 5: 50],
            stringArray: [String] = ["apple", "pear", "strawberry"],
            stringSet: Set<String> = ["apple", "pear", "strawberry"],
            stringDictionary: [String: String] = ["fruitOne": "apple", "fruitTwo": "pear", "fruitThree": "strawberry"]
        ) {
            self.boolArray = boolArray
            self.boolSet = boolSet
            self.boolDictionary = boolDictionary
            self.integerArray = integerArray
            self.integerSet = integerSet
            self.integerDictionary = integerDictionary
            self.stringArray = stringArray
            self.stringSet = stringSet
            self.stringDictionary = stringDictionary
        }
    }

    /// <!-- FishyJoes.export(defaultCollectionHolder) -->
    public static let defaultCollectionHolder = CollectionHolder()
}
