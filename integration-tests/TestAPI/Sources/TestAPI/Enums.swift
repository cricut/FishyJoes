import Foundation

/// <!-- FishyJoes.export(SimpleEnum) -->
public enum SimpleEnum {
    case red, blue

    /// <!-- FishyJoes.export(testFuncCall) -->
    public func testFuncCall(x: Int, y: Int) -> Int{
        print("does this print x:\(x) y:\(y) self: \(self)?")
        return x + y
    }
}
