import Foundation
import SourceryDataModel

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
                    .map(misplacedDiagnostic)
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
        let lines = sourceFile.contents.components(separatedBy: .newlines)
        var scanned: [ScannedSourceAnnotation] = []
        var nearestDeclaration: String?
        var blockCommentDepth = 0
        for index in lines.indices {
            let line = lines[index]
            let trimmedLine = line.trimmingCharacters(in: .whitespaces)
            let isInsideBlockComment = blockCommentDepth > 0
            if !isInsideBlockComment, trimmedLine.hasPrefix("///"), let parsed = parseAnnotation(from: line) {
                scanned.append(
                    .init(
                        parsed: .init(
                            id: "\(sourceFile.path):\(index + 1)",
                            filePath: sourceFile.path,
                            lineNumber: index + 1,
                            annotationText: parsed.annotationText,
                            exportName: parsed.exportName,
                            kind: parsed.kind,
                            nearestDeclaration: nearestDeclaration,
                            isImmediatelyBeforeDeclaration: isImmediatelyBeforeDeclaration(
                                at: index,
                                in: lines
                            )
                        ),
                        parseDiagnostic: nil
                    )
                )
            } else if !isInsideBlockComment, trimmedLine.hasPrefix("///"), looksLikeFishyJoesAnnotation(line) {
                scanned.append(
                    .init(
                        parsed: nil,
                        parseDiagnostic: .init(
                            filePath: sourceFile.path,
                            lineNumber: index + 1,
                            exportName: nil,
                            nearestDeclaration: nearestDeclaration,
                            message: "could not parse FishyJoes annotation at \(sourceFile.path):\(index + 1); the annotation will be ignored. Use the form `/// <!-- FishyJoes.export(name) -->` immediately above the intended declaration."
                        )
                    )
                )
            }

            if !isInsideBlockComment, let declaration = declarationName(in: line) {
                nearestDeclaration = declaration
            }
            blockCommentDepth = updatedBlockCommentDepth(blockCommentDepth, afterScanning: line)
        }

        return scanned
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

    private static func updatedBlockCommentDepth(_ depth: Int, afterScanning line: String) -> Int {
        var depth = depth
        var remaining = line[...]
        while let nextOpen = remaining.range(of: "/*"), let nextClose = remaining.range(of: "*/") {
            if nextOpen.lowerBound < nextClose.lowerBound {
                depth += 1
                remaining = remaining[nextOpen.upperBound...]
            } else {
                depth = max(0, depth - 1)
                remaining = remaining[nextClose.upperBound...]
            }
        }
        if remaining.range(of: "/*") != nil {
            depth += 1
        }
        if remaining.range(of: "*/") != nil {
            depth = max(0, depth - 1)
        }
        return depth
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

    private static func declarationName(in line: String) -> String? {
        if let functionName = functionDeclarationName(in: line) {
            return functionName
        }
        if let namedDeclaration = firstRegexCapture(
            pattern: #"\b(?:var|let|class|struct|enum|protocol|actor)\s+([A-Za-z_][A-Za-z0-9_]*)"#,
            in: line
        ) {
            return namedDeclaration
        }
        return nil
    }

    private static func functionDeclarationName(in line: String) -> String? {
        let pattern = try! NSRegularExpression(pattern: #"\bfunc\s+([A-Za-z_][A-Za-z0-9_]*)\s*\(([^)]*)\)"#)
        let nsString = line as NSString
        guard let match = pattern.firstMatch(in: line, range: NSRange(location: 0, length: nsString.length)) else {
            return nil
        }

        let name = nsString.substring(with: match.range(at: 1))
        let parameterList = nsString.substring(with: match.range(at: 2)).trimmingCharacters(in: .whitespacesAndNewlines)
        guard !parameterList.isEmpty else {
            return "\(name)()"
        }

        let labels = parameterList.split(separator: ",").map { parameter -> String in
            let tokens = parameter
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .split { $0.isWhitespace || $0 == ":" }
            return tokens.first.map(String.init) ?? "_"
        }
        return "\(name)(\(labels.map { "\($0):" }.joined()))"
    }

    private static func isImmediatelyBeforeDeclaration(at lineIndex: Int, in lines: [String]) -> Bool {
        var nextIndex = lineIndex + 1
        while nextIndex < lines.count {
            let candidate = lines[nextIndex].trimmingCharacters(in: .whitespacesAndNewlines)
            if candidate.isEmpty {
                nextIndex += 1
                continue
            }
            if candidate.hasPrefix("///") || candidate.hasPrefix("//") {
                nextIndex += 1
                continue
            }
            return declarationName(in: candidate) != nil
        }
        return false
    }

    private static func firstRegexCapture(pattern: String, in line: String) -> String? {
        let regex = try! NSRegularExpression(pattern: pattern)
        let nsString = line as NSString
        guard let match = regex.firstMatch(in: line, range: NSRange(location: 0, length: nsString.length)) else {
            return nil
        }
        return nsString.substring(with: match.range(at: 1))
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
