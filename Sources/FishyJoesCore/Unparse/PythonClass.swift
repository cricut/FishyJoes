import Foundation

class PythonClass {
    enum FFIType: String, Hashable, Codable {
        case void
        case bool
        case int8
        case int16
        case int32
        case int64
        case int
        case uint8
        case uint16
        case uint32
        case uint64
        case uint
        case float
        case double
        case object
    }

    indirect enum PyType: Hashable, Codable {
        case none
        case primitive(String)
        case named(module: String?, name: String)
        /// A type imported from another Python package — used for upstream
        /// runtime types (e.g. ``AttributedString`` in ``fishyjoes_python``)
        /// referenced from per-module generated bindings.  Mirrors C#'s
        /// ``Cricut.FishyJoesRuntime.AttributedString`` shape: rendered as
        /// the bare ``name`` in type hints, with a top-of-file
        /// ``from <package> import <name>`` import.
        case namedExternal(package: String, name: String)
        case optional(PyType)
        case list(PyType)
        case dict(PyType, PyType)
        case set(PyType)
        case tuple([PyType])
        case callable(args: [PyType], return: PyType)
        case awaitable(PyType)
        case any
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        struct Parameter: Equatable {
            let labelComment: String?
            let name: String
            let type: PyType
            let ffiType: FFIType
            let defaultValue: String?
        }

        let documentation: [String]
        let isStatic: Bool
        let name: String
        let mangledName: String
        let parameters: [Method.Parameter]
        let returnType: PyType
        let ffiReturnType: FFIType
        let deprecation: Deprecation?
        let body: [String]?
        let isAsync: Bool
    }

    struct Variable: Equatable {
        let documentation: [String]
        let isStatic: Bool
        let isMutable: Bool
        let isPubliclyWritable: Bool
        let asMethod: Bool
        let name: String
        let mangledName: String
        let type: PyType
        let ffiType: FFIType
        let deprecation: Deprecation?
        /// True when this field comes from a protocol default implementation.
        /// When true, the iota symbol is `__iota__default_<protocolMangledName>_<fieldName>`
        /// rather than `__iota_get_<concreteMangledName>_<fieldName>`.
        let isDefaultImplementation: Bool
        /// The protocol's mangled name, used to build the correct symbol when `isDefaultImplementation` is true.
        let defaultImplProtocolMangledName: String?

        /// Returns the getter symbol name for use in `call_symbol`.
        var getterSymbol: String {
            if isDefaultImplementation, let proto = defaultImplProtocolMangledName {
                return "__iota__default_\(proto)_\(name.mangled)"
            }
            return "__iota_get_\(mangledName)"
        }
    }

    let module: Module
    let documentation: [String]
    let name: String
    let fields: [Variable]
    let methods: [Method]

    /// Override for the Python class identifier and file-name stem.  Set by
    /// ``FishyJoesContext`` during translation when two PythonClass
    /// instances would otherwise collide on ``unqualifiedName``.  When set,
    /// it is the verbatim name to use in source emission — either the value
    /// parsed from the Swift export annotation, e.g.
    /// ``AttributedString_PuttingTypesIntoQuestionablePlaces``, or a stable
    /// identifier derived from the qualified Swift type path, e.g.
    /// ``Path_Progress``.  ``nil`` means no collision; the bare unqualified
    /// name is used.
    var explicitDisambiguatedName: String?

    /// Module-level lookup populated by ``FishyJoesContext.translateAll``
    /// before the PythonClass output loop runs.  Maps qualified Swift type
    /// paths and unique bare names to the Python identifier that will be
    /// emitted.  Ambiguous bare names are intentionally absent; a reference
    /// must carry its qualified Swift path to resolve one of those.
    nonisolated(unsafe) static var nameDisambiguation: [String: String] = [:]

    init(
        module: Module,
        documentation: [String],
        name: String,
        fields: [Variable],
        methods: [Method]
    ) {
        self.module = module
        self.documentation = documentation
        self.name = name
        self.fields = fields
        self.methods = methods
    }

