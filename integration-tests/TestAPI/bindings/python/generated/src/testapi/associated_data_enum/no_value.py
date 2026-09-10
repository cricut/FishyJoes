class NoValue extends AssociatedDataEnum {
    const NoValue()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is NoValue
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'AssociatedDataEnum.noValue()'

    NoValue copyWith() => NoValue()
}
