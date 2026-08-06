import Foundation
import SourceryDataModel
import SwiftParser
import SwiftSyntax

public enum ExportAnnotationDiagnostics {
    struct SourceFile: Hashable {
        let path: String
        let contents: String
    }

    struct AttachedAnnotation: Hashable {
        let declarationName: String
        let annotationText: String
        let exportName: String
        let kind: ExportAnnotation.Kind
    }

    struct Diagnostic: Equatable {
        let filePath: String
        let lineNumber: Int
        let exportName: String?
        let nearestDeclaration: String?
        let message: String
    }

    static func sourceFiles(in rootPath: String, excluding excludedPaths: [String]) throws -> [SourceFile] {
        let fileManager = FileManager.default
        let rootURL: URL
        if rootPath.hasPrefix("/") {
            rootURL = URL(fileURLWithPath: rootPath).standardizedFileURL
        } else {
            rootURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
                .appendingPathComponent(rootPath)
                .standardizedFileURL
        }
        guard let enumerator = fileManager.enumerator(
            at: rootURL,
            includingPropertiesForKeys: [.isRegularFileKey],
            options: [.skipsHiddenFiles]
        ) else {
            return []
        }

        let normalizedRootDisplayPath = normalizeRelativePath(rootPath).trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        let normalizedExcludes = excludedPaths.flatMap { excludedPath in
            let normalizedExclude = normalizeRelativePath(excludedPath)
            return [
                normalizedExclude,
                "\(normalizedRootDisplayPath)/\(normalizedExclude)",
            ]
        }
        var files: [SourceFile] = []
        for case let fileURL as URL in enumerator {
            guard fileURL.pathExtension == "swift" else { continue }
            let relativePath = displayPath(for: fileURL, rootURL: rootURL, rootDisplayPath: rootPath)
            guard !isExcluded(relativePath, excludedPaths: normalizedExcludes) else { continue }
            let contents = try String(contentsOf: fileURL, encoding: .utf8)
            files.append(.init(path: relativePath, contents: contents))
        }

        return files.sorted { $0.path < $1.path }
    }

    static func attachedAnnotations(in templateContext: SourceryTemplateContext) -> [AttachedAnnotation] {
        var annotations: [AttachedAnnotation] = []

        for function in templateContext.functions {
            appendAttachedAnnotation(from: function, declarationName: function.name, to: &annotations)
        }

        for type in templateContext.types {
            appendAttachedAnnotation(from: type, declarationName: type.name.unwrappedTypeName, to: &annotations)
            for method in type.methods {
                appendAttachedAnnotation(from: method, declarationName: method.name, to: &annotations)
            }
            for method in type.rawMethods {
                appendAttachedAnnotation(from: method, declarationName: method.name, to: &annotations)
            }
            for variable in type.computedVariables {
                appendAttachedAnnotation(from: variable, declarationName: variable.name, to: &annotations)
            }
            for variable in type.storedVariables {
                appendAttachedAnnotation(from: variable, declarationName: variable.name, to: &annotations)
            }
            for variable in type.rawVariables {
                appendAttachedAnnotation(from: variable, declarationName: variable.name, to: &annotations)
            }
            for enumCase in type.cases {
                appendAttachedAnnotation(from: enumCase, declarationName: enumCase.name, to: &annotations)
            }
        }

        return annotations
    }

