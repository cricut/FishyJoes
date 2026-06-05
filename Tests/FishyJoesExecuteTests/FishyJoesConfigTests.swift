@testable import FishyJoesExecute
import XCTest

class FishyJoesConfigTests: XCTestCase {
    func testPythonPackageNamesDefaultFromModuleName() throws {
        let config = try readConfig(
            """
            module: TestAPI
            """
        )

        XCTAssertEqual(config.python.distributionName(forModule: config.module), "testapi")
        XCTAssertEqual(config.python.importPackageName(forModule: config.module), "testapi")
        XCTAssertEqual(config.python.runtimeDistributionName, "fishyjoes-runtime")
    }

    func testPythonPackageNamesCanBeConfiguredForNonCricutLibraries() throws {
        let config = try readConfig(
            """
            module: FancyLibrary
            requiredModules:
              - SharedSwift
            python:
              distributionName: acme-fancy-library
              importPackageName: acme_fancy_library
              runtimeDistributionName: acme-fishyjoes-runtime
              dependencies:
                SharedSwift:
                  distributionName: shared-swift-bindings
                  importPackageName: shared_swift_bindings
            """
        )

        XCTAssertEqual(config.python.distributionName(forModule: config.module), "acme-fancy-library")
        XCTAssertEqual(config.python.importPackageName(forModule: config.module), "acme_fancy_library")
        XCTAssertEqual(config.python.runtimeDistributionName, "acme-fishyjoes-runtime")
        XCTAssertEqual(config.python.dependencyDistributionName(forModule: "SharedSwift"), "shared-swift-bindings")
        XCTAssertEqual(config.python.dependencyImportPackageName(forModule: "SharedSwift"), "shared_swift_bindings")
    }

    func testInvalidPythonImportPackageNameFailsLoudly() throws {
        XCTAssertThrowsError(
            try readConfig(
                """
                module: FancyLibrary
                python:
                  importPackageName: acme-fancy-library
                """
            )
        ) { error in
            XCTAssertTrue(String(describing: error).contains("python.importPackageName"))
        }
    }

    func testInvalidPythonDistributionNameFailsLoudly() throws {
        XCTAssertThrowsError(
            try readConfig(
                """
                module: FancyLibrary
                python:
                  distributionName: -acme-fancy-library
                """
            )
        ) { error in
            XCTAssertTrue(String(describing: error).contains("python.distributionName"))
        }
    }

