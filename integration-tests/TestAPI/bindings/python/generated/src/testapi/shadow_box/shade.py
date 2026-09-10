class Shade extends ShadowBox {
    const Shade(
        this.0_
    )
    final testapi.Shade 0_

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Shade
        && const DeepCollectionEquality().equals(other.0_, 0_)
    )

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(0_)
    )

    @override
    String toString() => 'ShadowBox.shade(0_: $0_)'

    Shade copyWith([
        testapi.Shade? 0_
    ]) => Shade(
        0_ ?? this.0_
    )
}
