//
//  URLs.swift
//  FishyJoes
//
//  Created by Matt Stoker on 7/5/23.
//

import Foundation

/// <!-- FishyJoes.export(URLs) -->
public enum URLs {
    /// <!-- FishyJoes.export(simple) -->
    public static let simple: URL = URL(string: "https://www.google.com")!
    /// <!-- FishyJoes.export(remoteFile) -->
    public static let remoteFile: URL = URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png")!
    /// <!-- FishyJoes.export(localFile) -->
    public static let localFile: URL = URL(string: "file:///Users/someuser/Desktop/a.png")!

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ url: URL) -> URL {
        return url
    }
}