    static func diagnostics(
        sourceFiles: [SourceFile],
        attachedAnnotations: [AttachedAnnotation]
    ) -> [Diagnostic] {
        let scannedAnnotations = sourceFiles.flatMap(scanAnnotations)
        var diagnostics = scannedAnnotations.compactMap(\.parseDiagnostic)

        let sourceAnnotationsByKey = Dictionary(grouping: scannedAnnotations.compactMap(\.parsed), by: \.key)
        let attachedCounts = Dictionary(
            grouping: attachedAnnotations,
            by: { AnnotationKey(annotationText: $0.annotationText, exportName: $0.exportName, kind: $0.kind) }
        ).mapValues(\.count)

        for (key, sourceAnnotations) in sourceAnnotationsByKey {
            let attachedCount = attachedCounts[key, default: 0]
            guard sourceAnnotations.count > attachedCount else { continue }

            let suppressedIDs = Set(
                sourceAnnotations
                    .sorted { lhs, rhs in
                        if lhs.isImmediatelyBeforeDeclaration != rhs.isImmediatelyBeforeDeclaration {
                            return lhs.isImmediatelyBeforeDeclaration && !rhs.isImmediatelyBeforeDeclaration
                        }
                        if lhs.filePath != rhs.filePath {
                            return lhs.filePath < rhs.filePath
                        }
                        return lhs.lineNumber < rhs.lineNumber
                    }
                    .prefix(attachedCount)
                    .map(\.id)
            )

            diagnostics.append(
                contentsOf: sourceAnnotations
                    .filter { !suppressedIDs.contains($0.id) }
                    .map(unrepresentedSourceAnnotationDiagnostic)
            )
        }

        return diagnostics.sorted {
            if $0.filePath != $1.filePath {
                return $0.filePath < $1.filePath
            }
            return $0.lineNumber < $1.lineNumber
        }
    }

    public static func warnMisplacedAnnotations(
        inSourceRoot sourceRoot: String,
        excluding excludedPaths: [String],
        templateContext: SourceryTemplateContext,
        context: FishyJoesContext
    ) throws {
        let diagnostics = diagnostics(
            sourceFiles: try sourceFiles(in: sourceRoot, excluding: excludedPaths),
            attachedAnnotations: attachedAnnotations(in: templateContext)
        )
        for diagnostic in diagnostics {
            context.warn(diagnostic.message)
        }
    }

    private struct AnnotationKey: Hashable {
        let annotationText: String
        let exportName: String
        let kind: ExportAnnotation.Kind
    }

    private struct ParsedSourceAnnotation {
        let id: String
        let filePath: String
        let lineNumber: Int
        let annotationText: String
        let exportName: String
        let kind: ExportAnnotation.Kind
        let nearestDeclaration: String?
        let isImmediatelyBeforeDeclaration: Bool
        let sourceAttachedDeclaration: String?

        var key: AnnotationKey {
            .init(annotationText: annotationText, exportName: exportName, kind: kind)
        }
    }

    private struct ScannedSourceAnnotation {
        let parsed: ParsedSourceAnnotation?
        let parseDiagnostic: Diagnostic?
    }

    private struct ParsedAnnotation {
        let annotationText: String
        let exportName: String
        let kind: ExportAnnotation.Kind
    }

    private static func appendAttachedAnnotation(
        from documented: any Documented,
        declarationName: String,
        to annotations: inout [AttachedAnnotation]
    ) {
        for docLine in documented.documentation {
            guard let parsed = parseAnnotation(from: docLine) else { continue }
            annotations.append(
                .init(
                    declarationName: declarationName,
                    annotationText: parsed.annotationText,
                    exportName: parsed.exportName,
                    kind: parsed.kind
                )
            )
        }
    }

    private static func scanAnnotations(in sourceFile: SourceFile) -> [ScannedSourceAnnotation] {
        let syntaxIndex = sourceSyntaxIndex(for: sourceFile)
        return sourceAnnotationLines(in: sourceFile.contents, filePath: sourceFile.path)
            .map { annotationLine in
                if let parsed = parseAnnotation(from: annotationLine.lineText) {
                    let parsedAnnotation = ParsedSourceAnnotation(
                        id: annotationLine.id,
                        filePath: sourceFile.path,
                        lineNumber: annotationLine.lineNumber,
                        annotationText: parsed.annotationText,
                        exportName: parsed.exportName,
                        kind: parsed.kind,
                        nearestDeclaration: syntaxIndex.nearestDeclaration(to: annotationLine.lineNumber)?.displayName,
                        isImmediatelyBeforeDeclaration: syntaxIndex.attachedAnnotationDeclarationsByID[annotationLine.id] != nil,
                        sourceAttachedDeclaration: syntaxIndex.attachedAnnotationDeclarationsByID[annotationLine.id]?.displayName
                    )
                    return .init(parsed: parsedAnnotation, parseDiagnostic: nil)
                }

                return .init(
                    parsed: nil,
                    parseDiagnostic: .init(
                        filePath: sourceFile.path,
                        lineNumber: annotationLine.lineNumber,
                        exportName: nil,
                        nearestDeclaration: syntaxIndex.nearestDeclaration(to: annotationLine.lineNumber)?.displayName,
                        message: "could not parse FishyJoes annotation at \(sourceFile.path):\(annotationLine.lineNumber); the annotation will be ignored. Use the form `/// <!-- FishyJoes.export(name) -->` immediately above the intended declaration."
                    )
                )
            }
    }