    /// The Python class identifier and file-name stem used in generated
    /// output.  Equal to ``unqualifiedName`` unless a sibling
    /// ``PythonClass`` shares it, in which case
    /// ``FishyJoesContext.translateAll`` has set
    /// ``explicitDisambiguatedName`` from the Swift export annotation
    /// (e.g. ``AttributedString_PuttingTypesIntoQuestionablePlaces``).
    var disambiguatedName: String {
        explicitDisambiguatedName ?? unqualifiedName
    }

    /// Parses the export name out of a ``<!-- FishyJoes.export(NAME) -->``
    /// or ``<!-- FishyJoes.exportReference(NAME) -->`` doc-comment line.
    /// Returns the name (which already encodes any disambiguating prefix
    /// the Swift author chose) or ``nil`` if no annotation is present.
    func exportAnnotationName() -> String? {
        let pattern = #"<!--\s*FishyJoes\.(?:export|exportReference)\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*\)\s*-->"#
        for line in documentation {
            if let range = line.range(of: pattern, options: .regularExpression),
               let nameMatch = line[range].range(of: #"\(\s*[A-Za-z_][A-Za-z0-9_]*\s*\)"#, options: .regularExpression) {
                let inner = line[nameMatch].dropFirst().dropLast()
                return inner.trimmingCharacters(in: .whitespaces)
            }
        }
        return nil
    }

    static func unqualifiedIdentifier(forName name: String) -> String {
        String(name.split(separator: ".").last.map(String.init) ?? name)
    }

