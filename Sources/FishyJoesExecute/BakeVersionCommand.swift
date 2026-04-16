import ArgumentParser
import Foundation

public struct BakeVersionCommand: ParsableCommand {
    public static var configuration = CommandConfiguration(
        commandName: "bake-version",
        abstract: "Bake version into Dart pubspec files before tagging a release"
    )

    @Option(name: .long, help: "Version to bake into pubspec.yaml files")
    var version: String

    @Option(name: .long, parsing: .upToNextOption, help: "Explicit pubspec file paths to update. Defaults to known FishyJoes/Cri* Dart pubspec paths.")
    var file: [String] = []

    public init() {}

    public mutating func validate() throws {
        guard !version.isEmpty else {
            throw ValidationError("--version must not be empty")
        }
        guard !version.contains("\""),
              !version.contains("\n"),
              !version.contains("\r")
        else {
            throw ValidationError("--version must not contain quotes or newline characters")
        }
    }

    public mutating func run() throws {
        let pathsToUpdate = try resolvedPubspecPaths()
        var changedPaths: [String] = []

        for path in pathsToUpdate {
            if try Self.bakeVersion(inFileAtPath: path, version: version) {
                changedPaths.append(path)
            }
        }

        if changedPaths.isEmpty {
            Log.info("No changes needed. All matching pubspec files already have version '\(version)'.")
            return
        }

        for path in changedPaths {
            Log.success("Updated \(path)")
        }
    }

    static let defaultPubspecPaths = [
        "dart-runtime/pubspec.yaml",
        "bindings/dart/generated/pubspec.yaml",
    ]

    static func bakeVersion(inFileAtPath path: String, version: String) throws -> Bool {
        let url = URL(fileURLWithPath: path)
        let originalData = try Data(contentsOf: url)
        guard let originalText = String(data: originalData, encoding: .utf8) else {
            throw ValidationError("File is not valid UTF-8: \(path)")
        }

        let bakedText = try bakeVersion(inPubspecContent: originalText, version: version)
        guard bakedText != originalText else { return false }
        try bakedText.write(to: url, atomically: true, encoding: .utf8)
        return true
    }

    static func bakeVersion(inPubspecContent content: String, version: String) throws -> String {
        guard !version.isEmpty else {
            throw ValidationError("version must not be empty")
        }
        guard !version.contains("\""),
              !version.contains("\n"),
              !version.contains("\r")
        else {
            throw ValidationError("version must not contain quotes or newline characters")
        }

        let lineEnding = content.contains("\r\n") ? "\r\n" : "\n"
        let normalized = content.replacingOccurrences(of: "\r\n", with: "\n")
        let hasTrailingNewline = normalized.hasSuffix("\n")
        var lines = normalized.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
        let bakedVersionLine = #"version: "\#(version)""#

        if let versionIndex = lines.firstIndex(where: { $0.hasPrefix("version:") }) {
            lines[versionIndex] = bakedVersionLine
        } else if let environmentIndex = lines.firstIndex(where: { $0.hasPrefix("environment:") }) {
            lines.insert(bakedVersionLine, at: environmentIndex)
        } else if let descriptionIndex = lines.firstIndex(where: { $0.hasPrefix("description:") }) {
            lines.insert(bakedVersionLine, at: descriptionIndex + 1)
        } else {
            lines.append(bakedVersionLine)
        }

        var result = lines.joined(separator: "\n")
        if hasTrailingNewline {
            result += "\n"
        }
        if lineEnding == "\r\n" {
            result = result.replacingOccurrences(of: "\n", with: "\r\n")
        }
        return result
    }

    private func resolvedPubspecPaths() throws -> [String] {
        if !file.isEmpty {
            let missingPaths = file.filter { !FileManager.default.fileExists(atPath: $0) }
            guard missingPaths.isEmpty else {
                throw ValidationError("Requested file paths do not exist: \(missingPaths.joined(separator: ", "))")
            }
            return file
        }

        let existingDefaultPaths = Self.defaultPubspecPaths.filter {
            FileManager.default.fileExists(atPath: $0)
        }
        guard !existingDefaultPaths.isEmpty else {
            throw ValidationError(
                "No supported Dart pubspec files found. Looked for: \(Self.defaultPubspecPaths.joined(separator: ", "))"
            )
        }
        return existingDefaultPaths
    }
}
