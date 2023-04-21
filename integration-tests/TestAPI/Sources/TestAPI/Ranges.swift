//
//  Ranges.swift
//  FishyJoes
//
//  Created by Matt Stoker on 4/21/23.
//

/// <!-- FishyJoes.export(Ranges) -->
public enum Ranges {
    /// <!-- FishyJoes.export(closedIntRange) -->
    public static let closedIntRange: ClosedRange<Int> = -10...20

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ closedIntRange: ClosedRange<Int>) -> ClosedRange<Int> {
        return closedIntRange
    }
}
