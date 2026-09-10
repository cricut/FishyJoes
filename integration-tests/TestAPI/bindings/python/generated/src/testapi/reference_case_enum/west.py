class West extends ReferenceCaseEnum {
    const West()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is West
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'ReferenceCaseEnum.west()'

    West copyWith() => West()
}
