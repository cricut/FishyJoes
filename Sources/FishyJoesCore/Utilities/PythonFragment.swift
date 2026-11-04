class PythonFragment: SourceFragment {
    /// path ".", "..", etc. for importing from the root of the package
    var rootImportName: String {
        String(repeating: ".", count: pathFromRoot.count)
    }

    let pathFromRoot: [String]

    required init(packageRoot: String, name: String, createIntermediateDirectories: Bool = false) {
        self.pathFromRoot = name.split(separator: "/").map(String.init)
        super.init(destinationPath: "\(packageRoot)/\(name)", createIntermediateDirectories: createIntermediateDirectories)
    }
}