    private struct SourceAnnotationLine {
        let id: String
        let lineNumber: Int
        let lineText: String
    }

    private static func sourceAnnotationLines(
        in source: String,
        filePath: String
    ) -> [SourceAnnotationLine] {
        let tree = Parser.parse(source: source)
        let converter = SourceLocationConverter(fileName: filePath, tree: tree)
        let visitor = SourceAnnotationVisitor(
            filePath: filePath,
            locationConverter: converter
        )
        visitor.walk(tree)
        return visitor.annotations.sorted { lhs, rhs in
            if lhs.lineNumber != rhs.lineNumber {
                return lhs.lineNumber < rhs.lineNumber
            }
            return lhs.lineText < rhs.lineText
        }
    }

    private static func annotationLines(
        in trivia: Trivia,
        filePath: String,
        startingAt position: AbsolutePosition,
        locationConverter: SourceLocationConverter
    ) -> [SourceAnnotationLine] {
        var currentPosition = position
        var annotations: [SourceAnnotationLine] = []
        for piece in trivia {
            switch piece {
            case .docLineComment(let text):
                appendAnnotationLine(
                    from: text,
                    filePath: filePath,
                    lineNumber: locationConverter.location(for: currentPosition).line,
                    to: &annotations
                )
            case .docBlockComment(let text):
                let startLine = locationConverter.location(for: currentPosition).line
                for (offset, line) in text.components(separatedBy: .newlines).enumerated() {
                    appendAnnotationLine(
                        from: line,
                        filePath: filePath,
                        lineNumber: startLine + offset,
                        to: &annotations
                    )
                }
            default:
                break
            }
            currentPosition = currentPosition.advanced(by: piece.sourceLength.utf8Length)
        }
        return annotations
    }

    private static func appendAnnotationLine(
        from line: String,
        filePath: String,
        lineNumber: Int,
        to annotations: inout [SourceAnnotationLine]
    ) {
        guard looksLikeFishyJoesAnnotation(line) else { return }
        annotations.append(
            .init(
                id: annotationID(filePath: filePath, lineNumber: lineNumber, lineText: line),
                lineNumber: lineNumber,
                lineText: line
            )
        )
    }

    private static func annotationID(filePath: String, lineNumber: Int, lineText: String) -> String {
        "\(filePath):\(lineNumber):\(rawAnnotationText(in: lineText) ?? lineText.trimmingCharacters(in: .whitespaces))"
    }

    private final class SourceAnnotationVisitor: SyntaxVisitor {
        let filePath: String
        let locationConverter: SourceLocationConverter
        var annotations: [SourceAnnotationLine] = []

        init(filePath: String, locationConverter: SourceLocationConverter) {
            self.filePath = filePath
            self.locationConverter = locationConverter
            super.init(viewMode: .sourceAccurate)
        }

        override func visit(_ token: TokenSyntax) -> SyntaxVisitorContinueKind {
            annotations.append(
                contentsOf: annotationLines(
                    in: token.leadingTrivia,
                    filePath: filePath,
                    startingAt: token.position,
                    locationConverter: locationConverter
                )
            )
            annotations.append(
                contentsOf: annotationLines(
                    in: token.trailingTrivia,
                    filePath: filePath,
                    startingAt: token.endPositionBeforeTrailingTrivia,
                    locationConverter: locationConverter
                )
            )
            return .skipChildren
        }
    }

    private struct SourceSyntaxIndex {
        let declarations: [SourceDeclaration]
        let attachedAnnotationDeclarationsByID: [String: SourceDeclaration]

        func nearestDeclaration(to lineNumber: Int) -> SourceDeclaration? {
            declarations
                .filter { $0.lineNumber <= lineNumber }
                .max {
                    if $0.lineNumber != $1.lineNumber {
                        return $0.lineNumber < $1.lineNumber
                    }
                    return $0.displayName < $1.displayName
                }
        }
    }

