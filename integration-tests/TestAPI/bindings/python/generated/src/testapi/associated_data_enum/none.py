class None extends AssociatedDataEnum {
    const None()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is None
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'AssociatedDataEnum.none()'

    None copyWith() => None()
}
