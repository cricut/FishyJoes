class North extends ReferenceCaseEnum {
    const North()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is North
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'ReferenceCaseEnum.north()'

    North copyWith() => North()
}
