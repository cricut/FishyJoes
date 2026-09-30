@testable import FishyJoesExecute
import XCTest

class FileTemplaterTests: XCTestCase {
    private func makeTemplater(extraSetupSteps: String?) throws -> FileTemplater {
        let config = ProjectConfig(
            module: "TestModule",
            publishRepository: nil,
            requiredModules: [],
            extraDynamicLibraries: [],
            excludeSources: [],
            ciPreBuildHook: nil,
            ciPostBuildHook: nil,
            flexibleVersions: false,
            sourceryOverride: nil,
            ciRunners: nil,
            ciDependencyAuth: ProjectConfig.CIDependencyAuth(user: "builduser", token: "${{ secrets.GIT_TOKEN }}"),
            ciExtraSetupSteps: extraSetupSteps
        )
        return try FileTemplater(config: config, phasesList: [], swiftPackage: nil, includeFilesNotMarkedAsGenerated: false)
    }

    func testGitStepsWithoutExtraSetupStepsEndAtCheckout() throws {
        let steps = try XCTUnwrap(makeTemplater(extraSetupSteps: nil).templateReplacements["__CI_GIT_STEPS__"])

        XCTAssertTrue(steps.hasSuffix("token: '${{ secrets.GIT_TOKEN }}'"), "unexpected steps:\n\(steps)")
    }

    func testExtraSetupStepsFollowCheckoutAndKeepRelativeIndentation() throws {
        let extra = """

              - name: Log in to the package registry
                run: swift package-registry login https://registry.example.com --token ${{ secrets.REGISTRY_TOKEN }}
              - uses: example/setup-thing@v1
                with:
                  key: value

        """
        let steps = try XCTUnwrap(makeTemplater(extraSetupSteps: extra).templateReplacements["__CI_GIT_STEPS__"])

        let expectedSuffix = """
              - name: Checkout
                uses: actions/checkout@v6
                with:
                  submodules: recursive
                  token: '${{ secrets.GIT_TOKEN }}'

              - name: Log in to the package registry
                run: swift package-registry login https://registry.example.com --token ${{ secrets.REGISTRY_TOKEN }}
              - uses: example/setup-thing@v1
                with:
                  key: value
        """
        XCTAssertTrue(steps.hasSuffix(expectedSuffix), "unexpected steps:\n\(steps)")
    }

    func testExtraSetupStepsMustBeASequenceOfStepMappings() throws {
        let root = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: root.appendingPathComponent("bindings"), withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: root) }

        let configPath = root.appendingPathComponent("bindings/fishy-joes.yaml")
        try "module: TestModule\nCIExtraSetupSteps: |\n  run: not a sequence\n".write(to: configPath, atomically: true, encoding: .utf8)
        XCTAssertThrowsError(try ProjectConfig.readFromFile(basePath: root.path))

        try "module: TestModule\nCIExtraSetupSteps: |\n  - name: ok\n    run: echo ok\n".write(to: configPath, atomically: true, encoding: .utf8)
        let config = try ProjectConfig.readFromFile(basePath: root.path)
        XCTAssertEqual(config.ciExtraSetupSteps?.trimmingCharacters(in: .newlines), "- name: ok\n  run: echo ok")
    }
}
