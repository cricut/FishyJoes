class Empty extends ShadowBox {
    const Empty()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Empty
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'ShadowBox.empty()'

    Empty copyWith() => Empty()
}
