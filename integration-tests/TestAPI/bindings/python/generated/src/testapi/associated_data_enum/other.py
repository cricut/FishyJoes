class Other extends AssociatedDataEnum {
    const Other(
        this.unnamed,
        this.1_
    )
    final str unnamed
    final int 1_

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Other
        && const DeepCollectionEquality().equals(other.unnamed, unnamed)
        && const DeepCollectionEquality().equals(other.1_, 1_)
    )

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(unnamed),
        const DeepCollectionEquality().hash(1_)
    )

    @override
    String toString() => 'AssociatedDataEnum.other(unnamed: $unnamed, 1_: $1_)'

    Other copyWith([
        str? unnamed,
        int? 1_
    ]) => Other(
        unnamed ?? this.unnamed,
        1_ ?? this.1_
    )
}
