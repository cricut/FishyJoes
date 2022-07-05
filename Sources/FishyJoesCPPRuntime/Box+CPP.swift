//
//  CPPReferences.swift
//  
//
//  Created by Gabriel Pulido on 7/1/22.
//

import Foundation

@_cdecl("fishyjoes_swift_release")
func cppReleaseObject(ptr: UnsafeMutableRawPointer) {
    AnyBox.releaseOpaque(ptr)
}

func cppAllocPackedDataPtr(packer: CPPPacker) -> UnsafeMutableRawPointer {
    let ret = UnsafeMutablePointer<UInt8>.allocate(capacity: packer.data.count)
    packer.data.copyBytes(to: ret, from: 0..<packer.data.count)
    return UnsafeMutableRawPointer(ret)
}

@_cdecl("fishyjoes_swift_release_packed_data")
func cppReleasePackedData(ptr: UnsafeMutableRawPointer) {
    ptr.deallocate()
}

extension Box {
    public static func fromCPP(_ packer: CPPPacker) throws -> Box<T> {
        return try Box(inner: AnyBox.fromCPP(packer))
    }
    public static func toCPP(_ packer: CPPPacker, _ box: Box) {
        AnyBox.toCPP(packer, box.box)
    }
}

extension AnyBox {
    public static func fromCPP(_ packer: CPPPacker) -> AnyBox {
        return takeUnretainedOpaque(UnsafeMutableRawPointer(bitPattern: UInt(packer.take(UInt64.self)))!)
    }
    // The retain here is paired with destruction on the C++ side, which calls cppReleaseObject.
    public static func toCPP(_ packer: CPPPacker, _ box: AnyBox) {
        packer.put(UInt64(UInt(bitPattern: box.retainedOpaque())))
    }
}