    static func disambiguatedIdentifier(forQualifiedName name: String) -> String {
        let joined = name.split(separator: ".").joined(separator: "_")
        let sanitized = joined.map { character -> Character in
            if character.isLetter || character.isNumber || character == "_" {
                return character
            }
            return "_"
        }
        let identifier = String(sanitized)
        guard let first = identifier.first else {
            return "GeneratedType"
        }
        if first.isLetter || first == "_" {
            return identifier
        }
        return "_\(identifier)"
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden")
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        // Collect every locally-defined class referenced by this class's
        // fields/methods so we can emit ``from .Other import Other`` at the
        // top.  Without these imports, ``mypy`` flags every cross-class type
        // hint as undefined; ``from __future__ import annotations`` defers
        // runtime evaluation so imports cost nothing in practice.
        var referenced = Set<String>()
        // Imports for upstream-runtime types (Foundation: AttributedString,
        // AttributeContainer, etc.) live in a separate package and need
        // ``from <package> import <name>`` rather than sibling imports.
        var externalReferenced = Set<ExternalImport>()
        for field in fields {
            referenced.formUnion(field.type.referencedNamedClasses)
            externalReferenced.formUnion(field.type.referencedExternalImports)
        }
        for method in methods {
            referenced.formUnion(method.returnType.referencedNamedClasses)
            externalReferenced.formUnion(method.returnType.referencedExternalImports)
            for parameter in method.parameters {
                referenced.formUnion(parameter.type.referencedNamedClasses)
                externalReferenced.formUnion(parameter.type.referencedExternalImports)
            }
        }
        if let productClass = self as? PythonProductClass,
           case .public(let initFields) = productClass.constructor {
            for field in initFields {
                referenced.formUnion(field.type.referencedNamedClasses)
                externalReferenced.formUnion(field.type.referencedExternalImports)
            }
        }
        // PythonEnumClass emits one dataclass per case alongside the enum
        // class itself; their associated-value fields are not represented
        // in this class's ``fields``/``methods``, so walk them explicitly
        // so the enum module imports every sibling type it actually
        // references.
        if let enumClass = self as? PythonEnumClass {
            for enumCase in enumClass.cases {
                for (_, valueType) in enumCase.values {
                    referenced.formUnion(valueType.referencedNamedClasses)
                    externalReferenced.formUnion(valueType.referencedExternalImports)
                }
            }
        }
        referenced.remove(unqualifiedName)
        referenced.remove(disambiguatedName)
        // Skip anything that is not a bare Python identifier — otherwise a
        // mis-rendered generic like ``Index>`` would produce ``from .Index> import Index>``.
        let identifierPattern = #"^[A-Za-z_][A-Za-z0-9_]*$"#

        // Resolve each referenced name through ``context.pythonClasses``
        // so the import target uses the *disambiguated* file name (e.g.
        // ``from .Structs_PuttingTypes import Structs_PuttingTypes``)
        // rather than the bare unqualified name that may no longer have a
        // matching .py file after collision-disambiguation in step A.
        // Falls back to the bare name when no sibling matches (external
        // type, generic alias, etc.).
        let pythonClassesByQualified: [String: [PythonClass]] = Dictionary(
            grouping: context.pythonClasses,
            by: \.name,
        )
        let pythonClassesByUnqualified: [String: [PythonClass]] = Dictionary(
            grouping: context.pythonClasses,
            by: \.unqualifiedName,
        )
        func resolveImport(_ name: String) -> String? {
            if let exactCandidates = pythonClassesByQualified[name], exactCandidates.count == 1 {
                return exactCandidates[0].disambiguatedName
            }
            let bareName = Self.unqualifiedIdentifier(forName: name)
            if let candidates = pythonClassesByUnqualified[bareName], candidates.count == 1 {
                return candidates[0].disambiguatedName
            }
            return nil
        }

        let resolvedSiblingImports = Set(referenced
            .compactMap(resolveImport)
            .filter { $0.range(of: identifierPattern, options: .regularExpression) != nil }
            .filter { $0 != disambiguatedName })

        let siblingImports = resolvedSiblingImports
            .sorted()
            .map { "if typing.TYPE_CHECKING: from .\($0) import \($0)" }

        // Upstream-runtime imports (Foundation types in ``fishyjoes_python``).
        // Group by package so we emit one ``from <package> import a, b, c``
        // per upstream package rather than one line per name.  Sorted for
        // deterministic output regardless of Set iteration order.
        let externalImports = Dictionary(grouping: externalReferenced, by: \.package)
            .sorted { $0.key < $1.key }
            .map { (package, refs) -> String in
                let names = refs.map(\.name).sorted().joined(separator: ", ")
                return "if typing.TYPE_CHECKING: from \(package) import \(names)"
            }

        let imports = siblingImports + externalImports

        // Populate the per-class disambiguation lookup that ``PyType.name``
        // reads while rendering this class's type annotations.  Self-
        // references to the bare unqualified name resolve to *this* class's
        // disambiguated name; sibling references resolve to their unique
        // disambiguated form (siblings with multiple disambiguated peers
        // stay as the bare name and import is skipped above).
        var lookup = Dictionary(
            uniqueKeysWithValues: context.pythonClasses.map { ($0.name, $0.disambiguatedName) }
        )
        for (bare, candidates) in pythonClassesByUnqualified where candidates.count == 1 {
            let candidate = candidates[0]
            lookup[bare] = candidate.disambiguatedName
        }
        PythonClass.nameDisambiguation = lookup
        defer { PythonClass.nameDisambiguation = [:] }

        let fragment = context.pythonFragment("\(disambiguatedName).py", additionalImports: imports)
        output(to: fragment)
        return fragment
    }

    func document(_ documentation: [String], fragment: SourceFragment, extra: [String] = []) {
        let lines = documentation + extra
        guard !lines.isEmpty else { return }
        fragment.output("\"\"\"")
        for line in lines {
            let escapedLine = line
                .replacingOccurrences(of: "\\", with: "\\\\")
                .replacingOccurrences(of: "\"\"\"", with: "\\\"\\\"\\\"")
            fragment.output(escapedLine)
        }
        fragment.output("\"\"\"")
    }

    func outputNotImplemented(
        fragment: SourceFragment,
        symbol: String
    ) {
        fragment.output("_ensure_runtime_loaded()")
        fragment.output("_not_implemented(\"\(symbol)\")")
    }

