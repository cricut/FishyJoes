@testable import FishyJoesExecute
import Foundation
import XCTest
import Yams

class WorkflowTemplateTests: XCTestCase {
    let templates = URL(fileURLWithPath: #filePath)
        .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        .appendingPathComponent("Sources/FishyJoesExecute/Resources/bindings-template/workflows")

    func render(_ language: String, config yaml: String) throws -> String {
        let package = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString).path
        defer { try? FileManager.default.removeItem(atPath: package) }
        try FileManager.default.createDirectory(atPath: "\(package)/bindings", withIntermediateDirectories: true)
        FileManager.default.createFile(atPath: "\(package)/bindings/fishy-joes.yaml", contents: Data(yaml.utf8))
        let templater = try FileTemplater(
            config: ProjectConfig.readFromFile(basePath: package),
            phasesList: [],
            swiftPackage: nil,
            includeFilesNotMarkedAsGenerated: false
        )
        let template = try String(contentsOf: templates.appendingPathComponent("__TEMPLATE_CAPS__-\(language).yaml"), encoding: .utf8)
        let workflow = templater.processString(template)
        if let directory = ProcessInfo.processInfo.environment["FISHYJOES_RENDERED_WORKFLOWS"] {
            let name = yaml.contains("packagePath") ? "package" : "root"
            try workflow.write(toFile: "\(directory)/\(name)-\(language).yaml", atomically: true, encoding: .utf8)
        }
        return workflow
    }

    func assertValid(_ workflow: String, file: StaticString = #filePath, line: UInt = #line) throws {
        XCTAssertNil(workflow.range(of: "__[A-Z][A-Z0-9_]*__", options: .regularExpression), workflow, file: file, line: line)
        XCTAssertNotNil(try Yams.load(yaml: workflow) as? [String: Any], file: file, line: line)
    }

    func testPackageWorkflows() throws {
        let config = """
        module: Hydrogen
        publishRepository: github.com/cricut/Bifrost
        packagePath: Packages/Hydrogen
        tagPrefix: hydrogen/
        """
        for language in ["dart", "kotlin"] {
            let workflow = try render(language, config: config)
            try assertValid(workflow)
            XCTAssertTrue(workflow.contains("      local-dependencies:\n"), language)
            XCTAssertTrue(workflow.contains("pattern: 'Hydrogen-*_lib"), language)
        }
        XCTAssertTrue(try render("kotlin", config: config).contains("name: Hydrogen-maven-local\n"))
    }

    func testRootWorkflows() throws {
        let config = """
        module: TestAPI
        publishRepository: github.com/cricut/FishyJoes
        """
        for language in ["dart", "kotlin"] {
            let workflow = try render(language, config: config)
            try assertValid(workflow)
            XCTAssertFalse(workflow.contains("local-dependencies"), language)
        }
    }

    func testSkippedPullRequestBranches() throws {
        for (config, skipped) in [
            (
                "module: TestAPI\npublishRepository: github.com/cricut/FishyJoes\n",
                "!(github.event_name == 'pull_request' && startsWith(github.head_ref, 'package-releases/'))"
            ),
            // The release workflow calls the workflows of a package for its own pull requests.
            (
                "module: Hydrogen\npublishRepository: github.com/cricut/Bifrost\npackagePath: Packages/Hydrogen\ntagPrefix: hydrogen/\n",
                "!(github.event_name == 'pull_request' && !inputs.stage && startsWith(github.head_ref, 'package-releases/'))"
            ),
        ] {
            for language in ["dart", "kotlin"] {
                let workflow = try render(language, config: config + "CISkipPullRequestBranchPrefix: package-releases/\n")
                try assertValid(workflow)
                let jobs = try XCTUnwrap((try Yams.load(yaml: workflow) as? [String: Any])?["jobs"] as? [String: [String: Any]])
                for (name, job) in jobs {
                    let condition = try XCTUnwrap(job["if"] as? String, "\(language) \(name)")
                    XCTAssertTrue(
                        condition.contains(skipped),
                        "\(language) \(name): \(condition)"
                    )
                }
            }
        }
    }
}
