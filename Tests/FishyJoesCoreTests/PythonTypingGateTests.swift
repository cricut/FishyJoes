@testable import FishyJoesCore
import Foundation
import SourceryDataModel
import XCTest

final class PythonTypingGateTests: XCTestCase {
    private func emptyContext() throws -> FishyJoesContext {
        let templateContext = try JSONDecoder().decode(
            SourceryTemplateContext.self,
            from: Data(#"{"types":[],"functions":[]}"#.utf8)
        )
        return FishyJoesContext(
            context: templateContext,
            module: "Fixture",
            requiredModulePaths: [:],
            extraDynamicLibraries: []
        )
    }

    private func pythonClass(
        _ className: String,
        setupKind: String?,
        fields: [PythonTranslator.NativeField] = [],
        enumCases: [PythonTranslator.NativeEnumCase] = []
    ) -> PythonTranslator.PythonClass {
        let moduleName = PythonNaming.moduleName(className)
        return PythonTranslator.PythonClass(
            originName: className,
            moduleName: moduleName,
            fileName: "fixture/\(moduleName).py",
            className: className,
            setupName: nil,
            setupKind: setupKind,
            equalsSymbol: nil,
            hashSymbol: nil,
            isValueHashable: false,
            storedFields: [],
            enumCases: enumCases,
            fields: fields,
            methods: [],
            documentation: []
        )
    }

    private func staticField(
        _ pythonName: String,
        settable: Bool = false,
        deprecated: Bool = false,
        asMethod: Bool = false
    ) -> PythonTranslator.NativeField {
        PythonTranslator.NativeField(
            pythonName: pythonName,
            isExplicitPythonName: false,
            cName: pythonName,
            symbol: "__iota_get_Fixture_\(pythonName)",
            setterSymbol: settable ? "__iota_set_Fixture_\(pythonName)" : nil,
            isStatic: true,
            asMethod: asMethod,
            returnType: "intptr_t",
            returnConversion: nil,
            pythonReturnType: PythonType(annotation: "int"),
            deprecationMessage: deprecated ? "use something else" : nil,
            originName: "Fixture.\(pythonName)",
            documentation: []
        )
    }

    private func enumCase(_ name: String, ofClass className: String, associatedValueCount: Int) -> PythonTranslator.NativeEnumCase {
        let values = (0..<associatedValueCount).map { index in
            PythonTranslator.NativeEnumCaseValue(
                pythonName: "value\(index)",
                cName: "value\(index)",
                cType: "intptr_t",
                conversion: nil,
                pythonType: PythonType(annotation: "int")
            )
        }
        return PythonTranslator.NativeEnumCase(
            pythonName: name,
            cName: name,
            className: "\(className)_\(upperCaseFirst(name))",
            values: values,
            documentation: []
        )
    }

    // The residue rules are validated against TestAPI's ground truth: running
    // `mypy.stubtest testapi --concise` with no allowlist reports exactly the
    // entries the fixtures below model (a keyword-named associated-enum case
    // set via setattr, and the three metaclass asymmetries).
    func testAllowlistEntriesComputedFromTranslatedModel() {
        let classes = [
            // A `None` case cannot be declared in a stub (keyword); the runtime
            // sets it via setattr, so it is reported as absent from the stub.
            pythonClass(
                "AssociatedDataEnum",
                setupKind: "enum",
                enumCases: [
                    enumCase("thing", ofClass: "AssociatedDataEnum", associatedValueCount: 1),
                    enumCase("none", ofClass: "AssociatedDataEnum", associatedValueCount: 0),
                ]
            ),
            // Settable statics synthesize a runtime metaclass the stub does not
            // declare (the stub models them as plain ClassVar attributes).
            pythonClass("Methods", setupKind: "reference", fields: [staticField("static_modifiable", settable: true)]),
            // A deprecated read-only static renders on a synthesized stub
            // metaclass, while at runtime it stays a class-body descriptor:
            // both the metaclass mismatch and the member surface as residue.
            pythonClass("Deprecations", setupKind: "reference", fields: [staticField("deprecated_variable", deprecated: true)]),
            // Read-only, non-deprecated statics are honest on both sides
            // (ClassVar in the stub, descriptor at runtime) and leave no residue.
            pythonClass("Strings", setupKind: "reference", fields: [staticField("simple")]),
            // stubtest skips metaclass verification for enum stubs entirely, so
            // a simple enum's settable static contributes no class entry.
            pythonClass(
                "SimpleEnum",
                setupKind: "enum",
                fields: [staticField("current", settable: true)],
                enumCases: [enumCase("red", ofClass: "SimpleEnum", associatedValueCount: 0)]
            ),
            // A deprecated settable static appears on a synthesized metaclass on
            // BOTH sides, so stubtest has nothing to report for it.
            pythonClass("Both", setupKind: "reference", fields: [staticField("legacy", settable: true, deprecated: true)]),
        ]

        XCTAssertEqual(
            PythonTranslator.stubtestAllowlistEntries(for: classes, importPackageName: "fixture"),
            [
                "fixture.associated_data_enum.AssociatedDataEnum.None",
                "fixture.deprecations.Deprecations",
                "fixture.deprecations.Deprecations.deprecated_variable",
                "fixture.methods.Methods",
            ]
        )
    }

    func testSetupFragmentsEmitTypingGateFiles() throws {
        let context = try emptyContext()
        let fragments = PythonTranslator().setupFragments(context: context, generatedTypes: [])

        let allowlist = fragments.first { $0.destinationPath == "python/generated/tests/stubtest_allowlist.txt" }
        let gateTest = fragments.first { $0.destinationPath == "python/generated/tests/test_generated_typing_gates.py" }
        let allowlistContents = try XCTUnwrap(allowlist).contents
        let gateTestContents = try XCTUnwrap(gateTest).contents
        let requirementsContents = try XCTUnwrap(requirements).contents

        XCTAssertTrue(allowlistContents.hasPrefix("# THIS FILE IS AUTOMATICALLY GENERATED"))
        XCTAssertTrue(gateTestContents.hasPrefix("# THIS FILE IS AUTOMATICALLY GENERATED"))

        // The gate owns its checker toolchain: it emits its own pinned dev
        // requirements so the test phase can install them regardless of the
        // package's (once-installed, not-regenerated) requirements-dev.txt.
        XCTAssertTrue(requirementsContents.contains("mypy=="))
        XCTAssertTrue(requirementsContents.contains("pyright=="))

        // The gate module is templated with the import package name and runs
        // the three checkers; the stubtest run is strict (an unused allowlist
        // entry fails the gate rather than being silently tolerated).
        XCTAssertTrue(gateTestContents.contains("_IMPORT_PACKAGE = \"fixture\""))
        XCTAssertTrue(gateTestContents.contains("class GeneratedTypingGateTests(unittest.TestCase):"))
        XCTAssertTrue(gateTestContents.contains("mypy.stubtest"))
        XCTAssertTrue(gateTestContents.contains("--allowlist"))
        // Mentioned in a comment, but never passed as an argument.
        XCTAssertFalse(gateTestContents.contains("\"--ignore-unused-allowlist\""))
        XCTAssertTrue(gateTestContents.contains("--verifytypes"))
        XCTAssertTrue(gateTestContents.contains("stubtest_allowlist.local.txt"))
    }
}
