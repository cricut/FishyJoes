/// <!-- FishyJoes.export(Tuples) -->
public enum Tuples {
    public typealias T2 = (Int, String)
    public typealias T3 = (String, Double, String)
    public typealias T4 = (T2, T3, String, Bool)
    public typealias T5 = (String, UInt8, T4, T3, T2)
    public typealias T6 = (String, Int, Double, T4, T5, Bool)

    /// <!-- FishyJoes.export(tuple2) -->
    public static let tuple2: T2 = (1, "two")
    /// <!-- FishyJoes.export(tuple3) -->
    public static let tuple3: T3 = ("one", 2.1, "three")
    /// <!-- FishyJoes.export(tuple4) -->
    public static let tuple4: T4 = (tuple2, tuple3, "IV", true)
    /// <!-- FishyJoes.export(tuple5) -->
    public static let tuple5: T5 = ("I", UInt8(2), tuple4, tuple3, tuple2)
    /// <!-- FishyJoes.export(tuple6) -->
    public static let tuple6: T6 = ("one", 2, 3.14, tuple4, tuple5, false)

    static func stringifyTuples(t2: T2, t3: T3, t4: T4, t5: T5, t6: T6) -> String {
        "\(t2), \(t3), \(t4), \(t5), \(t6)"
    }

    /// <!-- FishyJoes.export(checkTuples) -->
    public static func checkTuples(t2: T2, t3: T3, t4: T4, t5: T5, t6: T6) -> Bool {
        "\(t2), \(t3), \(t4), \(t5), \(t6)" ==
        "\(tuple2), \(tuple3), \(tuple4), \(tuple5), \(tuple6)"
    }
}
