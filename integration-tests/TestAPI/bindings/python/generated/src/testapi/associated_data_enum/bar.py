class Bar extends AssociatedDataEnum {
    const Bar(
        this.named,
        this.1_,
        this.toggled
    )
    final str named
    final testapi.AssociatedDataEnum 1_
    final bool toggled

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Bar
        && const DeepCollectionEquality().equals(other.named, named)
        && const DeepCollectionEquality().equals(other.1_, 1_)
        && const DeepCollectionEquality().equals(other.toggled, toggled)
    )

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(named),
        const DeepCollectionEquality().hash(1_),
        const DeepCollectionEquality().hash(toggled)
    )

    @override
    String toString() => 'AssociatedDataEnum.bar(named: $named, 1_: $1_, toggled: $toggled)'

    Bar copyWith([
        str? named,
        testapi.AssociatedDataEnum? 1_,
        bool? toggled
    ]) => Bar(
        named ?? this.named,
        1_ ?? this.1_,
        toggled ?? this.toggled
    )
}
