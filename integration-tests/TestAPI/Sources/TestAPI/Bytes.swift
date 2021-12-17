//
//  Bytes.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/16/21.
//

import Foundation

/// <!-- FishyJoes.exportReference(Bytes) -->
public enum Bytes {
    /// <!-- FishyJoes.export(bytes) -->
    public static let bytes: [UInt8] = [0xDE, 0xAD, 0xBE, 0xEF]
    /// <!-- FishyJoes.export(data) -->
    public static let data: Data = Data([0x0B, 0xAD, 0xF0, 0x0D])
    
    /// <!-- FishyJoes.export(echoBytes) -->
    public static func echo(bytes: [UInt8]) -> [UInt8] { return bytes }
    /// <!-- FishyJoes.export(echoData) -->
    public static func echo(data: Data) -> Data { return data }
}
