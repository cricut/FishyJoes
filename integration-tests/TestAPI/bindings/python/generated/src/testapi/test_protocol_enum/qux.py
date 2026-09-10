class Qux extends TestProtocolEnum {
    const Qux()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Qux
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'TestProtocolEnum.qux()'

    Qux copyWith() => Qux()
}
