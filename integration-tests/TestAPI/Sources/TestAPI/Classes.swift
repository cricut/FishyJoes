/// <!-- FishyJoes.exportReference(EmptyClass1) -->
public class EmptyClass: Hashable {
    public static func == (lhs: EmptyClass, rhs: EmptyClass) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(String(describing: EmptyClass.self))
    }
    
    /// <!-- FishyJoes.export(create) -->
    public init() { }

    /// <!-- FishyJoes.export(blarg) -->
    public var blarg: String {
        "Blarg!"
    }

    /// <!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->
    public var wibble: String {
        "<wibble>*Wobble*"
    }

    /// <!-- FishyJoes.export(shme) -->
    public func shme() -> String {
        "Shme! Hand me my hook."
    }

    /// <!-- FishyJoes.export(Gorpers) -->
    public func gorp() -> String {
        "Go Gorp!"
    }
}

/// <!-- FishyJoes.exportReference(EmptyClass2) -->
public class EmptyClass2: Hashable {
    public static func == (lhs: EmptyClass2, rhs: EmptyClass2) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(String(describing: EmptyClass2.self))
    }

    /// <!-- FishyJoes.export(make) -->
    public init() { }

    /// <!-- FishyJoes.export(blorg) -->
    public var blarg: String {
        "Gralb!"
    }

    /// <!-- FishyJoes.export(wibble) -->
    public var wibble: String {
        "<timey>*Whimey*"
    }

    /// <!-- FishyJoes.export(shmee) -->
    public func shme() -> String {
        "Shme? What's that ticking sound?"
    }

    /// <!-- FishyJoes.export(gorp) -->
    public func gorp() -> String {
        "Stop Sreprog!"
    }
}
