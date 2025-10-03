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
    public static let simple: URL = { URL(string: "https://www.google.com")! }()
    /// <!-- FishyJoes.export(remoteFile) -->
    public static let remoteFile: URL = { URL(string: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png")! }()
    /// <!-- FishyJoes.export(localFile) -->
    public static let localFile: URL = { URL(string: "file:///Users/someuser/Desktop/a.png")! }()

    /// <!-- FishyJoes.export(dataImage) -->
    public static let dataImage: URL = {
        let chunks = [
            "data:image/jpeg;base64,",
            "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAEMuMjoyKkM6NjpLR0NPZKZsZFxcZMyS",
            "mnmm8dT++u3U6eX//////////+Xp////////////////////////////2wBDAUdL",
            "S2RXZMRsbMT//+n/////////////////////////////////////////////////",
            "////////////////////wAARCAAyACMDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEA",
            "AAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIh",
            "MUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6",
            "Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZ",
            "mqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx",
            "8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREA",
            "AgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAV",
            "YnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hp",
            "anN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPE",
            "xcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwCZ",
            "2CKWNVHuHY8HAps8pkk/2RwKVFU9qQJAJZP7xqxDKX4br60i26n2prp5LKw5Hei4",
            "2ifFFKpDKCO9FBJmgfNU0ZAPf8KjAx1GCKsoqBfMxQykTRspXINJcDMRpkC7onxx",
            "k1IkQBAPQc0hsWKPZGqnqKKkoqjMy+2KlPKquccZqAHip4dpILEqR3pFoswjamNw",
            "NTR4K7gQc9xVSWT+FTn1NQxuyn5SQfahAzSoqp9qkHZTRTJsVE+5ViL7q0UUmUiI",
            "dKRfvfhRRQIVupooopgf/9k="
        ]
        return URL(string: chunks.joined())!
    }()

    /// <!-- FishyJoes.export(echo) -->
    public static func echo(_ url: URL) -> URL {
        return url
    }
}
