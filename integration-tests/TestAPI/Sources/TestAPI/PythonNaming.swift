/// <!-- FishyJoes.export(PythonNamingCollisions) -->
public enum PythonNamingCollisions {
    /// <!-- FishyJoes.export(class) -->
    public static let classValue = 7

    /// <!-- FishyJoes.export(list) -->
    public static let listValue = 11

    /// <!-- FishyJoes.export(_leadingUnderscore) -->
    public static let leadingUnderscoreValue = 13

    /// <!-- FishyJoes.export(__dunder__) -->
    public static let dunderValue = 17

    /// <!-- FishyJoes.export(URL) -->
    public static let upperURL = "upper"

    /// <!-- FishyJoes.export(Url) -->
    public static let titleUrl = "title"

    /// <!-- FishyJoes.export(isNaN) -->
    public static let isNaNValue = true

    /// <!-- FishyJoes.export(from) -->
    public static func fromValue() -> String {
        "from"
    }

    /// <!-- FishyJoes.export(keywordArgs) -->
    public static func keywordArgs(`class`: Int, list: Int) -> Int {
        `class` + list
    }
}
