//
//  Ranges.swift
//  FishyJoes
//
//  Created by Matt Stoker on 4/21/23.
//

/// <!-- FishyJoes.export(Ranges) -->
public enum Ranges {
    /// <!-- FishyJoes.export(intRange) -->
    public static let intClosedRange = -10...20

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ intClosedRange: ClosedRange<Int>) -> ClosedRange<Int> {
        return intClosedRange
    }
}
