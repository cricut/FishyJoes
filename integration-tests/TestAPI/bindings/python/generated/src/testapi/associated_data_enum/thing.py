class Thing extends AssociatedDataEnum {
    const Thing(
        this.value
    )
    final int value

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Thing
        && const DeepCollectionEquality().equals(other.value, value)
    )

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(value)
    )

    @override
    String toString() => 'AssociatedDataEnum.thing(value: $value)'

    Thing copyWith([
        int? value
    ]) => Thing(
        value ?? this.value
    )
}
