class Green extends SimpleEnum {
    const Green()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Green
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'SimpleEnum.green()'

    Green copyWith() => Green()
}
