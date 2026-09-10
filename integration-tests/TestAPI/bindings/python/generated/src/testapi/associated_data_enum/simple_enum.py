class SimpleEnum extends AssociatedDataEnum {
    const SimpleEnum(
        this.value
    )
    final testapi.SimpleEnum value

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is SimpleEnum
        && const DeepCollectionEquality().equals(other.value, value)
    )

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(value)
    )

    @override
    String toString() => 'AssociatedDataEnum.simpleEnum(value: $value)'

    SimpleEnum copyWith([
        testapi.SimpleEnum? value
    ]) => SimpleEnum(
        value ?? this.value
    )
}
