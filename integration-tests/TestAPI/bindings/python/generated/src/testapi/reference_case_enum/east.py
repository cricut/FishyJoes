class East extends ReferenceCaseEnum {
    const East()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is East
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'ReferenceCaseEnum.east()'

    East copyWith() => East()
}
