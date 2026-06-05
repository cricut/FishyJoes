import XCTest

final class GeneratedPublicManifestTests: XCTestCase {
    func testEmojiFunGeneratedManifestsDoNotLeakLocalDevelopmentDependencies() throws {
        let root = try repositoryRoot()
        let checkedFiles = [
            "Examples/EmojiFun/bindings/c-sharp/generated/Cricut.EmojiFun/Cricut.EmojiFun.csproj",
            "Examples/EmojiFun/bindings/dart/generated/pubspec.yaml",
            "Examples/EmojiFun/bindings/ts/generated/package.native-macos.json",
            "Examples/EmojiFun/bindings/ts/generated/package.native-ubuntu.json",
            "Examples/EmojiFun/bindings/ts/generated/package.native-windows.json",
        ]

        for path in checkedFiles {
            let contents = try String(contentsOfFile: root.appendingPathComponent(path).path, encoding: .utf8)

            XCTAssertFalse(contents.contains("file:../"), "\(path) contains a local npm file dependency")
            XCTAssertFalse(contents.contains("RestoreAdditionalProjectSources"), "\(path) contains a local NuGet restore source")
            XCTAssertFalse(contents.contains("dependency_overrides:"), "\(path) contains local Dart dependency overrides")
            XCTAssertFalse(contents.contains("/Users/"), "\(path) contains an absolute user path")
            XCTAssertFalse(contents.localizedCaseInsensitiveContains("codex"), "\(path) contains a Codex path/name")
            XCTAssertFalse(contents.contains("FishyJoes-public-export"), "\(path) contains this local checkout name")
        }
    }

    func testEmojiFunNativeNodePackagesUsePublishedRuntimeDependency() throws {
        let root = try repositoryRoot()

        for platform in ["macos", "ubuntu", "windows"] {
            let path = "Examples/EmojiFun/bindings/ts/generated/package.native-\(platform).json"
            let data = try Data(contentsOf: root.appendingPathComponent(path))
            let object = try XCTUnwrap(JSONSerialization.jsonObject(with: data) as? [String: Any])
            let dependencies = try XCTUnwrap(object["dependencies"] as? [String: String])

            XCTAssertEqual(
                dependencies["@cricut/fishyjoes-runtime-native-\(platform)"],
                "7.0.0",
                "\(path) should reference the published FishyJoes runtime version"
            )
        }
    }

    private func repositoryRoot() throws -> URL {
        var url = URL(fileURLWithPath: #filePath)
        while url.path != "/" {
            if FileManager.default.fileExists(atPath: url.appendingPathComponent("Package.swift").path),
               FileManager.default.fileExists(atPath: url.appendingPathComponent("Examples/EmojiFun").path)
            {
                return url
            }
            url.deleteLastPathComponent()
        }
        throw NSError(domain: "GeneratedPublicManifestTests", code: 1)
    }
}
