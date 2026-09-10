class Red extends SimpleEnum {
    const Red()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Red
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'SimpleEnum.red()'

    Red copyWith() => Red()
}