    private struct SourceDeclaration {
        let displayName: String
        let lineNumber: Int
    }

    private static func sourceSyntaxIndex(for sourceFile: SourceFile) -> SourceSyntaxIndex {
        let tree = Parser.parse(source: sourceFile.contents)
        let converter = SourceLocationConverter(fileName: sourceFile.path, tree: tree)
        let visitor = SourceDeclarationVisitor(
            filePath: sourceFile.path,
            locationConverter: converter
        )
        visitor.walk(tree)
        return .init(
            declarations: visitor.declarations.sorted {
                if $0.lineNumber != $1.lineNumber {
                    return $0.lineNumber < $1.lineNumber
                }
                return $0.displayName < $1.displayName
            },
            attachedAnnotationDeclarationsByID: visitor.attachedAnnotationDeclarationsByID
        )
    }

    private final class SourceDeclarationVisitor: SyntaxVisitor {
        let filePath: String
        let locationConverter: SourceLocationConverter
        var declarations: [SourceDeclaration] = []
        var attachedAnnotationDeclarationsByID: [String: SourceDeclaration] = [:]

        init(filePath: String, locationConverter: SourceLocationConverter) {
            self.filePath = filePath
            self.locationConverter = locationConverter
            super.init(viewMode: .sourceAccurate)
        }

        override func visit(_ node: ActorDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: node.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: ClassDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: node.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: EnumDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: node.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: EnumCaseDeclSyntax) -> SyntaxVisitorContinueKind {
            guard let firstElement = node.elements.first else {
                return .visitChildren
            }
            recordDeclaration(name: firstElement.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: displayName(for: node), syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: InitializerDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: displayName(for: node), syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: ProtocolDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: node.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: StructDeclSyntax) -> SyntaxVisitorContinueKind {
            recordDeclaration(name: node.name.text, syntax: Syntax(node))
            return .visitChildren
        }

        override func visit(_ node: VariableDeclSyntax) -> SyntaxVisitorContinueKind {
            for binding in node.bindings {
                if let identifierPattern = binding.pattern.as(IdentifierPatternSyntax.self) {
                    recordDeclaration(name: identifierPattern.identifier.text, syntax: Syntax(node))
                    break
                }
            }
            return .visitChildren
        }

        private func recordDeclaration(name: String, syntax: Syntax) {
            let lineNumber = locationConverter.location(for: syntax.positionAfterSkippingLeadingTrivia).line
            let declaration = SourceDeclaration(displayName: name, lineNumber: lineNumber)
            declarations.append(declaration)
            let leadingTrivia = syntax.leadingTrivia.description
            guard !leadingTrivia.isEmpty else { return }
            for annotationLine in annotationLines(
                in: syntax.leadingTrivia,
                filePath: filePath,
                startingAt: syntax.position,
                locationConverter: locationConverter
            ) {
                attachedAnnotationDeclarationsByID[annotationLine.id] = declaration
            }
        }

        private func displayName(for node: FunctionDeclSyntax) -> String {
            let labels = node.signature.parameterClause.parameters.map { parameter -> String in
                let firstName = parameter.firstName.text
                if firstName == "_" {
                    return "_"
                }
                return firstName
            }
            if labels.isEmpty {
                return "\(node.name.text)()"
            }
            return "\(node.name.text)(\(labels.map { "\($0):" }.joined()))"
        }

        private func displayName(for node: InitializerDeclSyntax) -> String {
            let labels = node.signature.parameterClause.parameters.map { parameter -> String in
                let firstName = parameter.firstName.text
                if firstName == "_" {
                    return "_"
                }
                return firstName
            }
            if labels.isEmpty {
                return "init()"
            }
            return "init(\(labels.map { "\($0):" }.joined()))"
        }
    }

