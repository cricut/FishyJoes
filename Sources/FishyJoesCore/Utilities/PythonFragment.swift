class PythonFragment: SourceFragment {
    /// path ".", "..", etc. for importing from the root of the package
    var rootImportName: String {
        String(repeating: ".", count: pathFromRoot.count)
    }

    let pathFromRoot: [String]

    enum ImportKind: Hashable {
        case immediate // Imported must be fully executed before this fragment is run (e.g. becuase it defines a base class)
        case deferred // OK to import while still in the process of loading (for circular imports) (e.g. for typing annotations)
    }

    // Python requires more careful tracking of imports than any other language we support
    struct ImportStatement: Hashable {
        let path: [String]
        let symbols: [String]?
        let kind: ImportKind
    }

    var imports: Set<ImportStatement> = []

    required init(packageRoot: String, name: String, createIntermediateDirectories: Bool = false) {
        self.pathFromRoot = name.split(separator: "/").map(String.init)
        super.init(destinationPath: "\(packageRoot)/\(name)", createIntermediateDirectories: createIntermediateDirectories)
    }

    func markImplementationImport(for type: PythonType) {
    }

    func markTypeImport(for type: PythonType) {
    }

    func markSuperclassImport(for type: PythonType) {
    }
}
