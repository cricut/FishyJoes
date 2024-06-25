import Foundation
import swsh

class BasePhases {
    let platform: Platform
    let options: CodeGen

    init(
        platform: Platform,
        options: CodeGen
    ) {
        self.platform = platform
        self.options = options
    }

    // MARK: Common defaultable phases. Call super if overriding
    func preBuildPhase() throws {}

    func preInstallPhase() throws {
        // Create / clean platform-specific output directories
        // Prepare output directory
        try cmd("rm", "-rf", platform.outputDir(options.config)).run()
        try cmd("mkdir", "-p", platform.outputDir(options.config)).run()
    }

    func preTestPhase() throws {}

    // MARK: utility methods

    // Define a function to install library files to the output directory
    func installLibrary(_ name: String, installName: String? = nil, sign: Bool = false) throws {
        let src = try platform.dylibPath(for: name, configuration: options.buildConfig)
        let installName = installName ?? platform.dylibName(for: name)
        let dest = "\(platform.outputDir(options.config))/\(installName)"
        try cmd("cp", src, dest).run()
        if sign, installName.hasSuffix(".dylib") {
            try cmd("codesign", "-s", "-", dest).run()
        }
    }

    // Define functions to operate on files & lines to replace each instance of __MODULE_NAME__ with the name of a module
    // and replace each line containing __MODULE_DEPENDENCY__ with one line for each dependency module
    func template(line: String, moduleName: String, dependencies: [String]) -> [String] {
        let line = line.replacingOccurrences(of: "__MODULE_NAME__", with: moduleName)
        if line.contains("__MODULE_DEPENDENCY__") {
            return dependencies.map {
                line.replacingOccurrences(of: "__MODULE_DEPENDENCY__", with: $0)
            }
        } else {
            return [line]
        }
    }

    func template(inPath: String, outPath: String, moduleName: String, dependencies: [String]) throws {
        var lines = try cmd("cat", inPath).runLines()
        lines = lines.flatMap { template(line: $0, moduleName: moduleName, dependencies: dependencies) }
        lines.append("") // newline terminate
        try cmd("cat", "-")
            .input(lines.joined(separator: "\n"))
            .output(overwritingFile: outPath)
            .run()
    }
}
