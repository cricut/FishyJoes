class PythonFragment: SourceFragment {
    /// path ".", "..", etc. for importing from the root of the package
    let rootImportName: String

    required init(packageRoot: String, name: String, createIntermediateDirectories: Bool = false) {
        self.rootImportName = "." + name.filter { $0 == "/" }.map { _ in "." }
        super.init(destinationPath: "\(packageRoot)/\(name)", createIntermediateDirectories: createIntermediateDirectories)
    }
}