    var unqualifiedName: String {
        Self.unqualifiedIdentifier(forName: name)
    }

    static func separate(fieldsAndMethods: [MethodOrVariable]) -> (fields: [Variable], methods: [Method]) {
        var fields: [Variable] = []
        var methods: [Method] = []
        for item in fieldsAndMethods {
            switch item {
            case .method(let method):
                methods.append(method)
            case .variable(let field):
                fields.append(field)
            }
        }
        return (fields, methods)
    }

    func outputRuntimeCall(
        fragment: SourceFragment,
        symbol: String,
        returnType: FFIType,
        arguments: [(expression: String, type: FFIType)],
        isAsync: Bool = false
    ) {
        fragment.output("_ensure_runtime_loaded()")
        let awaitPrefix = isAsync ? "await " : ""
        let argString = arguments.map { "(\"\($0.type.rawValue)\", \($0.expression))" }.joined(separator: ", ")
        let invocation = "\(awaitPrefix)_get_runtime().call_symbol(\"\(symbol)\", \"\(returnType.rawValue)\"\(argString.isEmpty ? "" : ", \(argString)"))"
        if returnType == .void {
            fragment.output(invocation)
        } else if returnType == .bool {
            fragment.output("return bool(\(invocation))")
        } else {
            fragment.output("return \(invocation)")
        }
    }

    func parameterList(explicit: [String], parameters: [Method.Parameter]) -> String {
        let renderedParameters = parameters.map {
            "\($0.name): \($0.type.name)\($0.defaultValue.map { " = \($0)" } ?? "")"
        }

        let firstDefaultIndex = parameters.firstIndex { $0.defaultValue != nil }
        let needsKeywordOnlySeparator = firstDefaultIndex.flatMap { firstDefaultIndex in
            parameters[firstDefaultIndex...].contains { $0.defaultValue == nil } ? firstDefaultIndex : nil
        }

        var rendered = explicit
        if let firstDefaultIndex = needsKeywordOnlySeparator {
            if !parameters.isEmpty {
                rendered.append("*")
            }
            rendered.append(contentsOf: renderedParameters[..<firstDefaultIndex])
            rendered.append(contentsOf: renderedParameters[firstDefaultIndex...])
        } else {
            rendered.append(contentsOf: renderedParameters)
        }
        return rendered.joined(separator: ", ")
    }
}

/// `(package, name)` identifying a Python class imported from an
/// upstream runtime package.  See ``PythonClass.PyType.namedExternal``.
struct ExternalImport: Hashable {
    let package: String
    let name: String
}

extension PythonClass.PyType {
    var isOptional: Bool {
        if case .optional = self {
            return true
        }
        return false
    }

    /// Python builtin type names that the generator might emit as bare
    /// annotations.  These get qualified as ``builtins.<name>`` to avoid
    /// shadowing by same-class members (e.g. a method named ``bytes`` in
    /// the same class as a method that returns ``bytes`` would otherwise
    /// resolve to the method, not the builtin).
    static let pythonBuiltinNames: Set<String> = [
        "bytes", "int", "str", "list", "dict", "set", "bool",
        "type", "float", "bytearray", "frozenset", "tuple",
        "complex", "object", "range", "memoryview",
    ]

    private static func qualifyIfBuiltin(_ name: String) -> String {
        return pythonBuiltinNames.contains(name) ? "builtins.\(name)" : name
    }

