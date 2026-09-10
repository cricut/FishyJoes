class Thing extends UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
    const Thing()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Thing
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'UnicodeScalar_PuttingTypesIntoQuestionablePlaces.thing()'

    Thing copyWith() => Thing()
}
