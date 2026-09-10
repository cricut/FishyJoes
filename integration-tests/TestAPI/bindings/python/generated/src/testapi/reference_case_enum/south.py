class South extends ReferenceCaseEnum {
    const South()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is South
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'ReferenceCaseEnum.south()'

    South copyWith() => South()
}