    var name: String {
        switch self {
        case .none:
            return "None"
        case .primitive(let name):
            return Self.qualifyIfBuiltin(name)
        case .named(let module, let name):
            if module == nil {
                if let disambig = PythonClass.nameDisambiguation[name] {
                    return disambig
                }
                let bareName = PythonClass.unqualifiedIdentifier(forName: name)
                if bareName.range(of: #"^[A-Za-z_][A-Za-z0-9_]*$"#, options: .regularExpression) != nil {
                    return Self.qualifyIfBuiltin(bareName)
                }
                return "typing.Any"
            }
            let qualifiedName = module.map { "\($0).\(name)" } ?? name
            if qualifiedName.range(of: #"^[A-Za-z_][A-Za-z0-9_\.]*$"#, options: .regularExpression) != nil {
                return qualifiedName
            }
            return "typing.Any"
        case .namedExternal(_, let name):
            // Bare reference; the import is emitted at the top of the
            // file by ``PythonClass.fragment(context:)``.
            return name
        case .optional(let wrapped):
            return "\(wrapped.name) | None"
        case .list(let element):
            return "builtins.list[\(element.name)]"
        case .dict(let key, let value):
            return "builtins.dict[\(key.name), \(value.name)]"
        case .set(let element):
            return "builtins.set[\(element.name)]"
        case .tuple(let elements):
            return "builtins.tuple[\(elements.map(\.name).joined(separator: ", "))]"
        case .callable(let args, let result):
            return "typing.Callable[[\(args.map(\.name).joined(separator: ", "))], \(result.name)]"
        case .awaitable(let wrapped):
            return "typing.Awaitable[\(wrapped.name)]"
        case .any:
            return "typing.Any"
        }
    }

    var awaitedName: String {
        if case .awaitable(let wrapped) = self {
            return wrapped.name
        }
        return name
    }

    /// Bare names of every locally-defined class this type refers to.
    ///
    /// Used by ``PythonClass.fragment(context:)`` to emit per-file
    /// ``from .Other import Other`` lines so type checkers can resolve
    /// cross-class annotations.
    var referencedNamedClasses: Set<String> {
        switch self {
        case .none, .primitive, .any:
            return []
        case .named(let module, let name):
            guard module == nil else { return [] }
            return [name]
        case .namedExternal:
            // External imports are tracked separately via
            // ``referencedExternalImports`` so they can be emitted as
            // ``from <package> import <name>`` rather than sibling imports.
            return []
        case .optional(let inner), .list(let inner), .set(let inner), .awaitable(let inner):
            return inner.referencedNamedClasses
        case .dict(let key, let value):
            return key.referencedNamedClasses.union(value.referencedNamedClasses)
        case .tuple(let elements):
            return Set(elements.flatMap(\.referencedNamedClasses))
        case .callable(let args, let result):
            var seen = Set(args.flatMap(\.referencedNamedClasses))
            seen.formUnion(result.referencedNamedClasses)
            return seen
        }
    }

    /// `(package, name)` pairs for every upstream-runtime type this type
    /// references.  Used by ``PythonClass.fragment(context:)`` to emit
    /// ``from <package> import <name>`` for upstream Foundation types
    /// like ``AttributedString`` that live in ``fishyjoes_python`` rather
    /// than as siblings of the generated class.
    var referencedExternalImports: Set<ExternalImport> {
        switch self {
        case .none, .primitive, .any, .named:
            return []
        case .namedExternal(let package, let name):
            return [ExternalImport(package: package, name: name)]
        case .optional(let inner), .list(let inner), .set(let inner), .awaitable(let inner):
            return inner.referencedExternalImports
        case .dict(let key, let value):
            return key.referencedExternalImports.union(value.referencedExternalImports)
        case .tuple(let elements):
            return Set(elements.flatMap(\.referencedExternalImports))
        case .callable(let args, let result):
            var seen = Set(args.flatMap(\.referencedExternalImports))
            seen.formUnion(result.referencedExternalImports)
            return seen
        }
    }

    var defaultLiteral: String? {
        switch self {
        case .none, .optional:
            return "None"
        case .primitive(let name) where name == "bool":
            return "False"
        case .primitive(let name) where name == "int":
            return "0"
        case .primitive(let name) where name == "float":
            return "0.0"
        case .primitive(let name) where name == "str":
            return "\"\""
        case .primitive(let name) where name == "bytes":
            return "b\"\""
        default:
            return nil
        }
    }
}
