class Hogehoge extends TestNonExportedProtocolEnum {
    const Hogehoge()

    @override
    bool operator ==(Object other) => identical(other, this) || (
        other.runtimeType == runtimeType
        && other is Hogehoge
    )

    @override
    int get hashCode => runtimeType.hashCode

    @override
    String toString() => 'TestNonExportedProtocolEnum.hogehoge()'

    Hogehoge copyWith() => Hogehoge()
}