    private static func parseAnnotation(from line: String) -> ParsedAnnotation? {
        guard let rawAnnotation = rawAnnotationText(in: line) else { return nil }
        let nsString = rawAnnotation as NSString
        let pattern = try! NSRegularExpression(pattern: #"^<!--\s*FishyJoes\.([A-Za-z_][A-Za-z0-9_]*)\((.*)\)\s*-->$"#)
        guard let match = pattern.firstMatch(in: rawAnnotation, range: NSRange(location: 0, length: nsString.length)) else {
            return nil
        }

        let annotationName = nsString.substring(with: match.range(at: 1))
        guard let kind = ExportAnnotation.Kind(rawValue: annotationName) else {
            return nil
        }

        let parseString = nsString.substring(with: match.range(at: 2))
        guard let tree = ExportAnnotation.SimpleParse.parse(parseString) else {
            return nil
        }
        switch tree.first3 {
        case (.token(let name), nil, nil), (.token(let name), .comma, .some):
            return .init(annotationText: rawAnnotation, exportName: name, kind: kind)
        default:
            return nil
        }
    }

    private static func rawAnnotationText(in line: String) -> String? {
        guard let start = line.range(of: "<!--"),
              let end = line.range(of: "-->", range: start.upperBound ..< line.endIndex)
        else {
            return nil
        }
        let rawAnnotation = line[start.lowerBound ..< end.upperBound].trimmingCharacters(in: .whitespaces)
        guard rawAnnotation.contains("FishyJoes.") else { return nil }
        return rawAnnotation
    }

    private static func looksLikeFishyJoesAnnotation(_ line: String) -> Bool {
        line.contains("<!--") && line.contains("FishyJoes.")
    }

    private static func unrepresentedSourceAnnotationDiagnostic(for annotation: ParsedSourceAnnotation) -> Diagnostic {
        if let sourceAttachedDeclaration = annotation.sourceAttachedDeclaration {
            return sourceProviderMismatchDiagnostic(
                for: annotation,
                sourceAttachedDeclaration: sourceAttachedDeclaration
            )
        }
        return misplacedDiagnostic(for: annotation)
    }

    private static func sourceProviderMismatchDiagnostic(
        for annotation: ParsedSourceAnnotation,
        sourceAttachedDeclaration: String
    ) -> Diagnostic {
        let message = "\(annotation.annotationText) at \(annotation.filePath):\(annotation.lineNumber) is attached in Swift source to \(sourceAttachedDeclaration), but the current declaration provider did not report it. The annotation will be ignored until the declaration provider and source attachment agree."
        return .init(
            filePath: annotation.filePath,
            lineNumber: annotation.lineNumber,
            exportName: annotation.exportName,
            nearestDeclaration: sourceAttachedDeclaration,
            message: message
        )
    }

    private static func misplacedDiagnostic(for annotation: ParsedSourceAnnotation) -> Diagnostic {
        var message = "\(annotation.annotationText) at \(annotation.filePath):\(annotation.lineNumber) is not attached to a declaration and will be ignored. Move it immediately above the intended declaration."
        if let nearestDeclaration = annotation.nearestDeclaration {
            message += " Nearest declaration: \(nearestDeclaration)."
        }
        return .init(
            filePath: annotation.filePath,
            lineNumber: annotation.lineNumber,
            exportName: annotation.exportName,
            nearestDeclaration: annotation.nearestDeclaration,
            message: message
        )
    }

    private static func normalizeRelativePath(_ path: String) -> String {
        path.split(separator: "/").joined(separator: "/")
    }

    private static func isExcluded(_ path: String, excludedPaths: [String]) -> Bool {
        let normalizedPath = normalizeRelativePath(path)
        return excludedPaths.contains { excludedPath in
            normalizedPath == excludedPath || normalizedPath.hasPrefix("\(excludedPath)/")
        }
    }

    private static func displayPath(for fileURL: URL, rootURL: URL, rootDisplayPath: String) -> String {
        let rootPath = rootURL.path.hasSuffix("/") ? rootURL.path : "\(rootURL.path)/"
        let filePath = fileURL.standardizedFileURL.path
        let relativePath = filePath.hasPrefix(rootPath) ? String(filePath.dropFirst(rootPath.count)) : fileURL.lastPathComponent
        let normalizedRoot = rootDisplayPath.hasSuffix("/") ? String(rootDisplayPath.dropLast()) : rootDisplayPath
        return "\(normalizedRoot)/\(relativePath)"
    }
}
