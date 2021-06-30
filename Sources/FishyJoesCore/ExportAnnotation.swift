import SourceryRuntime

struct ExportAnnotation {
    let exportAsReference: Bool
    let c: String?
    let cSet: String?
    let js: String?
    let omitParameters: [String]
}

extension Annotated {
    var exportAnnotation: ExportAnnotation? {
        for (key, value) in annotations {
            guard key.hasPrefix("\"export(") || key.hasPrefix("\"exportReference(") else {
                // TODO: remove after things stabilize to allow compatibility with other templates
                fatalErr("unknown attribute \(key) = \(value)")
                // continue
            }
            let parts = key.split(separator: "(", maxSplits: 1)
            let annotationName = String(parts[0].dropFirst())
            guard parts[1].hasSuffix(")\"") else {
                fatalErr("missing close ')\"' in \(key)")
            }

            var attrs: [String: String] = [:]
            for pairString in parts[1].dropLast(2).split(separator: ",") {
                let pair = pairString.split(separator: ":").map { $0.trimmingCharacters(in: .whitespaces) }
                guard pair.count == 2 else {
                    fatalErr("invalid syntax in \(key)")
                }
                attrs[pair[0]] = pair[1]
            }

            if let unknown = Set(attrs.keys).subtracting(["c", "cSet", "js", "omitParameters"]).first {
                fatalErr("unknown attribute \(unknown) in \(key)")
            }

            var omitParameters: [String] = []
            if let omitString = attrs["omitParameters"] {
                guard omitString.first == "[", omitString.last == "]" else {
                    fatalErr("invalid omitParameters in \(key). Expected [name, ...]")
                }
                omitParameters = omitString.dropFirst().dropLast().split(separator: ",").map {
                    $0.trimmingCharacters(in: .whitespaces)
                }
            }

            return ExportAnnotation(
                exportAsReference: annotationName == "exportReference",
                c: attrs["c"],
                cSet: attrs["cSet"],
                js: attrs["js"],
                omitParameters: omitParameters
            )
        }
        return nil
    }
}
