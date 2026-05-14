@testable import FishyJoesCore
import Foundation
import SourceryDataModel
import XCTest

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

final class ExportAnnotationDiagnosticsTests: XCTestCase {
    func testValidMethodAnnotationHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.export(validMethod) -->
            public func validMethod() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "validMethod()",
                    annotationText: "<!-- FishyJoes.export(validMethod) -->",
                    exportName: "validMethod",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testValidPropertyAnnotationHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.export(validProperty) -->
            public var validProperty: Int { 1 }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "validProperty",
                    annotationText: "<!-- FishyJoes.export(validProperty) -->",
                    exportName: "validProperty",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testValidTypeAnnotationHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        /// <!-- FishyJoes.export(ValidType) -->
        public struct ValidType {}
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "ValidType",
                    annotationText: "<!-- FishyJoes.export(ValidType) -->",
                    exportName: "ValidType",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testValidAnnotationAboveAttributesAndMultilineFunctionHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.export(validGenericMethod) -->
            @available(macOS 13, *)
            public func validGenericMethod<T>(
                value: T,
                count: Int
            ) -> T {
                value
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "validGenericMethod(value:count:)",
                    annotationText: "<!-- FishyJoes.export(validGenericMethod) -->",
                    exportName: "validGenericMethod",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testValidEnumCaseAnnotationHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        public enum Fixture {
            /// <!-- FishyJoes.export(payload) -->
            case payload(value: Int)
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "payload",
                    annotationText: "<!-- FishyJoes.export(payload) -->",
                    exportName: "payload",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testSourceAttachedAnnotationMissingFromDeclarationProviderReportsMismatch() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.export(providerMismatch) -->
            public func providerMismatch() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Fixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 2)
        XCTAssertEqual(diagnostics[0].exportName, "providerMismatch")
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "providerMismatch()")
        XCTAssertTrue(diagnostics[0].message.contains("is attached in Swift source"))
        XCTAssertTrue(diagnostics[0].message.contains("current declaration provider did not report it"))
        XCTAssertFalse(diagnostics[0].message.contains("not attached to a declaration"))
    }

    func testAnnotationInsideMethodBodyReportsMisplacedDiagnostic() {
        let source = """
        public struct Fixture {
            public func misplacedExportExample() -> Int {
                /// <!-- FishyJoes.export(misplacedExportExample) -->
                return 1
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Fixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
        XCTAssertEqual(diagnostics[0].exportName, "misplacedExportExample")
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "misplacedExportExample()")
        XCTAssertTrue(diagnostics[0].message.contains("not attached to a declaration"))
        XCTAssertTrue(diagnostics[0].message.contains("Move it immediately above the intended declaration"))
    }

    func testAnnotationBetweenFunctionDeclarationAndBodyReportsMisplacedDiagnostic() {
        let source = """
        public struct Fixture {
            public func misplacedExportExample() -> Int
            /// <!-- FishyJoes.export(misplacedExportExample) -->
            {
                return 1
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "misplacedExportExample()")
    }

    func testAnnotationAfterDeclarationLineReportsMisplacedDiagnostic() {
        let source = """
        public struct Fixture {
            public func misplacedExportExample() -> Int {
                /// <!-- FishyJoes.export(misplacedExportExample) -->
                1
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "misplacedExportExample()")
    }

    func testUnrelatedProseWithoutFishyJoesAnnotationShapeHasNoDiagnostic() {
        let source = """
        public struct Fixture {
            /// This mentions FishyJoes export docs, but is not an annotation.
            public func validMethod() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testAnnotationTextInsideStringLiteralHasNoDiagnostic() {
        let source = #"""
        public struct Fixture {
            public let text = "/// <!-- FishyJoes.export(notAComment) -->"
        }
        """#

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testDisabledLineCommentAnnotationHasNoDiagnostic() {
        let source = """
        public struct Fixture {
            // /// <!-- FishyJoes.export(disabledExport) -->
            public func disabledExport() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testBlockCommentedAnnotationHasNoDiagnostic() {
        let source = """
        /*
        /// <!-- FishyJoes.export(blockCommentedExport) -->
        public func blockCommentedExport() {}
        */
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testValidBlockDocumentationAnnotationHasNoDiagnosticWhenAttachedBySourcery() {
        let source = """
        /**
         <!-- FishyJoes.export(validBlockDocMethod) -->
         */
        public func validBlockDocMethod() {}
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: [
                .init(
                    declarationName: "validBlockDocMethod()",
                    annotationText: "<!-- FishyJoes.export(validBlockDocMethod) -->",
                    exportName: "validBlockDocMethod",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics, [])
    }

    func testMisplacedBlockDocumentationAnnotationReportsMisplacedDiagnostic() {
        let source = """
        public struct Fixture {
            public func misplacedBlockDocMethod() {
                /**
                 <!-- FishyJoes.export(misplacedBlockDocMethod) -->
                 */
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].exportName, "misplacedBlockDocMethod")
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "misplacedBlockDocMethod()")
        XCTAssertTrue(diagnostics[0].message.contains("not attached to a declaration"))
    }

    func testTrailingAnnotationAfterDeclarationReportsDiagnostic() {
        let source = """
        public struct Fixture {
            public func trailingExport() {} /// <!-- FishyJoes.export(trailingExport) -->
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Fixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 2)
        XCTAssertEqual(diagnostics[0].exportName, "trailingExport")
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "trailingExport()")
        XCTAssertTrue(diagnostics[0].message.contains("not attached to a declaration"))
    }

    func testMisplacedAnnotationInsideMultilineFunctionReportsNearestDeclaration() {
        let source = """
        public struct Fixture {
            public func multilineNearestDeclaration(
                value: Int,
                scale: Double
            ) -> Int {
                /// <!-- FishyJoes.export(multilineNearestDeclaration) -->
                return value
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].lineNumber, 6)
        XCTAssertEqual(diagnostics[0].nearestDeclaration, "multilineNearestDeclaration(value:scale:)")
    }

    func testMalformedFishyJoesAnnotationReportsParseDiagnostic() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.export(malformed -->
            public func malformed() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Fixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 2)
        XCTAssertTrue(diagnostics[0].message.contains("could not parse FishyJoes annotation"))
        XCTAssertTrue(diagnostics[0].message.contains("will be ignored"))
    }

    func testUnknownFishyJoesAnnotationKindReportsParseDiagnosticWhenUnattached() {
        let source = """
        public struct Fixture {
            /// <!-- FishyJoes.exported(unknownKind) -->
            public func unknownKind() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [.init(path: "Fixture.swift", contents: source)],
            attachedAnnotations: []
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertTrue(diagnostics[0].message.contains("could not parse FishyJoes annotation"))
        XCTAssertTrue(diagnostics[0].message.contains("will be ignored"))
    }

    func testDuplicateAnnotationOnlyWarnsForUnattachedOccurrenceAcrossFiles() {
        let validSource = """
        public struct ValidFixture {
            /// <!-- FishyJoes.export(duplicateName) -->
            public func duplicateName() {}
        }
        """
        let misplacedSource = """
        public struct MisplacedFixture {
            public func duplicateName() {
                /// <!-- FishyJoes.export(duplicateName) -->
            }
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [
                .init(path: "Sources/ValidFixture.swift", contents: validSource),
                .init(path: "Sources/MisplacedFixture.swift", contents: misplacedSource),
            ],
            attachedAnnotations: [
                .init(
                    declarationName: "duplicateName()",
                    annotationText: "<!-- FishyJoes.export(duplicateName) -->",
                    exportName: "duplicateName",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Sources/MisplacedFixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
    }

    func testDuplicateAnnotationPrefersAttachedDeclarationWithAttribute() {
        let misplacedSource = """
        public struct MisplacedFixture {
            public func duplicateName() {
                /// <!-- FishyJoes.export(duplicateName) -->
            }
        }
        """
        let validSource = """
        public struct ValidFixture {
            /// <!-- FishyJoes.export(duplicateName) -->
            @available(*, deprecated)
            public func duplicateName() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [
                .init(path: "Sources/A_MisplacedFixture.swift", contents: misplacedSource),
                .init(path: "Sources/Z_ValidFixture.swift", contents: validSource),
            ],
            attachedAnnotations: [
                .init(
                    declarationName: "duplicateName()",
                    annotationText: "<!-- FishyJoes.export(duplicateName) -->",
                    exportName: "duplicateName",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Sources/A_MisplacedFixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
    }

    func testDuplicateAnnotationPrefersAttachedDeclarationWithMultilineAttribute() {
        let misplacedSource = """
        public struct MisplacedFixture {
            public func duplicateName() {
                /// <!-- FishyJoes.export(duplicateName) -->
            }
        }
        """
        let validSource = """
        public struct ValidFixture {
            /// <!-- FishyJoes.export(duplicateName) -->
            @available(
                *,
                deprecated
            )
            public func duplicateName() {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [
                .init(path: "Sources/A_MisplacedFixture.swift", contents: misplacedSource),
                .init(path: "Sources/Z_ValidFixture.swift", contents: validSource),
            ],
            attachedAnnotations: [
                .init(
                    declarationName: "duplicateName()",
                    annotationText: "<!-- FishyJoes.export(duplicateName) -->",
                    exportName: "duplicateName",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Sources/A_MisplacedFixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
    }

    func testDuplicateAnnotationPrefersAttachedMultilineFunctionDeclaration() {
        let misplacedSource = """
        public struct MisplacedFixture {
            public func duplicateName(value: Int) {
                /// <!-- FishyJoes.export(duplicateName) -->
            }
        }
        """
        let validSource = """
        public struct ValidFixture {
            /// <!-- FishyJoes.export(duplicateName) -->
            public func duplicateName(
                value: Int
            ) {}
        }
        """

        let diagnostics = ExportAnnotationDiagnostics.diagnostics(
            sourceFiles: [
                .init(path: "Sources/A_MisplacedFixture.swift", contents: misplacedSource),
                .init(path: "Sources/Z_ValidFixture.swift", contents: validSource),
            ],
            attachedAnnotations: [
                .init(
                    declarationName: "duplicateName(value:)",
                    annotationText: "<!-- FishyJoes.export(duplicateName) -->",
                    exportName: "duplicateName",
                    kind: .unmodified
                ),
            ]
        )

        XCTAssertEqual(diagnostics.count, 1)
        XCTAssertEqual(diagnostics[0].filePath, "Sources/A_MisplacedFixture.swift")
        XCTAssertEqual(diagnostics[0].lineNumber, 3)
    }

    func testSourceFileScanHonorsExcludedPathsRelativeToSourceRoot() throws {
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("fishyjoes-export-annotation-excludes-\(UUID().uuidString)", isDirectory: true)
        let sources = root.appendingPathComponent("Sources", isDirectory: true)
        let excluded = sources.appendingPathComponent("Excluded", isDirectory: true)
        try FileManager.default.createDirectory(at: excluded, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: root)
        }

        try "public struct Included {}"
            .write(to: sources.appendingPathComponent("Included.swift"), atomically: true, encoding: .utf8)
        try "public struct Skipped {}"
            .write(to: excluded.appendingPathComponent("Skipped.swift"), atomically: true, encoding: .utf8)

        let previousDirectory = FileManager.default.currentDirectoryPath
        FileManager.default.changeCurrentDirectoryPath(root.path)
        defer {
            FileManager.default.changeCurrentDirectoryPath(previousDirectory)
        }

        let files = try ExportAnnotationDiagnostics.sourceFiles(in: "Sources/", excluding: ["Excluded"])

        XCTAssertEqual(files.map(\.path), ["Sources/Included.swift"])
    }

    func testWarningHelperReportsMisplacedAnnotationFromSourceFile() throws {
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("fishyjoes-export-annotation-diagnostics-\(UUID().uuidString)", isDirectory: true)
        let sources = root.appendingPathComponent("Sources", isDirectory: true)
        try FileManager.default.createDirectory(at: sources, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: root)
        }

        let source = """
        public struct Fixture {
            public func normalUnit(at t: Double) -> Fixture? {
                /// <!-- FishyJoes.export(normalUnitLineAt) -->
                return nil
            }
        }
        """
        try source.write(
            to: sources.appendingPathComponent("Fixture.swift"),
            atomically: true,
            encoding: .utf8
        )

        let templateContext = try JSONDecoder().decode(
            SourceryTemplateContext.self,
            from: Data(#"{"types":[],"functions":[]}"#.utf8)
        )
        let context = FishyJoesContext(
            context: templateContext,
            module: "Fixture",
            requiredModulePaths: [:],
            extraDynamicLibraries: []
        )

        let previousDirectory = FileManager.default.currentDirectoryPath
        FileManager.default.changeCurrentDirectoryPath(root.path)
        defer {
            FileManager.default.changeCurrentDirectoryPath(previousDirectory)
        }

        let stderr = try captureStandardError {
            try ExportAnnotationDiagnostics.warnMisplacedAnnotations(
                inSourceRoot: "Sources/",
                excluding: [],
                templateContext: templateContext,
                context: context
            )
        }

        XCTAssertTrue(stderr.contains("WARNING:"))
        XCTAssertTrue(stderr.contains("Sources/Fixture.swift:3"))
        XCTAssertTrue(stderr.contains("normalUnitLineAt"))
        XCTAssertTrue(stderr.contains("not attached to a declaration"))
        XCTAssertTrue(stderr.contains("Move it immediately above the intended declaration"))
        XCTAssertTrue(stderr.contains("Nearest declaration: normalUnit(at:)."))
    }

    private func captureStandardError(_ body: () throws -> Void) throws -> String {
        let pipe = Pipe()
        let originalStderr = dup(STDERR_FILENO)
        XCTAssertNotEqual(originalStderr, -1)
        fflush(stderr)
        dup2(pipe.fileHandleForWriting.fileDescriptor, STDERR_FILENO)
        do {
            try body()
            fflush(stderr)
            dup2(originalStderr, STDERR_FILENO)
            close(originalStderr)
            pipe.fileHandleForWriting.closeFile()
            return String(data: pipe.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
        } catch {
            fflush(stderr)
            dup2(originalStderr, STDERR_FILENO)
            close(originalStderr)
            pipe.fileHandleForWriting.closeFile()
            _ = pipe.fileHandleForReading.readDataToEndOfFile()
            throw error
        }
    }
}
