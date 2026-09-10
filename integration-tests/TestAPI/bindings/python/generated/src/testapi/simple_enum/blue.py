class Blue extends SimpleEnum {
    const Blue()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Blue
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'SimpleEnum.blue()'

    Blue copyWith() => Blue()
}
