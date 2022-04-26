enum AndroidArchitecture: String, Equatable, CaseIterable {
    case arm, i686, x86_64, aarch64

    var triple: String {
        switch self {
        case .arm: return "armv7-unknown-linux-android"
        default: return "\(rawValue)-unknown-linux-android"
        }
    }

    var ndkName: String {
        switch self {
        case .arm: return "armeabi-v7a"
        case .i686: return "x86"
        case .x86_64: return "x86_64"
        case .aarch64: return "arm64-v8a"
        }
    }
}
