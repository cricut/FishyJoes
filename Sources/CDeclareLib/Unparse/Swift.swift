enum Swift {
    struct Method {
        let annotations: [String]
        let name: String
        let parameters: SwiftFormal
        let returnType: BetterType
    }

    struct Extension {
        let extending: BetterType
        let conformingTo: [String]
        var methods: [Method]
    }
}

extension Swift.Extension {
    // var fragment: SourceFragment {
    //     let fragment =
    // }
}