    func testPythonPhaseUsesConfiguredDistributionAndImportNames() throws {
        let config = try readConfig(
            """
            module: FancyLibrary
            requiredModules:
              - SharedSwift
            python:
              distributionName: acme-fancy-library
              importPackageName: acme_fancy_library
              runtimeDistributionName: acme-fishyjoes-runtime
              dependencies:
                SharedSwift:
                  distributionName: shared-swift-bindings
                  importPackageName: shared_swift_bindings
            """
        )
        let options = CodeGen()
        options.config = config
        options.version = "1.2.3"

        let replacements = try PythonPhases(platform: .python, options: options)
            .generationPhaseTemplateReplacements()

        XCTAssertEqual(replacements["__PYTHON_DISTRIBUTION_NAME__"], "acme-fancy-library")
        XCTAssertEqual(replacements["__PYTHON_IMPORT_PACKAGE__"], "acme_fancy_library")
        XCTAssertEqual(replacements["__PYTHON_RUNTIME_DISTRIBUTION_NAME__"], "acme-fishyjoes-runtime")
        XCTAssertTrue(replacements["__PYTHON_DEPENDENCIES__"]?.contains(#""shared-swift-bindings>=0.0.1","#) == true)
        XCTAssertTrue(replacements["__PYTHON_RUNTIME_DEPENDENCIES__"]?.contains(#"import_name="shared_swift_bindings""#) == true)
    }

    func testPythonPhaseUsesSwiftPMFlexibleVersionRequirements() throws {
        let config = try readConfig(
            """
            module: FancyLibrary
            requiredModules:
              - SharedSwift
            flexibleVersions: true
            python:
              dependencies:
                SharedSwift:
                  distributionName: shared-swift-bindings
                  importPackageName: shared_swift_bindings
            """
        )
        let options = CodeGen()
        options.config = config
        options.version = "0.5.0"
        options.packageInfo = SwiftPackage(
            dependencies: [
                .sourceControl(
                    identity: "sharedswift",
                    location: URL(string: "https://github.com/example/SharedSwift")!,
                    requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 0, minor: 5, patch: 0))
                ),
            ],
            targets: []
        )

        let replacements = try PythonPhases(platform: .python, options: options)
            .generationPhaseTemplateReplacements()

        XCTAssertTrue(replacements["__PYTHON_DEPENDENCIES__"]?.contains(#""shared-swift-bindings>=0.5.0,<1.0.0","#) == true)
        XCTAssertTrue(replacements["__PYTHON_RUNTIME_DEPENDENCIES__"]?.contains(#"version_requirement=">=0.5.0,<1.0.0""#) == true)
    }

    func testPackageInitInstallsPythonExampleTestWithConfiguredImportName() throws {
        let config = try readConfig(
            """
            module: FancyLibrary
            python:
              importPackageName: acme_fancy_library
            """
        )
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("fishyjoes-python-template-tests-\(UUID().uuidString)", isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: root)
        }

        let previousDirectory = FileManager.default.currentDirectoryPath
        FileManager.default.changeCurrentDirectoryPath(root.path)
        defer {
            FileManager.default.changeCurrentDirectoryPath(previousDirectory)
        }

        let templater = try FileTemplater(
            config: config,
            phasesList: [],
            swiftPackage: nil,
            includeFilesNotMarkedAsGenerated: true
        )
        try templater.installTemplate()

        let exampleTestPath = root
            .appendingPathComponent("bindings/python/tests/test_example.py")
        let contents = try String(contentsOf: exampleTestPath)
        XCTAssertTrue(contents.contains("import acme_fancy_library as bindings"))
        XCTAssertTrue(contents.contains("class ExampleTests(unittest.TestCase):"))

        let pyprojectPath = root
            .appendingPathComponent("bindings/python/generated/pyproject.toml")
        let pyproject = try String(contentsOf: pyprojectPath)
        XCTAssertFalse(pyproject.contains("__PYTHON_"))
        XCTAssertTrue(pyproject.contains(#"version = "0.0.1""#))
        XCTAssertTrue(pyproject.contains(#""fishyjoes-runtime>=0.0.1","#))

        let nativePath = root
            .appendingPathComponent("bindings/python/generated/src/acme_fancy_library/_native.py")
        let native = try String(contentsOf: nativePath)
        XCTAssertFalse(native.contains("__PYTHON_"))
        XCTAssertTrue(native.contains(#"register_types_symbol="FishyJoes_FancyLibrary_registerTypes""#))
    }

    func testPackageInitUsesPythonPhaseDependencyReplacements() throws {
        let config = try readConfig(
            """
            module: FancyLibrary
            requiredModules:
              - SharedSwift
            python:
              distributionName: acme-fancy-library
              importPackageName: acme_fancy_library
              dependencies:
                SharedSwift:
                  distributionName: shared-swift-bindings
                  importPackageName: shared_swift_bindings
            """
        )
        let options = CodeGen()
        options.config = config
        options.version = "2.3.4"
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("fishyjoes-python-dependency-template-tests-\(UUID().uuidString)", isDirectory: true)
        try FileManager.default.createDirectory(at: root, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: root)
        }

        let previousDirectory = FileManager.default.currentDirectoryPath
        FileManager.default.changeCurrentDirectoryPath(root.path)
        defer {
            FileManager.default.changeCurrentDirectoryPath(previousDirectory)
        }

        let templater = try FileTemplater(
            config: config,
            phasesList: [PythonPhases(platform: .python, options: options)],
            swiftPackage: nil,
            includeFilesNotMarkedAsGenerated: true
        )
        try templater.installTemplate()

        let pyprojectPath = root
            .appendingPathComponent("bindings/python/generated/pyproject.toml")
        let pyproject = try String(contentsOf: pyprojectPath)
        XCTAssertFalse(pyproject.contains("__PYTHON_"))
        XCTAssertTrue(pyproject.contains(#"version = "2.3.4""#))
        XCTAssertTrue(pyproject.contains(#""shared-swift-bindings>=0.0.1","#))

        let nativePath = root
            .appendingPathComponent("bindings/python/generated/src/acme_fancy_library/_native.py")
        let native = try String(contentsOf: nativePath)
        XCTAssertFalse(native.contains("__PYTHON_"))
        XCTAssertTrue(native.contains(#"import_name="shared_swift_bindings""#))
    }

    private func readConfig(_ yaml: String) throws -> ProjectConfig {
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString, isDirectory: true)
        let bindings = root.appendingPathComponent("bindings", isDirectory: true)
        try FileManager.default.createDirectory(at: bindings, withIntermediateDirectories: true)
        try yaml.write(
            to: bindings.appendingPathComponent("fishy-joes.yaml"),
            atomically: true,
            encoding: .utf8
        )
        return try ProjectConfig.readFromFile(basePath: root.path)
    }
}
