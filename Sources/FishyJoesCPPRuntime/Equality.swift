//
//  File.swift
//  File
//
//  Created by Gabriel Pulido on 4/24/22.
//

import Foundation

struct AreEqualBox<Value> {
    var value: Value
}

protocol AreEqual {
    func equals(_ other: Any) -> Bool
}

extension AreEqualBox: AreEqual where Value: Equatable {
    func equals(_ other: Any) -> Bool {
        self.value == other as? Value
    }
}

func areEqual(_ lhs: Any, _ rhs: Any) -> Bool {
    func receiveLHS<LHS>(_ lhs: LHS) -> Bool {
        let lhsBox = AreEqualBox(value: lhs)
        return (lhsBox as! AreEqual).equals(rhs)
    }
    return _openExistential(lhs, do: receiveLHS(_:))
}

@_cdecl("fishyjoes_swift_check_equality")
func areSwiftReferencesEqual(_ lhs: UnsafeMutableRawPointer, _ rhs: UnsafeMutableRawPointer) -> Bool {
    return try! areEqual(Box.takeUnretainedOpaque(lhs).value, Box.takeUnretainedOpaque(rhs).value)
}

func getHash(of obj: Any) -> Int {
    return (obj as! AnyHashable).hashValue
}

@_cdecl("fishyjoes_swift_calc_hash")
func getHashOfSwiftReference(_ ref: UnsafeMutableRawPointer) -> Int {
    return try! getHash(of: Box.takeUnretainedOpaque(ref).value)
}
