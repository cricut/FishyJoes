import Foundation

final class PythonTranslator: Translator {
    required init() {}

    // `PythonType`, `PythonImport`, and the bundled `PythonRepresentation` (which
    // replaces the old nested `NativeType`) now live in the shared model
    // (TranslatedTypes/PythonRepresentation.swift) so `TranslatedType` conformers
    // can return them from `pythonRepresentation(in:)`.

    struct NativeStoredField {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String
        let pythonType: PythonType
        let isMutable: Bool
        let documentation: [String]
    }

    struct NativeEnumCase {
        var pythonName: String
        let cName: String
        let className: String
        var values: [NativeEnumCaseValue]
        let documentation: [String]
    }

    struct NativeEnumCaseValue {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
    }

    struct NativeField {
        var pythonName: String
        /// True when `pythonName` came from a `python:` export attribute; the
        /// name is then emitted verbatim instead of being snake-cased.
        let isExplicitPythonName: Bool
        let cName: String
        let symbol: String
        let setterSymbol: String?
        let isStatic: Bool
        let asMethod: Bool
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
        let documentation: [String]
    }

    struct NativeParameter {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
        let defaultValue: String?
        let defaultValueImports: Set<PythonImport>
    }

    struct PythonDefaultValue {
        let expression: String
        let imports: Set<PythonImport>

        init(expression: String, imports: Set<PythonImport> = []) {
            self.expression = expression
            self.imports = imports
        }
    }

    struct NativeMethod {
        var pythonName: String
        /// True when `pythonName` came from a `python:` export attribute; the
        /// name is then emitted verbatim instead of being snake-cased.
        let isExplicitPythonName: Bool
        let cName: String
        let symbol: String
        let isStatic: Bool
        var parameters: [NativeParameter]
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
        let documentation: [String]
    }

    struct PythonClass {
        let originName: String
        let moduleName: String
        let fileName: String
        let className: String
        let setupName: String?
        let setupKind: String?
        let equalsSymbol: String?
        let hashSymbol: String?
        let isValueHashable: Bool
        let storedFields: [NativeStoredField]
        let enumCases: [NativeEnumCase]
        let fields: [NativeField]
        let methods: [NativeMethod]
        let documentation: [String]
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        var classes: [PythonClass] = []
        var declarations: Set<String> = []

        for type in generatedTypes.sorted(by: { $0.name < $1.name }) {
            let resolved = context.resolve(type: type)
            guard let pythonClass = self.pythonClass(for: resolved, context: context) else {
                continue
            }
            classes.append(pythonClass)
            for field in pythonClass.fields {
                let selfParam = field.isStatic ? [] : ["foreignObject _iotaThis"]
                let allParams = (["EnvRef envRef"] + selfParam + ["foreignOutExn _exn"]).joined(separator: ", ")
                declarations.insert("\(field.returnType) \(field.symbol)(\(allParams));")
                if let setterSymbol = field.setterSymbol {
                    let setterParams = (["EnvRef envRef"] + selfParam + ["\(field.returnType) newValue"] + ["foreignOutExn _exn"]).joined(separator: ", ")
                    declarations.insert("void \(setterSymbol)(\(setterParams));")
                }
            }
            for method in pythonClass.methods {
                let params = method.parameters.map { "\($0.cType) \($0.cName)" }
                let selfParam = method.isStatic ? [] : ["foreignObject _iotaThis"]
                let allParams = (["EnvRef envRef"] + selfParam + params + ["foreignOutExn _exn"]).joined(separator: ", ")
                declarations.insert("\(method.returnType) \(method.symbol)(\(allParams));")
            }
            if let setupName = pythonClass.setupName {
                switch pythonClass.setupKind {
                case "reference":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(void *ptr, foreignOutExn _exn);")
                    declarations.insert("void \(setupName)(EnvRef envRef, \(constructorType) constructorMethod, foreignOutExn _exn);")
                case "emptyValue":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(foreignOutExn _exn);")
                    declarations.insert("void \(setupName)(EnvRef envRef, \(constructorType) constructorMethod, foreignOutExn _exn);")
                case "value":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    let constructorArgs = (pythonClass.storedFields.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                    declarations.insert("typedef foreignObject (*\(constructorType))(\(constructorArgs));")
                    var setupArgs = ["EnvRef envRef", "\(constructorType) constructorMethod"]
                    for field in pythonClass.storedFields {
                        let getterType = "\(pythonClass.className)_\(field.cName)GetterFn"
                        declarations.insert("typedef \(field.cType) (*\(getterType))(foreignObject obj, foreignOutExn _exn);")
                        setupArgs.append("\(getterType) \(field.cName)Getter")
                        if field.isMutable {
                            let setterType = "\(pythonClass.className)_\(field.cName)SetterFn"
                            declarations.insert("typedef void (*\(setterType))(foreignObject obj, \(field.cType) newValue, foreignOutExn _exn);")
                            setupArgs.append("\(setterType) \(field.cName)Setter")
                        }
                    }
                    setupArgs.append("foreignOutExn _exn")
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                case "enum":
                    let discriminatorType = "\(pythonClass.className)DiscriminatorFn"
                    declarations.insert("typedef int (*\(discriminatorType))(foreignObject obj, foreignOutExn _exn);")
                    var setupArgs = ["EnvRef envRef", "\(discriminatorType) discriminator"]
                    for enumCase in pythonClass.enumCases {
                        let constructorType = "\(pythonClass.className)_\(enumCase.cName)ConstructorFn"
                        let extractorType = "\(pythonClass.className)_\(enumCase.cName)ExtractorFn"
                        let constructorArgs = (enumCase.values.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        let extractorArgs = (["foreignObject obj"] + enumCase.values.map { "\($0.cType) *\($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        declarations.insert("typedef foreignObject (*\(constructorType))(\(constructorArgs));")
                        declarations.insert("typedef void (*\(extractorType))(\(extractorArgs));")
                        setupArgs.append("\(constructorType) \(enumCase.cName)_constructor")
                        setupArgs.append("\(extractorType) \(enumCase.cName)_extractor")
                    }
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                case "protocol":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(void *ptr, foreignOutExn _exn);")
                    var setupArgs = ["EnvRef envRef", "\(constructorType) constructorMethod"]
                    for field in pythonClass.fields {
                        let getterType = "\(pythonClass.className)_\(field.cName)GetterFn"
                        declarations.insert("typedef \(field.returnType) (*\(getterType))(foreignObject obj, foreignOutExn _exn);")
                        setupArgs.append("\(getterType) \(field.cName)Getter")
                    }
                    for method in pythonClass.methods {
                        let callbackType = "\(pythonClass.className)_\(method.cName)MethodFn"
                        let callbackArgs = (["foreignObject obj"] + method.parameters.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        declarations.insert("typedef \(method.returnType) (*\(callbackType))(\(callbackArgs));")
                        setupArgs.append("\(callbackType) \(method.cName)")
                    }
                    setupArgs.append("foreignOutExn _exn")
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                default:
                    break
                }
            }
            if let equalsSymbol = pythonClass.equalsSymbol {
                declarations.insert("bool \(equalsSymbol)(EnvRef envRef, foreignObject lhs, foreignObject rhs, foreignOutExn _exn);")
            }
            if let hashSymbol = pythonClass.hashSymbol {
                declarations.insert("int32_t \(hashSymbol)(EnvRef envRef, foreignObject _iotaThis, foreignOutExn _exn);")
            }
        }

        var fragments = classes.flatMap { pythonClass in
            [classFragment(pythonClass), classStubFragment(pythonClass)]
        }

        let exportsFragment = context.pythonFragment("_exports.py")
        exportsFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        exportsFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            exportsFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className)")
        }
        exportsFragment.blankLine()
        let exportedNames = classes.sorted(by: { $0.className < $1.className }).map { "\"\($0.className)\"" }
        exportsFragment.output("__all__ = [\(exportedNames.joined(separator: ", "))]")
        fragments.append(exportsFragment)

        let exportsStubFragment = context.pythonFragment("_exports.pyi")
        exportsStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        exportsStubFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            exportsStubFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className) as \(pythonClass.className)")
        }
        exportsStubFragment.blankLine()
        exportsStubFragment.output("__all__ = [\(exportedNames.joined(separator: ", "))]")
        fragments.append(exportsStubFragment)

        let initStubFragment = context.pythonFragment("__init__.pyi")
        initStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        initStubFragment.blankLine()
        initStubFragment.output("from typing import Any")
        initStubFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            initStubFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className) as \(pythonClass.className)")
        }
        initStubFragment.blankLine()
        initStubFragment.output("from ._native import ResultFailure as ResultFailure")
        initStubFragment.output("from ._native import ResultSuccess as ResultSuccess")
        initStubFragment.output("from ._native import SwiftClosedRange as SwiftClosedRange")
        initStubFragment.output("from ._native import SwiftRange as SwiftRange")
        initStubFragment.blankLine()
        initStubFragment.output("SUPPORTED: bool")
        initStubFragment.output("def diagnostics() -> dict[str, Any]: ...")
        // Emit a concrete __all__ literal (rather than a bare `__all__: list[str]`)
        // so type checkers resolve `from <package> import *` to exactly the public
        // names and the public API is documented in the stub. It mirrors the template
        // __init__.py's runtime value: the fixed runtime re-exports followed by the
        // generated _exports.__all__.
        let initExportedNames = ["\"SUPPORTED\"", "\"ResultFailure\"", "\"ResultSuccess\"", "\"SwiftClosedRange\"", "\"SwiftRange\"", "\"diagnostics\""] + exportedNames
        initStubFragment.output("__all__ = [\(initExportedNames.joined(separator: ", "))]")
        fragments.append(initStubFragment)

        let nativeStubTypes = Set(
            classes
                .flatMap { pythonStubImports(for: $0) }
                .filter { $0.isRelative && $0.moduleName == "_native" && !$0.className.isEmpty }
                .map(\.className)
        )
        .subtracting(["ResultFailure", "ResultSuccess", "SwiftClosedRange", "SwiftRange"])
        // The Foundation AttributedString family is implemented by the Python
        // runtime (fishyjoes_runtime.iota) with a rich typed surface mirroring the
        // Dart/Kotlin runtimes. Like SwiftRange below, these classes are created
        // dynamically by create_runtime, so the hardcoded stubs are their only
        // typing surface and must match the runtime members exactly (stubtest
        // verifies stub against the live `Runtime_*` objects). Emitted as a closed
        // set whenever any member is referenced so cross-references resolve.
        let referencedAttributedStringFamily = !nativeStubTypes
            .isDisjoint(with: Self.attributedStringStubFamilyNames)
        let nativeStubFragment = context.pythonFragment("_native.pyi")
        nativeStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        nativeStubFragment.blankLine()
        nativeStubFragment.output("from dataclasses import dataclass")
        if referencedAttributedStringFamily {
            nativeStubFragment.output("from collections.abc import Iterator")
        }
        nativeStubFragment.output("from typing import Any, Generic, TypeVar")
        nativeStubFragment.blankLine()
        nativeStubFragment.output("SUPPORTED: bool")
        nativeStubFragment.output("def diagnostics(package_name: str) -> dict[str, Any]: ...")
        nativeStubFragment.output("def shutdown() -> None: ...")
        nativeStubFragment.blankLine()
        // Typed interfaces for the runtime value types every generated
        // package re-exports. The classes are created dynamically by
        // fishyjoes_runtime.create_runtime, so these stubs are their only
        // typing surface; the shapes mirror python-runtime iota.py.
        nativeStubFragment.output("_BoundT = TypeVar(\"_BoundT\")")
        nativeStubFragment.output("_SuccessT = TypeVar(\"_SuccessT\")")
        nativeStubFragment.output("_FailureT = TypeVar(\"_FailureT\")")
        nativeStubFragment.blankLine()
        nativeStubFragment.output("@dataclass(frozen=True)")
        nativeStubFragment.output("class SwiftRange(Generic[_BoundT]):")
        nativeStubFragment.indent {
            nativeStubFragment.output("\"\"\"A Swift `Range`; `upper_bound` is excluded.\"\"\"")
            nativeStubFragment.output("lower_bound: _BoundT")
            nativeStubFragment.output("upper_bound: _BoundT")
        }
        nativeStubFragment.blankLine()
        nativeStubFragment.output("@dataclass(frozen=True)")
        nativeStubFragment.output("class SwiftClosedRange(Generic[_BoundT]):")
        nativeStubFragment.indent {
            nativeStubFragment.output("\"\"\"A Swift `ClosedRange`; `upper_bound` is included.\"\"\"")
            nativeStubFragment.output("lower_bound: _BoundT")
            nativeStubFragment.output("upper_bound: _BoundT")
        }
        nativeStubFragment.blankLine()
        nativeStubFragment.output("@dataclass(frozen=True)")
        nativeStubFragment.output("class ResultSuccess(Generic[_SuccessT]):")
        nativeStubFragment.indent {
            nativeStubFragment.output("\"\"\"The success case of a Swift `Result`, carrying the value.\"\"\"")
            nativeStubFragment.output("value: _SuccessT")
            nativeStubFragment.output("def get_or_none(self) -> _SuccessT: ...")
            nativeStubFragment.output("def exception_or_none(self) -> None: ...")
        }
        nativeStubFragment.blankLine()
        nativeStubFragment.output("@dataclass(frozen=True)")
        nativeStubFragment.output("class ResultFailure(Generic[_FailureT]):")
        nativeStubFragment.indent {
            nativeStubFragment.output("\"\"\"The failure case of a Swift `Result`, carrying the error.\"\"\"")
            nativeStubFragment.output("error: _FailureT")
            nativeStubFragment.output("def get_or_none(self) -> None: ...")
            nativeStubFragment.output("def exception_or_none(self) -> _FailureT: ...")
        }
        if referencedAttributedStringFamily {
            Self.emitAttributedStringFamilyStubs(into: nativeStubFragment)
        }
        let remainingStubTypes = nativeStubTypes
            .subtracting(Self.attributedStringStubFamilyNames)
            .sorted()
        if !remainingStubTypes.isEmpty {
            nativeStubFragment.blankLine()
            for typeName in remainingStubTypes {
                nativeStubFragment.output("class \(typeName): ...")
            }
        }
        fragments.append(nativeStubFragment)

        let pyTypedFragment = context.pythonFragment("py.typed")
        pyTypedFragment.output("")
        fragments.append(pyTypedFragment)

        let declarationsFragment = context.pythonFragment("_generated_declarations.h")
        declarationsFragment.output("/* THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT. */")
        declarationsFragment.blankLine()
        declarationsFragment.output("/*")
        declarationsFragment.output("ABI pointer conventions:")
        declarationsFragment.output("- calling-convention: cdecl for all exported functions and callback typedefs.")
        declarationsFragment.output("- nullability: EnvRef is nonnull; foreignOutExn is nonnull; foreignObject values are nonnull unless named optional or documented otherwise.")
        declarationsFragment.output("- ownership: foreignObject return values are created unless explicitly documented; foreignObject parameters are borrowed unless explicitly documented; foreignOutExn is nonnull and receives an optional created error object.")
        declarationsFragment.output("*/")
        declarationsFragment.blankLine()
        declarationsFragment.output("void FishyJoes_\(context.module.name.mangled)_registerTypes(void);")
        declarationsFragment.blankLine()
        for declaration in declarations.sorted() {
            declarationsFragment.output(declaration)
        }
        fragments.append(declarationsFragment)

        fragments.append(contentsOf: typingGateFragments(context: context, classes: classes))

        return fragments
    }

    // MARK: - Per-package typing gates

    /// The stubtest allowlist entries this package's own generated code makes
    /// necessary — its irreducible residue, computed from the translated model
    /// (never observed from a specific generated library's names). Three entry
    /// classes exist, each a genuine limit of stubtest or of Python itself:
    ///
    /// - An associated-value enum case whose class attribute the stub cannot
    ///   declare (`None` and other keywords/constants): the runtime sets it via
    ///   `setattr` for case parity, so stubtest reports a member absent from
    ///   the stub.
    /// - A class whose runtime metaclass differs from the stub's: settable
    ///   static properties dispatch through a synthesized runtime metaclass the
    ///   stub models as plain `ClassVar` attributes, while deprecated read-only
    ///   static properties render on a synthesized stub metaclass (PEP 702
    ///   markers only decorate function-shaped members) with no runtime
    ///   counterpart. stubtest reports the class whenever exactly one side has
    ///   a custom metaclass — and skips the check entirely for enum stubs.
    /// - A deprecated read-only static property: a class-body descriptor at
    ///   runtime, a metaclass property in the stub, so stubtest reports the
    ///   member as absent from the stub.
    static func stubtestAllowlistEntries(for classes: [PythonClass], importPackageName: String) -> [String] {
        var entries: [String] = []
        for pythonClass in classes {
            let classPath = "\(importPackageName).\(pythonClass.moduleName).\(pythonClass.className)"
            let isAssociatedEnum = pythonClass.enumCases.contains { !$0.values.isEmpty }

            if isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    let attributeName = upperCaseFirst(enumCase.cName)
                    if !PythonNaming.canEmitStubAttribute(attributeName) {
                        entries.append("\(classPath).\(attributeName)")
                    }
                }
            }

            // Simple enum stubs derive `enum.Enum`; stubtest skips both their
            // metaclass verification and (having no synthesized stub metaclass)
            // their deprecated statics stay honest `ClassVar` declarations.
            guard !(pythonClass.setupKind == "enum" && !isAssociatedEnum) else { continue }

            let runtimeHasMetaclass = pythonClass.fields.contains { $0.isStatic && $0.setterSymbol != nil }
            let stubHasMetaclass = pythonClass.fields.contains { $0.isStatic && !$0.asMethod && $0.deprecationMessage != nil }
            if runtimeHasMetaclass != stubHasMetaclass {
                entries.append(classPath)
            }

            for field in pythonClass.fields
            where field.isStatic && !field.asMethod && field.deprecationMessage != nil && field.setterSymbol == nil {
                entries.append("\(classPath).\(field.pythonName)")
            }
        }
        return entries.sorted()
    }

    /// The per-package typing gate, emitted into `python/generated/tests/`:
    /// the package's own stubtest allowlist residue plus a self-contained
    /// unittest module running stubtest (strict allowlist handling), mypy
    /// --strict, and pyright --verifytypes against the package. The generated
    /// tests directory is a separate discovery root from the hand-written
    /// `tests/` directory, so the gate runs everywhere the package's tests run
    /// — including installed-wheel verification.
    private func typingGateFragments(context: FishyJoesContext, classes: [PythonClass]) -> [SourceFragment] {
        let packageName = context.pythonImportPackageName
        let entries = Self.stubtestAllowlistEntries(for: classes, importPackageName: packageName)

        let allowlistFragment = context.pythonTestFragment("stubtest_allowlist.txt")
        allowlistFragment.output("""
            # THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.
            #
            # This package's own stubtest residue, computed from the translated model.
            # Each entry class is a genuine limit of stubtest or of Python itself, and
            # the gate runs strict: an unused entry fails and must be re-justified or
            # removed, not silently tolerated.
            #
            # <Class>.<Case> -- Python cannot declare the case attribute in a stub (its
            #   name is a keyword or constant such as `None`); the runtime sets the
            #   Swift enum case via setattr for case parity.
            # <Class> -- the runtime metaclass differs from the stub's: settable static
            #   properties dispatch through a synthesized runtime metaclass the stub
            #   models as plain ClassVar attributes, and deprecated read-only static
            #   properties render on a synthesized stub metaclass (deprecation markers
            #   only decorate function-shaped members) with no runtime counterpart.
            # <Class>.<member> -- a deprecated read-only static property: a class-body
            #   descriptor at runtime, a metaclass property in the stub, so stubtest
            #   reports it as absent from the stub.
            #
            # Supplemental, hand-written entries (the escape hatch for toolchain-drift
            # false positives) belong in ../../tests/stubtest_allowlist.local.txt; the
            # generated gate merges the two at run time.
            """)
        if !entries.isEmpty {
            allowlistFragment.blankLine()
            for entry in entries {
                allowlistFragment.output(entry)
            }
        }

        // The gate owns its checker toolchain: emit its dev requirements next to
        // the gate so the test phase can install them regardless of whether the
        // package's own requirements-dev.txt (scaffolding, not regenerated) lists
        // them. Pinned because stubtest's member coverage shifts across checker
        // releases, which silently changes which allowlist entries are needed.
        let requirementsFragment = context.pythonTestFragment("requirements-dev.txt")
        requirementsFragment.output("""
            # THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.
            #
            # Checker toolchain for the generated typing gate (test_generated_typing_gates.py).
            # Installed by the Python test phase so the gate runs even when the package's
            # own requirements-dev.txt does not list the checkers. Pinned deliberately.
            mypy==2.1.0
            pyright==1.1.411
            types-cffi
            """)

        let gateFragment = context.pythonTestFragment("test_generated_typing_gates.py")
        gateFragment.output(#"""
            # THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.
            """Typing gates for the generated `\#(packageName)` package.

            Typing gates are owned by the package they check: the generator emits this
            module and the package's own allowlist residue (stubtest_allowlist.txt,
            computed from the translated model) next to the generated sources, so the
            package gates its own typing wherever its tests run -- from the source tree
            and against the installed wheel alike. The fishyjoes_runtime package is
            gated separately, by its owner.

            Self-contained by design: this module is discovered from the generated
            tests directory, a separate discovery root from the hand-written tests, so
            it must not import helpers from there.
            """
            import os
            import subprocess
            import sys
            import tempfile
            import unittest
            from pathlib import Path

            _IMPORT_PACKAGE = "\#(packageName)"
            _GENERATED_ROOT = Path(__file__).resolve().parents[1]
            _GENERATED_SRC = _GENERATED_ROOT / "src"
            _GENERATED_ALLOWLIST = Path(__file__).with_name("stubtest_allowlist.txt")
            # The hand-written escape hatch for toolchain-drift false positives:
            # entries here supplement (never replace) the generated allowlist and are
            # merged at run time.
            _LOCAL_ALLOWLIST = _GENERATED_ROOT.parent / "tests" / "stubtest_allowlist.local.txt"


            class GeneratedTypingGateTests(unittest.TestCase):
                def checker_env(self) -> dict[str, str]:
                    """Environment for a type-checker subprocess.

                    In installed-wheel mode the stubs come from the installed package,
                    so MYPYPATH must not shadow them with the source tree; in
                    development mode the generated source directory is prepended so
                    checkers see the working-tree stubs.
                    """
                    env = os.environ.copy()
                    if os.environ.get("FISHYJOES_TEST_INSTALLED_WHEEL") == "1":
                        env.pop("MYPYPATH", None)
                    else:
                        env["MYPYPATH"] = os.pathsep.join(
                            filter(None, [str(_GENERATED_SRC), env.get("MYPYPATH", "")])
                        )
                    env["PYTHONDONTWRITEBYTECODE"] = "1"
                    return env

                def run_checker(
                    self, name: str, command: list[str], env: dict[str, str] | None = None
                ) -> subprocess.CompletedProcess[str]:
                    result = subprocess.run(
                        command,
                        cwd=_GENERATED_ROOT,
                        env=env or self.checker_env(),
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True,
                        check=False,
                    )
                    self.assertEqual(
                        0,
                        result.returncode,
                        "\n".join(
                            [
                                f"{name} failed.",
                                "Install the pinned checkers from requirements-dev.txt if one is missing.",
                                result.stdout,
                                result.stderr,
                            ]
                        ),
                    )
                    return result

                def test_package_matches_runtime_with_stubtest(self) -> None:
                    # Strict allowlist handling (no --ignore-unused-allowlist): an
                    # unused entry means the gate or the toolchain changed, and must be
                    # re-justified or removed, not silently tolerated.
                    with tempfile.TemporaryDirectory(prefix="fishyjoes-stubtest-") as temp_dir:
                        allowlist = _GENERATED_ALLOWLIST
                        if _LOCAL_ALLOWLIST.is_file():
                            allowlist = Path(temp_dir) / "stubtest_allowlist_merged.txt"
                            allowlist.write_text(
                                _GENERATED_ALLOWLIST.read_text() + "\n" + _LOCAL_ALLOWLIST.read_text()
                            )
                        self.run_checker(
                            "mypy.stubtest",
                            [
                                sys.executable,
                                "-m",
                                "mypy.stubtest",
                                _IMPORT_PACKAGE,
                                "--concise",
                                "--allowlist",
                                str(allowlist),
                            ],
                        )

                def test_package_source_type_checks_with_mypy(self) -> None:
                    with tempfile.TemporaryDirectory(prefix="fishyjoes-mypy-") as cache_dir:
                        self.run_checker(
                            "mypy",
                            [
                                sys.executable,
                                "-m",
                                "mypy",
                                "--strict",
                                "--show-error-codes",
                                "--no-error-summary",
                                "--cache-dir",
                                cache_dir,
                                "-p",
                                _IMPORT_PACKAGE,
                            ],
                        )

                def test_package_reports_complete_pyright_types(self) -> None:
                    # --verifytypes ignores --pythonpath and configuration files: it
                    # discovers the Python environment through the `python` found on
                    # PATH. Put this interpreter's bin directory first so it inspects
                    # the environment the package is actually installed in.
                    env = self.checker_env()
                    env["PATH"] = os.pathsep.join(
                        [str(Path(sys.executable).parent)] + list(filter(None, [env.get("PATH", "")]))
                    )
                    command = [
                        sys.executable,
                        "-m",
                        "pyright",
                        "--verifytypes",
                        _IMPORT_PACKAGE,
                        "--ignoreexternal",
                    ]
                    result = subprocess.run(
                        command,
                        cwd=_GENERATED_ROOT,
                        env=env,
                        stdout=subprocess.PIPE,
                        stderr=subprocess.PIPE,
                        text=True,
                        check=False,
                    )
                    self.assertNotIn(
                        'Package directory: ""',
                        result.stdout,
                        "\n".join(
                            [
                                "pyright --verifytypes could not locate the installed package;",
                                "the gate would be vacuous. PATH-based environment discovery is broken.",
                                result.stdout,
                                result.stderr,
                            ]
                        ),
                    )
                    self.assertEqual(
                        0,
                        result.returncode,
                        "\n".join(
                            [
                                "pyright --verifytypes failed for the generated package.",
                                result.stdout,
                                result.stderr,
                            ]
                        ),
                    )
                    self.assertIn(
                        "Type completeness score: 100%",
                        result.stdout,
                        "\n".join(
                            [
                                "pyright --verifytypes did not report full type completeness.",
                                result.stdout,
                                result.stderr,
                            ]
                        ),
                    )


            if __name__ == "__main__":
                unittest.main()
            """#)

        return [allowlistFragment, requirementsFragment, gateFragment]
    }

    /// The closed set of `_native` runtime classes for the Foundation
    /// AttributedString family. Their typed stubs are hardcoded (see
    /// `emitAttributedStringFamilyStubs`) because the classes are created
    /// dynamically by `fishyjoes_runtime.create_runtime`, exactly as for
    /// SwiftRange / Result*; the stubs mirror the runtime members one-for-one so
    /// stubtest passes without allowlisting them.
    static let attributedStringStubFamilyNames: Set<String> = [
        "Runtime_AttributedString",
        "Runtime_AttributedString_Index",
        "Runtime_AttributedString_UnicodeScalarView",
        "Runtime_AttributedString_CharacterView",
        "Runtime_AttributedString_Runs",
        "Runtime_AttributedString_Runs_Index",
        "Runtime_AttributedString_Runs_Run",
        "Runtime_AttributedSubstring",
        "Runtime_AttributeContainer",
        "Runtime_AttributeContainer_FoundationAttributes",
    ]

    /// Emits typed `.pyi` stubs for the whole AttributedString family. Members
    /// (snake_case, properties, `__iter__`/`__getitem__`, comparisons) must match
    /// the runtime classes in `python-runtime/.../iota.py` exactly. `SwiftRange`
    /// is defined earlier in the same stub; `Iterator` is imported conditionally.
    static func emitAttributedStringFamilyStubs(into fragment: SourceFragment) {
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_Index:")
        fragment.indent {
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
            fragment.output("def __lt__(self, other: Runtime_AttributedString_Index) -> bool: ...")
            fragment.output("def __le__(self, other: Runtime_AttributedString_Index) -> bool: ...")
            fragment.output("def __gt__(self, other: Runtime_AttributedString_Index) -> bool: ...")
            fragment.output("def __ge__(self, other: Runtime_AttributedString_Index) -> bool: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_Runs_Index:")
        fragment.indent {
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
            fragment.output("def __lt__(self, other: Runtime_AttributedString_Runs_Index) -> bool: ...")
            fragment.output("def __le__(self, other: Runtime_AttributedString_Runs_Index) -> bool: ...")
            fragment.output("def __gt__(self, other: Runtime_AttributedString_Runs_Index) -> bool: ...")
            fragment.output("def __ge__(self, other: Runtime_AttributedString_Runs_Index) -> bool: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_Runs_Run:")
        fragment.indent {
            fragment.output("@property")
            fragment.output("def range(self) -> SwiftRange[Runtime_AttributedString_Index]: ...")
            fragment.output("@property")
            fragment.output("def attributes(self) -> Runtime_AttributeContainer: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_UnicodeScalarView:")
        fragment.indent {
            fragment.output("@property")
            fragment.output("def start_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("@property")
            fragment.output("def end_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("def index_before(self, index: Runtime_AttributedString_Index) -> Runtime_AttributedString_Index: ...")
            fragment.output("def index_after(self, index: Runtime_AttributedString_Index) -> Runtime_AttributedString_Index: ...")
            fragment.output("def element_at(self, index: Runtime_AttributedString_Index) -> int: ...")
            fragment.output("def __getitem__(self, index: Runtime_AttributedString_Index) -> int: ...")
            fragment.output("def __iter__(self) -> Iterator[int]: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_CharacterView:")
        fragment.indent {
            fragment.output("@property")
            fragment.output("def start_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("@property")
            fragment.output("def end_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("def index_before(self, index: Runtime_AttributedString_Index) -> Runtime_AttributedString_Index: ...")
            fragment.output("def index_after(self, index: Runtime_AttributedString_Index) -> Runtime_AttributedString_Index: ...")
            fragment.output("def element_at(self, index: Runtime_AttributedString_Index) -> str: ...")
            fragment.output("def __getitem__(self, index: Runtime_AttributedString_Index) -> str: ...")
            fragment.output("def __iter__(self) -> Iterator[str]: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString_Runs:")
        fragment.indent {
            fragment.output("@property")
            fragment.output("def start_index(self) -> Runtime_AttributedString_Runs_Index: ...")
            fragment.output("@property")
            fragment.output("def end_index(self) -> Runtime_AttributedString_Runs_Index: ...")
            fragment.output("def index_before(self, index: Runtime_AttributedString_Runs_Index) -> Runtime_AttributedString_Runs_Index: ...")
            fragment.output("def index_after(self, index: Runtime_AttributedString_Runs_Index) -> Runtime_AttributedString_Runs_Index: ...")
            fragment.output("def element_at(self, index: Runtime_AttributedString_Runs_Index) -> Runtime_AttributedString_Runs_Run: ...")
            fragment.output("def element_at_position(self, index: Runtime_AttributedString_Index) -> Runtime_AttributedString_Runs_Run: ...")
            fragment.output("def __getitem__(self, index: Runtime_AttributedString_Runs_Index | Runtime_AttributedString_Index) -> Runtime_AttributedString_Runs_Run: ...")
            fragment.output("def __iter__(self) -> Iterator[Runtime_AttributedString_Runs_Run]: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedString:")
        fragment.indent {
            fragment.output("def __init__(self, value: str | Runtime_AttributedSubstring | None = ..., attributes: Runtime_AttributeContainer | None = ...) -> None: ...")
            fragment.output("@classmethod")
            fragment.output("def create_empty(cls) -> Runtime_AttributedString: ...")
            fragment.output("@classmethod")
            fragment.output("def create(cls, value: str, attributes: Runtime_AttributeContainer | None = ...) -> Runtime_AttributedString: ...")
            fragment.output("@classmethod")
            fragment.output("def create_from_substring(cls, substring: Runtime_AttributedSubstring) -> Runtime_AttributedString: ...")
            fragment.output("@property")
            fragment.output("def string(self) -> str: ...")
            fragment.output("@property")
            fragment.output("def runs(self) -> Runtime_AttributedString_Runs: ...")
            fragment.output("@property")
            fragment.output("def characters(self) -> Runtime_AttributedString_CharacterView: ...")
            fragment.output("@property")
            fragment.output("def unicode_scalars(self) -> Runtime_AttributedString_UnicodeScalarView: ...")
            fragment.output("@property")
            fragment.output("def substring(self) -> Runtime_AttributedSubstring: ...")
            fragment.output("@property")
            fragment.output("def start_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("@property")
            fragment.output("def end_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("def append(self, attributed_string: Runtime_AttributedString) -> None: ...")
            fragment.output("def append_substring(self, substring: Runtime_AttributedSubstring) -> None: ...")
            fragment.output("def insert(self, attributed_string: Runtime_AttributedString, index: Runtime_AttributedString_Index) -> None: ...")
            fragment.output("def insert_substring(self, substring: Runtime_AttributedSubstring, index: Runtime_AttributedString_Index) -> None: ...")
            fragment.output("def replace_subrange(self, range: SwiftRange[Runtime_AttributedString_Index], attributed_string: Runtime_AttributedString) -> None: ...")
            fragment.output("def replace_subrange_with_substring(self, range: SwiftRange[Runtime_AttributedString_Index], substring: Runtime_AttributedSubstring) -> None: ...")
            fragment.output("def remove_subrange(self, range: SwiftRange[Runtime_AttributedString_Index]) -> None: ...")
            fragment.output("def set_attributes(self, attributes: Runtime_AttributeContainer) -> None: ...")
            fragment.output("def set_attributes_for_range(self, range: SwiftRange[Runtime_AttributedString_Index], attributes: Runtime_AttributeContainer) -> None: ...")
            fragment.output("def merge_attributes(self, attributes: Runtime_AttributeContainer, keep_current: bool = ...) -> None: ...")
            fragment.output("def merge_attributes_for_range(self, range: SwiftRange[Runtime_AttributedString_Index], attributes: Runtime_AttributeContainer, keep_current: bool = ...) -> None: ...")
            fragment.output("def replace_attributes(self, attributes: Runtime_AttributeContainer, others: Runtime_AttributeContainer) -> None: ...")
            fragment.output("def replace_attributes_for_range(self, range: SwiftRange[Runtime_AttributedString_Index], attributes: Runtime_AttributeContainer, others: Runtime_AttributeContainer) -> None: ...")
            fragment.output("def copy(self) -> Runtime_AttributedString: ...")
            fragment.output("def __copy__(self) -> Runtime_AttributedString: ...")
            fragment.output("def __add__(self, other: Runtime_AttributedString | Runtime_AttributedSubstring | str) -> Runtime_AttributedString: ...")
            fragment.output("def substring_for_range(self, range: SwiftRange[Runtime_AttributedString_Index]) -> Runtime_AttributedSubstring: ...")
            fragment.output("def __getitem__(self, range: SwiftRange[Runtime_AttributedString_Index]) -> Runtime_AttributedSubstring: ...")
            fragment.output("def __setitem__(self, range: SwiftRange[Runtime_AttributedString_Index], value: Runtime_AttributedString | Runtime_AttributedSubstring | str) -> None: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributedSubstring:")
        fragment.indent {
            fragment.output("def __init__(self) -> None: ...")
            fragment.output("@classmethod")
            fragment.output("def create_empty(cls) -> Runtime_AttributedSubstring: ...")
            fragment.output("@property")
            fragment.output("def base(self) -> Runtime_AttributedString: ...")
            fragment.output("@property")
            fragment.output("def string(self) -> str: ...")
            fragment.output("@property")
            fragment.output("def runs(self) -> Runtime_AttributedString_Runs: ...")
            fragment.output("@property")
            fragment.output("def characters(self) -> Runtime_AttributedString_CharacterView: ...")
            fragment.output("@property")
            fragment.output("def unicode_scalars(self) -> Runtime_AttributedString_UnicodeScalarView: ...")
            fragment.output("@property")
            fragment.output("def start_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("@property")
            fragment.output("def end_index(self) -> Runtime_AttributedString_Index: ...")
            fragment.output("@property")
            fragment.output("def substring(self) -> Runtime_AttributedSubstring: ...")
            fragment.output("def substring_for_range(self, range: SwiftRange[Runtime_AttributedString_Index]) -> Runtime_AttributedSubstring: ...")
            fragment.output("def __getitem__(self, range: SwiftRange[Runtime_AttributedString_Index]) -> Runtime_AttributedSubstring: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributeContainer_FoundationAttributes:")
        fragment.indent {
            fragment.output("def __init__(self) -> None: ...")
            fragment.output("@classmethod")
            fragment.output("def create_empty(cls) -> Runtime_AttributeContainer_FoundationAttributes: ...")
            fragment.output("@classmethod")
            fragment.output("def create_from_container(cls, container: Runtime_AttributeContainer) -> Runtime_AttributeContainer_FoundationAttributes: ...")
            fragment.output("@property")
            fragment.output("def link(self) -> str | None: ...")
            fragment.output("@link.setter")
            fragment.output("def link(self, value: str | None) -> None: ...")
            fragment.output("@property")
            fragment.output("def language_identifier(self) -> str | None: ...")
            fragment.output("@language_identifier.setter")
            fragment.output("def language_identifier(self, value: str | None) -> None: ...")
            fragment.output("def as_container(self) -> Runtime_AttributeContainer: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
        fragment.blankLine()
        fragment.output("class Runtime_AttributeContainer:")
        fragment.indent {
            fragment.output("def __init__(self) -> None: ...")
            fragment.output("@classmethod")
            fragment.output("def create_empty(cls) -> Runtime_AttributeContainer: ...")
            fragment.output("@property")
            fragment.output("def foundation(self) -> Runtime_AttributeContainer_FoundationAttributes: ...")
            fragment.output("def merge(self, other: Runtime_AttributeContainer, keep_current: bool = ...) -> None: ...")
            fragment.output("def __eq__(self, other: object) -> bool: ...")
            fragment.output("def __hash__(self) -> int: ...")
        }
    }

    private func outputDocstring(_ documentation: [String], into fragment: SourceFragment) {
        for line in PythonDocstring.lines(documentation) {
            fragment.output(line)
        }
    }

    private func classFragment(_ pythonClass: PythonClass) -> SourceFragment {
        let fragment = SourceFragment(destinationPath: "python/generated/src/\(pythonClass.fileName)")
        let isAssociatedEnum = hasAssociatedValues(pythonClass)
        let runtimeImports = pythonRuntimeImports(for: pythonClass)
        fragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        fragment.blankLine()
        fragment.output("from __future__ import annotations")
        fragment.blankLine()
        if pythonClass.setupKind == "value" || isAssociatedEnum {
            fragment.output("from dataclasses import dataclass")
        }
        if pythonClass.setupKind == "enum" && !isAssociatedEnum {
            fragment.output("import enum")
        }
        for importedModule in runtimeImports where importedModule.className.isEmpty {
            fragment.output(pythonImportStatement(importedModule))
        }
        if pythonClass.setupKind == "value" || pythonClass.setupKind == "enum" || runtimeImports.contains(where: \.className.isEmpty) {
            fragment.blankLine()
        }
        fragment.output("from . import _native")
        for importedType in runtimeImports where !importedType.className.isEmpty && (!importedType.isRelative || importedType.className != pythonClass.className) {
            fragment.output(pythonImportStatement(importedType))
        }
        for importedType in runtimeImports where !importedType.isRelative && !importedType.className.isEmpty {
            fragment.output("_native.register_external_type(\(importedType.className))")
        }
        fragment.blankLine()
        for symbol in boundSymbols(for: pythonClass) {
            fragment.output("\(pythonFunctionName(for: symbol)) = _native.bind(\"\(symbol)\")")
        }
        if !boundSymbols(for: pythonClass).isEmpty {
            fragment.blankLine()
        }
        let baseClass: String
        switch pythonClass.setupKind {
        case "emptyValue":
            baseClass = "(_native.IotaObject)"
        case "reference":
            baseClass = "(_native.SwiftReference)"
        case "enum":
            baseClass = isAssociatedEnum ? "" : "(enum.Enum)"
        case "protocol":
            baseClass = "(_native.SwiftReference)"
        default:
            baseClass = ""
        }
        // A settable static/class property cannot be wired through a class-namespace
        // descriptor: `Klass.attr = value` is dispatched by the metaclass, not by a
        // descriptor living in the class body, so its __set__ never fires. Emit a
        // per-class metaclass carrying a real property(get, set) — composed with
        // enum.EnumMeta for enums — matching the get+set surface every other language
        // target exposes for a settable Swift `static var`.
        let settableStaticFields = pythonClass.fields.filter { $0.isStatic && $0.setterSymbol != nil }
        let classHeaderBases: String
        if settableStaticFields.isEmpty {
            classHeaderBases = baseClass
        } else {
            let metaclassName = "_\(pythonClass.className)Meta"
            let baseMetaclass = (pythonClass.setupKind == "enum" && !isAssociatedEnum) ? "enum.EnumMeta" : "type"
            fragment.output("class \(metaclassName)(\(baseMetaclass)):")
            fragment.indent {
                for field in settableStaticFields.sorted(by: { $0.pythonName < $1.pythonName }) {
                    let fieldFunction = pythonFunctionName(for: field.symbol)
                    let setterFunction = pythonFunctionName(for: field.setterSymbol!)
                    let getterExpression: String
                    if let returnConversion = field.returnConversion {
                        getterExpression = convertedInvocation(function: fieldFunction, args: [], conversion: returnConversion)
                    } else {
                        getterExpression = "_native.check(lambda exn: \(fieldFunction)(_native.env, exn))"
                    }
                    let setterConversion = field.returnConversion ?? "None"
                    fragment.output("@property")
                    fragment.output("def \(field.pythonName)(cls):")
                    fragment.indent {
                        outputDocstring(field.documentation, into: fragment)
                        if let deprecationMessage = field.deprecationMessage {
                            fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                        }
                        fragment.output("return \(getterExpression)")
                    }
                    fragment.output("@\(field.pythonName).setter")
                    fragment.output("def \(field.pythonName)(cls, value):")
                    fragment.indent {
                        if let deprecationMessage = field.deprecationMessage {
                            fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                        }
                        fragment.output("_native.call(\(setterFunction), args=[value], arg_conversions=[\(setterConversion)])")
                    }
                }
            }
            fragment.blankLine()
            if baseClass.isEmpty {
                classHeaderBases = "(metaclass=\(metaclassName))"
            } else {
                let inner = String(baseClass.dropFirst().dropLast())
                classHeaderBases = "(\(inner), metaclass=\(metaclassName))"
            }
        }
        if pythonClass.setupKind == "value" {
            fragment.output(pythonClass.isValueHashable ? "@dataclass(unsafe_hash=True)" : "@dataclass")
        }
        fragment.output("class \(pythonClass.className)\(classHeaderBases):")
        fragment.indent {
            outputDocstring(pythonClass.documentation, into: fragment)
            let origins = ([("__type__", pythonClass.originName)] +
                pythonClass.fields.map { ($0.pythonName, $0.originName) } +
                pythonClass.methods.map { ($0.pythonName, $0.originName) })
                .sorted { $0.0 < $1.0 }
            fragment.output("__fishyjoes_origin__ = {")
            fragment.indent {
                for (name, origin) in origins {
                    fragment.output("\(pythonStringLiteral(name)): \(pythonStringLiteral(origin)),")
                }
            }
            fragment.output("}")
            if !pythonClass.enumCases.isEmpty || !pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty || !pythonClass.storedFields.isEmpty {
                fragment.blankLine()
            }
            if pythonClass.setupKind == "enum" && !isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("\(enumCase.pythonName) = \"\(enumCase.cName)\"")
                }
                if !pythonClass.enumCases.isEmpty, !pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty {
                    fragment.blankLine()
                }
            } else if isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("@classmethod")
                    let signature = enumCase.values.map(\.pythonName).joined(separator: ", ")
                    let allSignatureParams = signature.isEmpty ? "cls" : "cls, \(signature)"
                    fragment.output("def \(enumCase.pythonName)(\(allSignatureParams)):")
                    fragment.indent {
                        outputDocstring(enumCase.documentation, into: fragment)
                        let args = enumCase.values.map(\.pythonName).joined(separator: ", ")
                        fragment.output("return \(enumCase.className)(\(args))")
                    }
                    fragment.blankLine()
                }
            }
            if pythonClass.setupKind == "value" {
                for field in pythonClass.storedFields {
                    fragment.output("\(field.pythonName): object")
                }
                if !pythonClass.storedFields.isEmpty, !pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty {
                    fragment.blankLine()
                }
            }
            if pythonClass.fields.isEmpty, pythonClass.methods.isEmpty, pythonClass.storedFields.isEmpty, pythonClass.enumCases.isEmpty, pythonClass.equalsSymbol == nil, pythonClass.hashSymbol == nil {
                fragment.output("pass")
            } else {
                for field in pythonClass.fields.sorted(by: { $0.pythonName < $1.pythonName }) {
                    let fieldFunction = pythonFunctionName(for: field.symbol)
                    if field.isStatic {
                        if field.setterSymbol != nil {
                            // Settable statics are emitted on the per-class metaclass above.
                            continue
                        }
                        let valueExpression: String
                        if let returnConversion = field.returnConversion {
                            valueExpression = convertedInvocation(function: fieldFunction, args: [], conversion: returnConversion)
                        } else {
                            valueExpression = "_native.check(lambda exn: \(fieldFunction)(_native.env, exn))"
                        }
                        if field.asMethod {
                            fragment.output("@staticmethod")
                            fragment.output("def \(field.pythonName)():")
                            fragment.indent {
                                outputDocstring(field.documentation, into: fragment)
                                if let deprecationMessage = field.deprecationMessage {
                                    fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                                }
                                fragment.output("return \(valueExpression)")
                            }
                        } else {
                            // Always wrap in StaticProperty so the value is fetched lazily on
                            // each access. A read-only `static var { get }` can change between
                            // reads, so eagerly evaluating and freezing it at import time would
                            // serve a stale value.
                            if let deprecationMessage = field.deprecationMessage {
                                fragment.output("\(field.pythonName) = _native.StaticProperty(lambda: _native.deprecated_getter(lambda: \(valueExpression), \"\(deprecationMessage)\"))")
                            } else {
                                fragment.output("\(field.pythonName) = _native.StaticProperty(lambda: \(valueExpression))")
                            }
                        }
                    } else {
                        if !field.asMethod {
                            fragment.output("@property")
                        }
                        fragment.output("def \(field.pythonName)(self):")
                        fragment.indent {
                            outputDocstring(field.documentation, into: fragment)
                            if let deprecationMessage = field.deprecationMessage {
                                fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                            }
                            if let receiverConversion = selfConversion(for: pythonClass) {
                                let returnConversion = field.returnConversion ?? "None"
                                fragment.output("return _native.call(\(fieldFunction), args=[self], arg_conversions=[\(receiverConversion)], return_conversion=\(returnConversion))")
                            } else if let returnConversion = field.returnConversion {
                                fragment.output("return \(convertedInvocation(function: fieldFunction, args: ["self._iota_ref"], conversion: returnConversion))")
                            } else {
                                fragment.output("return _native.check(lambda exn: \(fieldFunction)(_native.env, self._iota_ref, exn))")
                            }
                        }
                        if !field.asMethod, let setterSymbol = field.setterSymbol {
                            let setterFunction = pythonFunctionName(for: setterSymbol)
                            fragment.output("@\(field.pythonName).setter")
                            fragment.output("def \(field.pythonName)(self, value):")
                            fragment.indent {
                                if let deprecationMessage = field.deprecationMessage {
                                    fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                                }
                                if let receiverConversion = selfConversion(for: pythonClass) {
                                    let conversion = field.returnConversion ?? "None"
                                    fragment.output("_native.call(\(setterFunction), args=[self, value], arg_conversions=[\(receiverConversion), \(conversion)])")
                                } else if field.returnConversion != nil {
                                    let conversion = field.returnConversion ?? "None"
                                    fragment.output("_native.call(\(setterFunction), args=[self._iota_ref, value], arg_conversions=[None, \(conversion)])")
                                } else {
                                    fragment.output("_native.check(lambda exn: \(setterFunction)(_native.env, self._iota_ref, value, exn))")
                                }
                            }
                        }
                    }
                }
                if !pythonClass.fields.isEmpty, !pythonClass.methods.isEmpty {
                    fragment.blankLine()
                }
                for method in pythonClass.methods.sorted(by: { $0.pythonName < $1.pythonName }) {
                    let methodFunction = pythonFunctionName(for: method.symbol)
                    let params = method.parameters.map(\.pythonName)
                    let conversions = method.parameters.map { $0.conversion ?? "None" }
                    let signatureParameters = method.parameters
                        .filter { $0.defaultValue == nil } +
                        method.parameters.filter { $0.defaultValue != nil }
                    let pythonParams = signatureParameters.map { parameter in
                        parameter.defaultValue.map { "\(parameter.pythonName)=\($0)" } ?? parameter.pythonName
                    }
                    let signatureParams = pythonParams.joined(separator: ", ")
                    if method.isStatic {
                        fragment.output("@staticmethod")
                    }
                    let allSignatureParams = method.isStatic ? signatureParams : (signatureParams.isEmpty ? "self" : "self, \(signatureParams)")
                    fragment.output("def \(method.pythonName)(\(allSignatureParams)):")
                    fragment.indent {
                        outputDocstring(method.documentation, into: fragment)
                        if let deprecationMessage = method.deprecationMessage {
                            fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                        }
                        let receiverConversion = method.isStatic ? nil : selfConversion(for: pythonClass)
                        if method.returnConversion != nil || method.parameters.contains(where: { $0.conversion != nil }) || receiverConversion != nil {
                            let nativeArgs = method.isStatic ? params : [(receiverConversion == nil ? "self._iota_ref" : "self")] + params
                            let receiverConversions = method.isStatic ? [] : [receiverConversion ?? "None"]
                            let nativeConversions = receiverConversions + conversions
                            let args = nativeArgs.isEmpty ? "[]" : "[\(nativeArgs.joined(separator: ", "))]"
                            let returnConversion = method.returnConversion ?? "None"
                            fragment.output("return _native.call(\(methodFunction), args=\(args), arg_conversions=[\(nativeConversions.joined(separator: ", "))], return_conversion=\(returnConversion))")
                        } else {
                            let nativeArgs = method.isStatic ? params : ["self._iota_ref"] + params
                            let args = (nativeArgs + ["exn"]).joined(separator: ", ")
                            fragment.output("return _native.check(lambda exn: \(methodFunction)(_native.env, \(args)))")
                        }
                    }
                }
            }
            // Equatable/Hashable conformances must wire __eq__/__hash__ whether or not
            // the type also has fields or methods. A member-less but Equatable reference
            // type (e.g. a marker struct) still compares by value in Swift and in the
            // other targets, so emitting these only inside the has-members branch above
            // would silently downgrade it to identity equality.
            if let equalsSymbol = pythonClass.equalsSymbol {
                let equalsFunction = pythonFunctionName(for: equalsSymbol)
                fragment.output("def __eq__(self, other):")
                fragment.indent {
                    fragment.output("if not isinstance(other, \(pythonClass.className)):")
                    fragment.indent {
                        fragment.output("return False")
                    }
                    fragment.output("return bool(_native.check(lambda exn: \(equalsFunction)(_native.env, self._iota_ref, other._iota_ref, exn)))")
                }
            }
            if let hashSymbol = pythonClass.hashSymbol {
                let hashFunction = pythonFunctionName(for: hashSymbol)
                fragment.output("def __hash__(self):")
                fragment.indent {
                    fragment.output("return _native.check(lambda exn: \(hashFunction)(_native.env, self._iota_ref, exn))")
                }
            }
        }
        if isAssociatedEnum {
            for enumCase in pythonClass.enumCases {
                fragment.blankLine()
                fragment.output("@dataclass(frozen=True)")
                fragment.output("class \(enumCase.className)(\(pythonClass.className)):")
                fragment.indent {
                    outputDocstring(enumCase.documentation, into: fragment)
                    if enumCase.values.isEmpty {
                        fragment.output("pass")
                    } else {
                        for value in enumCase.values {
                            fragment.output("\(value.pythonName): object")
                        }
                    }
                }
            }
            fragment.blankLine()
            for enumCase in pythonClass.enumCases {
                fragment.output("setattr(\(pythonClass.className), \"\(upperCaseFirst(enumCase.cName))\", \(enumCase.className))")
            }
        }
        if let setupName = pythonClass.setupName {
            fragment.blankLine()
            let setupFunction = pythonFunctionName(for: setupName)
            fragment.output(setupTypeStatement(for: pythonClass, setupFunction: setupFunction, nativeModuleName: "_native"))
            fragment.blankLine()
            fragment.output("def _fishyjoes_setup_external(target_native):")
            fragment.indent {
                fragment.output(
                    setupTypeStatement(for: pythonClass, setupFunction: setupFunction, nativeModuleName: "target_native")
                )
            }
        }
        return fragment
    }

    private func classStubFragment(_ pythonClass: PythonClass) -> SourceFragment {
        let fileName = pythonClass.fileName.replacingOccurrences(of: ".py", with: ".pyi")
        let isAssociatedEnum = hasAssociatedValues(pythonClass)
        let shadowedBuiltinTypes = pythonShadowedBuiltinTypes(in: pythonClass)
        let stubImports = pythonStubImports(for: pythonClass)
        let shadowedImportedTypes = pythonShadowedImportedTypes(in: pythonClass, imports: stubImports)
        let fragment = SourceFragment(destinationPath: "python/generated/src/\(fileName)")
        fragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        fragment.blankLine()
        // PEP 702 deprecation markers only decorate function-shaped members.
        // Deprecated static properties therefore render as deprecated
        // properties on a synthesized metaclass, which pyright and mypy honor
        // for class-level attribute access. Simple enums keep ClassVar
        // attributes because their stub already inherits enum.EnumMeta.
        let stubMetaclassFields = (pythonClass.setupKind == "enum" && !isAssociatedEnum)
            ? []
            : pythonClass.fields
                .filter { $0.isStatic && !$0.asMethod && $0.deprecationMessage != nil }
                .sorted { $0.pythonName < $1.pythonName }
        let stubMetaclassFieldNames = Set(stubMetaclassFields.map(\.pythonName))
        // Import only the typing / collections.abc names this stub actually
        // uses, so a precisely-typed stub (e.g. a Range stub annotated only with
        // `SwiftRange[int]`) does not import an unused `Any` and degrade the
        // "no member fell back to Any" guarantee into a false positive.
        // `ClassVar` is structural (static fields + associated-enum case
        // attributes); the others are detected from the emitted annotations.
        let stubAnnotations = pythonStubAnnotationStrings(for: pythonClass, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes)
        func stubUses(_ token: String) -> Bool {
            let pattern = "(?<![\\w.])\(token)(?![\\w])"
            return stubAnnotations.contains { $0.range(of: pattern, options: .regularExpression) != nil }
        }
        var collectionsAbcNames: [String] = []
        if stubUses("Awaitable") { collectionsAbcNames.append("Awaitable") }
        if stubUses("Callable") { collectionsAbcNames.append("Callable") }
        if !collectionsAbcNames.isEmpty {
            fragment.output("from collections.abc import \(collectionsAbcNames.joined(separator: ", "))")
        }
        if pythonClass.setupKind == "value" || isAssociatedEnum {
            fragment.output("from dataclasses import dataclass")
        }
        var typingNames: [String] = []
        if stubUses("Any") { typingNames.append("Any") }
        // Every class stub declares `__fishyjoes_origin__: ClassVar[dict[str, str]]`,
        // so ClassVar is always imported.
        typingNames.append("ClassVar")
        if stubUses("NoReturn") { typingNames.append("NoReturn") }
        if !typingNames.isEmpty {
            fragment.output("from typing import \(typingNames.joined(separator: ", "))")
        }
        let needsDeprecatedImport = !stubMetaclassFields.isEmpty
            || pythonClass.methods.contains { $0.deprecationMessage != nil }
            || pythonClass.fields.contains { $0.deprecationMessage != nil && ($0.asMethod || !$0.isStatic) }
        if needsDeprecatedImport {
            fragment.output("from typing_extensions import deprecated")
        }
        if !shadowedBuiltinTypes.isEmpty {
            fragment.output("import builtins")
        }

        func outputStubFunction(_ declaration: String, documentation: [String]) {
            let docstring = PythonDocstring.lines(documentation)
            if docstring.isEmpty {
                fragment.output("\(declaration): ...")
            } else {
                fragment.output("\(declaration):")
                fragment.indent {
                    for line in docstring {
                        fragment.output(line)
                    }
                }
            }
        }
        if pythonClass.setupKind == "enum" && !isAssociatedEnum {
            fragment.output("import enum")
        }
        for importedModule in stubImports where importedModule.className.isEmpty {
            fragment.output(pythonImportStatement(importedModule))
        }
        for importedType in stubImports where !importedType.className.isEmpty && importedType.className != pythonClass.className {
            fragment.output(pythonImportStatement(importedType))
        }
        if !shadowedImportedTypes.isEmpty {
            fragment.blankLine()
            fragment.output("# Class-body attributes shadow these imported types inside the class")
            fragment.output("# scope; annotations reference them through module-level aliases.")
            for shadowedType in shadowedImportedTypes.sorted() {
                fragment.output("_\(shadowedType) = \(shadowedType)")
            }
        }
        fragment.blankLine()

        let baseClass: String
        switch pythonClass.setupKind {
        case "enum":
            baseClass = isAssociatedEnum ? "" : "(enum.Enum)"
        default:
            baseClass = ""
        }
        var classHeaderBases = baseClass
        if !stubMetaclassFields.isEmpty {
            let metaclassName = "_\(pythonClass.className)Meta"
            fragment.output("class \(metaclassName)(type):")
            fragment.indent {
                for field in stubMetaclassFields {
                    let returnAnnotation = pythonTypeAnnotation(field.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes)
                    fragment.output("@property")
                    fragment.output("@deprecated(\"\(field.deprecationMessage!)\")")
                    outputStubFunction("def \(field.pythonName)(cls) -> \(returnAnnotation)", documentation: field.documentation)
                    if field.setterSymbol != nil {
                        fragment.output("@\(field.pythonName).setter")
                        fragment.output("def \(field.pythonName)(cls, value: \(returnAnnotation)) -> None: ...")
                    }
                }
            }
            fragment.blankLine()
            if baseClass.isEmpty {
                classHeaderBases = "(metaclass=\(metaclassName))"
            } else {
                let inner = String(baseClass.dropFirst().dropLast())
                classHeaderBases = "(\(inner), metaclass=\(metaclassName))"
            }
        }
        if pythonClass.setupKind == "value" {
            fragment.output(pythonClass.isValueHashable ? "@dataclass(unsafe_hash=True)" : "@dataclass")
        }
        fragment.output("class \(pythonClass.className)\(classHeaderBases):")
        fragment.indent {
            let classDocstring = PythonDocstring.lines(pythonClass.documentation)
            for line in classDocstring {
                fragment.output(line)
            }
            var emittedMember = !classDocstring.isEmpty
            // The runtime emits a __fishyjoes_origin__ dict on every generated
            // class (Python member name -> its Swift origin name; the runtime
            // reads __type__ for FFI type identification, and diagnostics/naming
            // tests read the rest). Declare it so the stub matches the runtime,
            // rather than suppressing a real attribute in the stubtest allowlist.
            fragment.output("__fishyjoes_origin__: ClassVar[dict[str, str]]")
            emittedMember = true
            if pythonClass.setupKind == "enum" && !isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("\(enumCase.pythonName) = ...")
                    outputDocstring(enumCase.documentation, into: fragment)
                    emittedMember = true
                }
            } else if isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    let parameters = enumCase.values.map {
                        "\($0.pythonName): \(pythonTypeAnnotation($0.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))"
                    }.joined(separator: ", ")
                    let signature = parameters.isEmpty ? "cls" : "cls, \(parameters)"
                    fragment.output("@classmethod")
                    outputStubFunction(
                        "def \(enumCase.pythonName)(\(signature)) -> \(pythonClass.className)",
                        documentation: enumCase.documentation
                    )
                    let caseTypeName = upperCaseFirst(enumCase.cName)
                    if canEmitPythonStubAttribute(caseTypeName) {
                        fragment.output("\(caseTypeName): ClassVar[type[\(enumCase.className)]]")
                    }
                    emittedMember = true
                }
            }
            if pythonClass.setupKind == "value" {
                for field in pythonClass.storedFields {
                    fragment.output("\(field.pythonName): \(pythonTypeAnnotation(field.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))")
                    outputDocstring(field.documentation, into: fragment)
                    emittedMember = true
                }
                let constructorParams = pythonClass.storedFields.map { field in
                    "\(field.pythonName): \(pythonTypeAnnotation(field.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))"
                }
                let signature = (["self"] + constructorParams).joined(separator: ", ")
                fragment.output("def __init__(\(signature)) -> None: ...")
                emittedMember = true
            }
            for field in pythonClass.fields.sorted(by: { $0.pythonName < $1.pythonName }) {
                let returnAnnotation = pythonTypeAnnotation(field.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes)
                if field.asMethod {
                    if let deprecationMessage = field.deprecationMessage {
                        fragment.output("@deprecated(\"\(deprecationMessage)\")")
                    }
                    if field.isStatic {
                        fragment.output("@staticmethod")
                        outputStubFunction("def \(field.pythonName)() -> \(returnAnnotation)", documentation: field.documentation)
                    } else {
                        outputStubFunction("def \(field.pythonName)(self) -> \(returnAnnotation)", documentation: field.documentation)
                    }
                } else if field.isStatic {
                    if stubMetaclassFieldNames.contains(field.pythonName) {
                        // Rendered as a deprecated metaclass property above.
                        continue
                    }
                    fragment.output("\(field.pythonName): ClassVar[\(returnAnnotation)]")
                    outputDocstring(field.documentation, into: fragment)
                } else {
                    fragment.output("@property")
                    if let deprecationMessage = field.deprecationMessage {
                        fragment.output("@deprecated(\"\(deprecationMessage)\")")
                    }
                    outputStubFunction("def \(field.pythonName)(self) -> \(returnAnnotation)", documentation: field.documentation)
                    if field.setterSymbol != nil {
                        fragment.output("@\(field.pythonName).setter")
                        fragment.output("def \(field.pythonName)(self, value: \(returnAnnotation)) -> None: ...")
                    }
                }
                emittedMember = true
            }
            for method in pythonClass.methods.sorted(by: { $0.pythonName < $1.pythonName }) {
                if let deprecationMessage = method.deprecationMessage {
                    fragment.output("@deprecated(\"\(deprecationMessage)\")")
                }
                if method.isStatic {
                    fragment.output("@staticmethod")
                }
                let signatureParameters = method.parameters
                    .filter { $0.defaultValue == nil } +
                    method.parameters.filter { $0.defaultValue != nil }
                let pythonParams = signatureParameters.map { parameter in
                    let parameterAnnotation = pythonTypeAnnotation(parameter.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes)
                    return parameter.defaultValue.map { "\(parameter.pythonName): \(parameterAnnotation) = \($0)" } ?? "\(parameter.pythonName): \(parameterAnnotation)"
                }
                let signatureParams = pythonParams.joined(separator: ", ")
                let allSignatureParams = method.isStatic ? signatureParams : (signatureParams.isEmpty ? "self" : "self, \(signatureParams)")
                let returnAnnotation = pythonTypeAnnotation(method.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes)
                outputStubFunction("def \(method.pythonName)(\(allSignatureParams)) -> \(returnAnnotation)", documentation: method.documentation)
                emittedMember = true
            }
            if pythonClass.equalsSymbol != nil {
                fragment.output("def __eq__(self, other: object) -> bool: ...")
                emittedMember = true
            }
            if pythonClass.hashSymbol != nil || pythonClass.isValueHashable {
                fragment.output("def __hash__(self) -> int: ...")
                emittedMember = true
            }
            if !emittedMember {
                fragment.output("pass")
            }
        }
        if isAssociatedEnum {
            for enumCase in pythonClass.enumCases {
                fragment.blankLine()
                fragment.output("@dataclass(frozen=True)")
                fragment.output("class \(enumCase.className)(\(pythonClass.className)):")
                fragment.indent {
                    let caseDocstring = PythonDocstring.lines(enumCase.documentation)
                    for line in caseDocstring {
                        fragment.output(line)
                    }
                    if enumCase.values.isEmpty {
                        if caseDocstring.isEmpty {
                            fragment.output("pass")
                        }
                    } else {
                        for value in enumCase.values {
                            fragment.output("\(value.pythonName): \(pythonTypeAnnotation(value.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))")
                        }
                    }
                }
            }
        }
        return fragment
    }

    /// Every type-annotation string the `.pyi` stub body emits, used to decide
    /// which `typing` / `collections.abc` names the stub must import. Covers the
    /// same member set as `pythonStubImports` (all stored fields, fields,
    /// methods, parameters, and enum-case values), so a name used anywhere in
    /// the stub body — including metaclass-rendered deprecated static
    /// properties, which still annotate via `pythonReturnType` — is detected.
    private func pythonStubAnnotationStrings(for pythonClass: PythonClass, shadowedBuiltinTypes: Set<String>, shadowedImportedTypes: Set<String>) -> [String] {
        var annotations: [String] = []
        annotations += pythonClass.storedFields.map { pythonTypeAnnotation($0.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes) }
        for enumCase in pythonClass.enumCases {
            annotations += enumCase.values.map { pythonTypeAnnotation($0.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes) }
        }
        for field in pythonClass.fields {
            annotations.append(pythonTypeAnnotation(field.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))
        }
        for method in pythonClass.methods {
            annotations.append(pythonTypeAnnotation(method.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes))
            annotations += method.parameters.map { pythonTypeAnnotation($0.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes, shadowedImportedTypes: shadowedImportedTypes) }
        }
        return annotations
    }

    private func pythonShadowedBuiltinTypes(in pythonClass: PythonClass) -> Set<String> {
        let builtinTypeNames: Set<String> = ["bool", "bytes", "dict", "float", "int", "list", "set", "str", "tuple"]
        return pythonClassAttributeNames(of: pythonClass).intersection(builtinTypeNames)
    }

    /// Every name bound in the class body of the generated stub. An annotation
    /// inside the class resolves against these before the module scope, so any
    /// imported type sharing a name with one of them must be referenced through
    /// a module-level alias instead (see `pythonShadowedImportedTypes`).
    private func pythonClassAttributeNames(of pythonClass: PythonClass) -> Set<String> {
        var memberNames = Set<String>()
        memberNames.formUnion(pythonClass.storedFields.map(\.pythonName))
        memberNames.formUnion(pythonClass.fields.map(\.pythonName))
        memberNames.formUnion(pythonClass.methods.map(\.pythonName))
        for enumCase in pythonClass.enumCases {
            memberNames.insert(enumCase.pythonName)
            memberNames.formUnion(enumCase.values.map(\.pythonName))
            // Associated-enum case types are exposed as class-level
            // `ClassVar[type[...]]` attributes named after the case.
            memberNames.insert(upperCaseFirst(enumCase.cName))
        }
        return memberNames
    }

    /// Imported type names that a class-body attribute shadows. Inside the
    /// class, `Assembly` resolves to the class attribute (e.g. a case-type
    /// ClassVar), so annotations meaning the imported `Assembly` type must use
    /// a module-level `_Assembly = Assembly` alias. Generated member names can
    /// never start with an underscore, so the alias cannot itself be shadowed.
    private func pythonShadowedImportedTypes(in pythonClass: PythonClass, imports: [PythonImport]) -> Set<String> {
        let importedTypeNames = Set(imports.map(\.className).filter { !$0.isEmpty && $0 != pythonClass.className })
        return pythonClassAttributeNames(of: pythonClass).intersection(importedTypeNames)
    }

    private func pythonTypeAnnotation(_ type: PythonType, shadowedBuiltinTypes: Set<String>, shadowedImportedTypes: Set<String> = []) -> String {
        var annotation = type.annotation
        for builtinType in shadowedBuiltinTypes.sorted(by: { $0.count > $1.count }) {
            annotation = annotation.replacingOccurrences(
                of: #"(?<![\w.])\#(builtinType)(?![\w])"#,
                with: "builtins.\(builtinType)",
                options: .regularExpression
            )
        }
        for importedType in shadowedImportedTypes.sorted(by: { $0.count > $1.count }) {
            annotation = annotation.replacingOccurrences(
                of: #"(?<![\w.])\#(importedType)(?![\w])"#,
                with: "_\(importedType)",
                options: .regularExpression
            )
        }
        return annotation
    }

    private func pythonStubImports(for pythonClass: PythonClass) -> [PythonImport] {
        var imports = Set<PythonImport>()
        for field in pythonClass.storedFields {
            imports.formUnion(field.pythonType.imports)
        }
        for enumCase in pythonClass.enumCases {
            for value in enumCase.values {
                imports.formUnion(value.pythonType.imports)
            }
        }
        for field in pythonClass.fields {
            imports.formUnion(field.pythonReturnType.imports)
        }
        for method in pythonClass.methods {
            imports.formUnion(method.pythonReturnType.imports)
            for parameter in method.parameters {
                imports.formUnion(parameter.pythonType.imports)
                imports.formUnion(parameter.defaultValueImports)
            }
        }
        return imports.sorted {
            ($0.moduleName, $0.className) < ($1.moduleName, $1.className)
        }
    }

    private func pythonRuntimeImports(for pythonClass: PythonClass) -> [PythonImport] {
        var imports = Set<PythonImport>()
        for field in pythonClass.storedFields {
            imports.formUnion(field.pythonType.imports.filter { !$0.isRelative })
        }
        for enumCase in pythonClass.enumCases {
            for value in enumCase.values {
                imports.formUnion(value.pythonType.imports.filter { !$0.isRelative })
            }
        }
        for field in pythonClass.fields {
            imports.formUnion(field.pythonReturnType.imports.filter { !$0.isRelative })
        }
        for method in pythonClass.methods {
            imports.formUnion(method.pythonReturnType.imports.filter { !$0.isRelative })
            for parameter in method.parameters {
                imports.formUnion(parameter.pythonType.imports.filter { !$0.isRelative })
                imports.formUnion(parameter.defaultValueImports)
            }
        }
        return imports.sorted {
            ($0.moduleName, $0.className) < ($1.moduleName, $1.className)
        }
    }

    private func pythonImportStatement(_ importedType: PythonImport) -> String {
        if importedType.className.isEmpty {
            return "import \(importedType.moduleName)"
        }
        let prefix = importedType.isRelative ? "." : ""
        return "from \(prefix)\(importedType.moduleName) import \(importedType.className) as \(importedType.className)"
    }

    private func pythonClass(for type: TranslatedType, context: FishyJoesContext) -> PythonClass? {
        let className: String
        let fields: [Field]
        let methods: [Method]
        let setupKind: String?
        let equalsSymbol: String?
        let hashSymbol: String?
        let isValueHashable: Bool
        let storedFields: [NativeStoredField]
        let enumCases: [NativeEnumCase]
        let typeDocumentation: [String]

        switch type {
        case let translatedEnum as TranslatedEnum:
            className = pythonClassName(translatedEnum.nodeName)
            fields = translatedEnum.fields
            methods = translatedEnum.methods
            typeDocumentation = translatedEnum.documentation
            setupKind = translatedEnum.isInhabited ? "enum" : nil
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = false
            storedFields = []
            let enumSourceName = translatedEnum.sourceType.name
            enumCases = translatedEnum.cases.compactMap { enumCase in
                let values = enumCase.associatedValues.compactMap { value -> NativeEnumCaseValue? in
                    let resolved = context.resolve(type: value.type)
                    guard let nativeType = pythonCType(
                        for: resolved,
                        context: context,
                        visitedStructs: [],
                        visitedProtocols: []
                    ) else {
                        // B2: an associated value with no Python representation
                        // drops its case (and, via the count guard, the whole enum).
                        context.warn("dropping enum \(enumSourceName): case `\(enumCase.name)` has an associated value with no Python type")
                        return nil
                    }
                    return NativeEnumCaseValue(
                        pythonName: value.bindingName,
                        cName: value.bindingName.mangled,
                        cType: nativeType.cType,
                        conversion: nativeType.conversion,
                        pythonType: nativeType.annotation
                    )
                }
                guard values.count == enumCase.associatedValues.count else {
                    return nil
                }
                return NativeEnumCase(
                    pythonName: enumCase.name,
                    cName: enumCase.name.mangled,
                    className: "\(className)_\(upperCaseFirst(enumCase.name))",
                    values: values,
                    documentation: enumCase.documentation
                )
            }
            guard enumCases.count == translatedEnum.cases.count else {
                return nil
            }
        case let translatedStruct as TranslatedStruct:
            className = pythonClassName(translatedStruct.nodeName)
            fields = translatedStruct.computedVariables
            methods = translatedStruct.methods
            typeDocumentation = translatedStruct.documentation
            let translatedFields = translatedStruct.storedVariables.compactMap {
                nativeStoredField($0, ownerName: translatedStruct.sourceType.name, context: context)
            }
            guard translatedFields.count == translatedStruct.storedVariables.count else {
                return nil
            }
            setupKind = translatedFields.isEmpty ? "emptyValue" : "value"
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = translatedStruct.hashable
            storedFields = translatedFields
            enumCases = []
        case let translatedReference as TranslatedReference:
            className = pythonClassName(translatedReference.nodeName)
            fields = translatedReference.computedVariables
            methods = translatedReference.methods
            typeDocumentation = translatedReference.documentation
            setupKind = "reference"
            equalsSymbol = translatedReference.equatable ? "__iota_\(translatedReference.sourceType.name.mangled)_equals" : nil
            hashSymbol = translatedReference.hashable ? "__iota_get_\(translatedReference.sourceType.name.mangled)_hash" : nil
            isValueHashable = false
            storedFields = []
            enumCases = []
        case let translatedProtocol as TranslatedProtocol:
            guard PythonTranslationContext(context: context).canGenerateProtocolType(translatedProtocol) else {
                context.warn("dropping protocol \(translatedProtocol.sourceType.name): a member has no Python type")
                return nil
            }
            className = pythonClassName(translatedProtocol.nodeName)
            fields = translatedProtocol.fields
            methods = translatedProtocol.methods
            typeDocumentation = translatedProtocol.documentation
            setupKind = "protocol"
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = false
            storedFields = []
            enumCases = []
        default:
            return nil
        }

        var finalStoredFields = storedFields
        var finalEnumCases = enumCases
        var nativeFields = fields.compactMap { nativeField($0, of: type, context: context) }
        var nativeMethods = methods.compactMap { nativeMethod($0, of: type, context: context) }
        let needsNominalType = setupKind == "reference"
        guard needsNominalType || !nativeFields.isEmpty || !nativeMethods.isEmpty || !storedFields.isEmpty || !enumCases.isEmpty else {
            return nil
        }
        disambiguateClassMemberNames(
            owner: type.sourceType.name,
            storedFields: &finalStoredFields,
            enumCases: &finalEnumCases,
            fields: &nativeFields,
            methods: &nativeMethods
        )

        let moduleName = pythonModuleName(className)
        return PythonClass(
            originName: type.sourceType.name,
            moduleName: moduleName,
            fileName: "\(context.pythonImportPackageName)/\(moduleName).py",
            className: className,
            setupName: setupKind == nil ? nil : type.iotaSetupName,
            setupKind: setupKind,
            equalsSymbol: equalsSymbol,
            hashSymbol: hashSymbol,
            isValueHashable: isValueHashable,
            storedFields: finalStoredFields,
            enumCases: finalEnumCases,
            fields: nativeFields,
            methods: nativeMethods,
            documentation: typeDocumentation
        )
    }

    private func nativeStoredField(_ field: Field, ownerName: String, context: FishyJoesContext) -> NativeStoredField? {
        let resolvedType = context.resolve(type: field.type)
        // R5: the value-type field descriptor is the call-site conversion when
        // present, otherwise derived from the C scalar type (exactly the old
        // `nativeType.conversion ?? pythonConversion(...)`).
        guard let nativeType = pythonCType(for: resolvedType, context: context),
              let conversion = nativeType.conversionDescriptor else {
            // B2: a stored field with no Python representation drops its owning
            // value type whole (the caller's count guard); name it here.
            context.warn("dropping value type \(ownerName): stored field `\(field.name)` has no Python type")
            return nil
        }
        return NativeStoredField(
            pythonName: field.name,
            cName: field.name.mangled,
            cType: nativeType.cType,
            conversion: conversion,
            pythonType: nativeType.annotation,
            isMutable: field.isMutable,
            documentation: field.documentation
        )
    }

    private func nativeField(_ field: Field, of type: TranslatedType, context: FishyJoesContext) -> NativeField? {
        guard field.isStatic || supportsInstanceMembers(for: type) else {
            return nil
        }
        guard let exportAnnotation = field.exportAnnotation else {
            return nil
        }
        let sourceName = type.sourceType.name
        let memberName = "\(sourceName).\(exportAnnotation.name)"
        let resolvedFieldType = context.resolve(type: field.type)
        let fieldType = field.isAsync ? TranslatedFuture(output: resolvedFieldType) : resolvedFieldType
        guard let returnType = pythonCType(for: fieldType, context: context) else {
            // B2: a field with no Python representation is dropped; surface it.
            context.warn("dropping property \(memberName): no Python type for its value")
            return nil
        }

        let cName = exportAnnotation.name.mangled
        let symbol = field.isDefaultImplementation
            ? "__iota__default_\(sourceName)_\(exportAnnotation.name)".mangled
            : "__iota_get_\(sourceName)_\(exportAnnotation.name)".mangled
        let setterSymbol = field.isPubliclyWritable
            ? "__iota_set_\(sourceName)_\(exportAnnotation.name)".mangled
            : nil

        return NativeField(
            pythonName: exportAnnotation.pythonName ?? exportAnnotation.name,
            isExplicitPythonName: exportAnnotation.pythonName != nil,
            cName: cName,
            symbol: symbol,
            setterSymbol: setterSymbol,
            isStatic: field.isStatic,
            asMethod: exportAnnotation.kind == .asMethod,
            returnType: returnType.cType,
            returnConversion: returnType.conversion,
            pythonReturnType: returnType.annotation,
            deprecationMessage: field.deprecation?.quotedMessage,
            originName: memberName,
            documentation: field.documentation
        )
    }

    private func nativeMethod(_ method: Method, of type: TranslatedType, context: FishyJoesContext) -> NativeMethod? {
        guard method.isStatic || supportsInstanceMembers(for: type) else {
            return nil
        }
        let sourceName = type.sourceType.name
        let memberName = "\(sourceName).\(method.exportAnnotation.name)"
        let resolvedReturnType = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
        let effectiveReturnType = method.isAsync ? TranslatedFuture(output: resolvedReturnType) : resolvedReturnType
        let returnType: PythonRepresentation
        if let supportedReturnType = pythonCType(for: effectiveReturnType, context: context) {
            returnType = supportedReturnType
        } else if method.exportAnnotation.noReturn {
            // R4: the synthetic `NoReturn` return type (a `@noReturn` method has
            // no translated return type) is constructed here in the translator,
            // not by any conformer.
            returnType = PythonRepresentation(
                annotation: PythonType(annotation: "NoReturn"),
                cType: "foreignObject",
                conversion: nil
            )
        } else {
            // B2: a method whose return type has no Python representation is
            // dropped; surface a diagnostic rather than silently disappearing.
            context.warn("dropping method \(memberName): no Python type for its return value")
            return nil
        }

        var parameters: [NativeParameter] = []
        for parameter in method.parameters {
            let resolvedParameterType = context.resolve(type: parameter.type, generics: method.exportAnnotation.genericOverrides)
            guard let cType = pythonCType(for: resolvedParameterType, context: context) else {
                // B2: a method with an unrepresentable parameter is dropped whole.
                context.warn("dropping method \(memberName): no Python type for parameter `\(parameter.name)`")
                return nil
            }
            let parameterName = swiftIdentifierName(parameter.name)
            var defaultValue: PythonDefaultValue?
            if let swiftDefaultValue = parameter.defaultValue {
                if let translatedDefaultValue = pythonDefaultValue(swiftDefaultValue, type: resolvedParameterType, context: context) {
                    defaultValue = translatedDefaultValue
                } else {
                    context.warnMissingDefault(parameter: parameter, in: method)
                }
            }
            parameters.append(NativeParameter(
                pythonName: parameterName,
                cName: parameterName.mangled,
                cType: cType.cType,
                conversion: cType.conversion,
                pythonType: cType.annotation,
                defaultValue: defaultValue?.expression,
                defaultValueImports: defaultValue?.imports ?? []
            ))
        }

        let symbol = "__iota_\(sourceName)_\(method.exportAnnotation.name)".mangled
        return NativeMethod(
            pythonName: method.exportAnnotation.pythonName ?? method.exportAnnotation.name,
            isExplicitPythonName: method.exportAnnotation.pythonName != nil,
            cName: method.exportAnnotation.name.mangled,
            symbol: symbol,
            isStatic: method.isStatic,
            parameters: parameters,
            returnType: returnType.cType,
            returnConversion: returnType.conversion,
            pythonReturnType: returnType.annotation,
            deprecationMessage: method.deprecation?.quotedMessage,
            originName: memberName,
            documentation: method.documentation
        )
    }

    private func pythonRepresentation(
        for type: TranslatedType,
        context: FishyJoesContext,
        visitedStructs: Set<String> = [],
        visitedProtocols: Set<String> = []
    ) -> PythonRepresentation? {
        type.pythonRepresentation(in: PythonTranslationContext(
            context: context,
            visitedStructs: visitedStructs,
            visitedProtocols: visitedProtocols
        ))
    }

    /// Thin delegator preserved for the translator's internal call sites: the
    /// bundled C ABI representation (cType + conversion) plus annotation. `nil`
    /// means "no C ABI representation" (the old `pythonCType == nil`).
    private func pythonCType(
        for type: TranslatedType,
        context: FishyJoesContext,
        visitedStructs: Set<String> = [],
        visitedProtocols: Set<String> = []
    ) -> PythonRepresentation? {
        pythonRepresentation(
            for: type,
            context: context,
            visitedStructs: visitedStructs,
            visitedProtocols: visitedProtocols
        )
    }

    /// Thin delegator: the Python annotation for `type`, or `nil` when the type
    /// has no C ABI representation (and therefore no annotation).
    private func pythonType(
        for type: TranslatedType,
        context: FishyJoesContext,
        visitedStructs: Set<String> = [],
        visitedProtocols: Set<String> = []
    ) -> PythonType? {
        pythonRepresentation(
            for: type,
            context: context,
            visitedStructs: visitedStructs,
            visitedProtocols: visitedProtocols
        )?.annotation
    }

    /// Thin delegator: the call-site conversion-descriptor expression for `type`,
    /// in the default `_native` namespace. Mirrors the old standalone
    /// `pythonConversion`, including its primitive behavior (a primitive's
    /// descriptor is derived from its C scalar type rather than carried as a
    /// call-site conversion).
    private func pythonConversion(
        for type: TranslatedType,
        context: FishyJoesContext,
        visitedStructs: Set<String> = [],
        visitedProtocols: Set<String> = []
    ) -> String? {
        pythonRepresentation(
            for: type,
            context: context,
            visitedStructs: visitedStructs,
            visitedProtocols: visitedProtocols
        )?.conversionDescriptor
    }

    /// A class member's Python name resolution input: the raw name (neutral
    /// export name, or a verbatim `python:` override), whether it is an
    /// explicit override, and where it came from for the collision diagnostic.
    private struct PythonMemberNameEntry {
        let rawName: String
        let isExplicit: Bool
        let origin: String
        /// The neutral export name to suggest annotating, when the member has
        /// an annotation surface (fields and methods; enum cases and stored
        /// fields do not).
        let annotatableName: String?
    }

    /// Resolves sibling member names, or dies on a collision. Names must not
    /// change based on other names in the same scope (matching the C# rule):
    /// keyword/builtin sanitization is per-name and deterministic, but when two
    /// distinct members still resolve to the same Python name the library
    /// developer must pick one explicitly via a `python:` export attribute —
    /// there is no silent `_2` suffixing anymore.
    private func resolvePythonMemberNames(_ entries: [PythonMemberNameEntry], owner: String) -> [String] {
        var seen: [String: PythonMemberNameEntry] = [:]
        var names: [String] = []
        for entry in entries {
            let name = entry.isExplicit ? entry.rawName : pythonSafeIdentifier(entry.rawName)
            if let previous = seen[name] {
                let remedyName = entry.annotatableName ?? previous.annotatableName
                let remedy = remedyName.map {
                    "Export one of them under a different Python name, e.g. /// <!-- FishyJoes.export(\($0), python: some_other_name) -->"
                } ?? "Neither member can carry a python: export attribute; rename one of the Swift declarations."
                fatalErr("Python member '\(name)' of \(owner) is bound by both \(previous.origin) and \(entry.origin). \(remedy)")
            }
            seen[name] = entry
            names.append(name)
        }
        return names
    }

    private func disambiguateClassMemberNames(
        owner: String,
        storedFields: inout [NativeStoredField],
        enumCases: inout [NativeEnumCase],
        fields: inout [NativeField],
        methods: inout [NativeMethod]
    ) {
        let entries =
            storedFields.map { PythonMemberNameEntry(rawName: $0.pythonName, isExplicit: false, origin: "stored field `\($0.cName)`", annotatableName: nil) } +
            enumCases.map { PythonMemberNameEntry(rawName: $0.pythonName, isExplicit: false, origin: "enum case `\($0.cName)`", annotatableName: nil) } +
            fields.map { PythonMemberNameEntry(rawName: $0.pythonName, isExplicit: $0.isExplicitPythonName, origin: "member `\($0.originName)`", annotatableName: $0.isExplicitPythonName ? nil : $0.pythonName) } +
            methods.map { PythonMemberNameEntry(rawName: $0.pythonName, isExplicit: $0.isExplicitPythonName, origin: "method `\($0.originName)`", annotatableName: $0.isExplicitPythonName ? nil : $0.pythonName) }
        let memberNames = resolvePythonMemberNames(entries, owner: owner)
        var index = 0
        for storedIndex in storedFields.indices {
            storedFields[storedIndex].pythonName = memberNames[index]
            index += 1
        }
        for enumIndex in enumCases.indices {
            enumCases[enumIndex].pythonName = memberNames[index]
            index += 1
            enumCases[enumIndex].values = disambiguatedEnumCaseValues(enumCases[enumIndex].values)
        }
        for fieldIndex in fields.indices {
            fields[fieldIndex].pythonName = memberNames[index]
            index += 1
        }
        for methodIndex in methods.indices {
            methods[methodIndex].pythonName = memberNames[index]
            methods[methodIndex].parameters = disambiguatedParameters(methods[methodIndex].parameters)
            index += 1
        }
    }

    private func disambiguatedEnumCaseValues(_ values: [NativeEnumCaseValue]) -> [NativeEnumCaseValue] {
        let valueNames = uniqueAssociatedValueNames(values.map(\.pythonName))
        return values.indices.map { index in
            var value = values[index]
            value.pythonName = valueNames[index]
            return value
        }
    }

    private func disambiguatedParameters(_ parameters: [NativeParameter]) -> [NativeParameter] {
        let parameterNames = uniqueParameterNames(parameters.map(\.pythonName))
        return parameters.indices.map { index in
            var parameter = parameters[index]
            parameter.pythonName = parameterNames[index]
            return parameter
        }
    }

    private func uniqueParameterNames(_ rawNames: [String]) -> [String] {
        uniquePythonNames(rawNames, sanitize: pythonSafeIdentifier)
    }

    private func uniqueAssociatedValueNames(_ rawNames: [String]) -> [String] {
        uniquePythonNames(rawNames, sanitize: pythonSafeAssociatedValueIdentifier)
    }

    /// Deterministic `_2`-suffix disambiguation, kept ONLY for method
    /// parameters and enum-case associated values: those have no annotation
    /// surface to rename them through, so a collision fatal would leave the
    /// library developer without a remedy. Class members go through
    /// `resolvePythonMemberNames`, which dies on collision instead.
    private func uniquePythonNames(_ rawNames: [String], sanitize: (String) -> String) -> [String] {
        var used = Set<String>()
        var names = Array(repeating: "", count: rawNames.count)
        for index in rawNames.indices.sorted(by: { rawNames[$0] < rawNames[$1] }) {
            let rawName = rawNames[index]
            let baseName = sanitize(rawName)
            var name = baseName
            var suffix = 2
            while used.contains(name) || isReservedPythonName(name) {
                name = "\(baseName)_\(suffix)"
                suffix += 1
            }
            used.insert(name)
            names[index] = name
        }
        return names
    }

    private func boundSymbols(for pythonClass: PythonClass) -> [String] {
        var symbols = Set<String>()
        for field in pythonClass.fields {
            symbols.insert(field.symbol)
            if let setterSymbol = field.setterSymbol {
                symbols.insert(setterSymbol)
            }
        }
        for method in pythonClass.methods {
            symbols.insert(method.symbol)
        }
        if let setupName = pythonClass.setupName {
            symbols.insert(setupName)
        }
        if let equalsSymbol = pythonClass.equalsSymbol {
            symbols.insert(equalsSymbol)
        }
        if let hashSymbol = pythonClass.hashSymbol {
            symbols.insert(hashSymbol)
        }
        return symbols.sorted()
    }

    private func pythonFunctionName(for symbol: String) -> String {
        "_fj_\(symbol)"
    }

    private func convertedInvocation(function: String, args: [String], conversion: String) -> String {
        let nativeArgs = args.isEmpty ? "[]" : "[\(args.joined(separator: ", "))]"
        return "_native.call(\(function), args=\(nativeArgs), return_conversion=\(conversion))"
    }

    private func setupTypeStatement(
        for pythonClass: PythonClass,
        setupFunction: String,
        nativeModuleName: String
    ) -> String {
        if pythonClass.setupKind == "reference" {
            return "\(nativeModuleName).setup_reference_type(\(setupFunction), \(pythonClass.className))"
        }
        if pythonClass.setupKind == "value" {
            let fields = pythonClass.storedFields.map { field in
                "\(nativeModuleName).Field(\"\(field.pythonName)\", \(descriptorExpression(cType: field.cType, conversion: field.conversion, nativeModuleName: nativeModuleName)), mutable=\(field.isMutable ? "True" : "False"))"
            }
            return "\(nativeModuleName).setup_value_type(\(setupFunction), \(pythonClass.className), [\(fields.joined(separator: ", "))])"
        }
        if pythonClass.setupKind == "enum" {
            if hasAssociatedValues(pythonClass) {
                let cases = pythonClass.enumCases.map { enumCase in
                    let fields = enumCase.values.map { value in
                        "\(nativeModuleName).Field(\"\(value.pythonName)\", \(descriptorExpression(cType: value.cType, conversion: value.conversion, nativeModuleName: nativeModuleName)))"
                    }.joined(separator: ", ")
                    return "\(nativeModuleName).EnumCase(\"\(enumCase.pythonName)\", \(enumCase.className), [\(fields)])"
                }.joined(separator: ", ")
                return "\(nativeModuleName).setup_associated_enum_type(\(setupFunction), \(pythonClass.className), [\(cases)])"
            }
            let cases = pythonClass.enumCases.map { "\"\($0.pythonName)\"" }.joined(separator: ", ")
            return "\(nativeModuleName).setup_simple_enum_type(\(setupFunction), \(pythonClass.className), [\(cases)])"
        }
        if pythonClass.setupKind == "protocol" {
            let fields = pythonClass.fields.map { field in
                "\(nativeModuleName).ProtocolField(\"\(field.pythonName)\", \(descriptorExpression(cType: field.returnType, conversion: field.returnConversion, nativeModuleName: nativeModuleName)))"
            }
            let methods = pythonClass.methods.map { method in
                let parameters = method.parameters.map {
                    descriptorExpression(cType: $0.cType, conversion: $0.conversion, nativeModuleName: nativeModuleName)
                }.joined(separator: ", ")
                return "\(nativeModuleName).ProtocolMethod(\"\(method.pythonName)\", [\(parameters)], \(descriptorExpression(cType: method.returnType, conversion: method.returnConversion, nativeModuleName: nativeModuleName)))"
            }
            return "\(nativeModuleName).setup_protocol_type(\(setupFunction), \(pythonClass.className), fields=[\(fields.joined(separator: ", "))], methods=[\(methods.joined(separator: ", "))])"
        }
        return "\(nativeModuleName).setup_empty_value_type(\(setupFunction), \(pythonClass.className))"
    }

    private func descriptorExpression(cType: String, conversion: String?, nativeModuleName: String = "_native") -> String {
        if let conversion {
            return conversion.replacingOccurrences(of: "_native.", with: "\(nativeModuleName).")
        }
        // The scalar `cType -> _native.X` mapping is single-sourced on
        // `PythonRepresentation`; `None` is the literal used where a value-type
        // field has no scalar descriptor.
        return PythonRepresentation.scalarDescriptor(cType: cType, nativeModuleName: nativeModuleName) ?? "None"
    }

    private func selfConversion(for pythonClass: PythonClass) -> String? {
        switch pythonClass.setupKind {
        case "emptyValue", "value", "enum":
            return "_native.ValueType(\(pythonStringLiteral(pythonClass.originName)))"
        default:
            return nil
        }
    }

    private func pythonDefaultValue(_ swiftValue: String, type: TranslatedType, context: FishyJoesContext) -> PythonDefaultValue? {
        guard let expression = SwiftDefaultExpression.parse(swiftValue) else {
            return nil
        }
        return pythonDefaultValue(expression, type: type, context: context)
    }

    private func pythonDefaultValue(_ swiftValue: SwiftDefaultExpression, type: TranslatedType, context: FishyJoesContext) -> PythonDefaultValue? {
        switch swiftValue {
        case .nilLiteral:
            return PythonDefaultValue(expression: "None")
        case let .boolLiteral(value):
            return PythonDefaultValue(expression: value ? "True" : "False")
        case let .integerLiteral(value), let .floatingPointLiteral(value):
            return PythonDefaultValue(expression: value)
        case let .implicitMember(memberName):
            if let integerLimit = pythonIntegerLimitDefaultValue(memberName: memberName, type: type) {
                return integerLimit
            }
            return pythonSimpleEnumDefaultValue(memberName, type: type)
        case let .memberAccess(components):
            if let integerLimit = pythonIntegerLimitDefaultValue(components: components) {
                return integerLimit
            }
            if let standardLibraryMember = pythonSwiftStandardLibraryMemberAccess(components) {
                return standardLibraryMember
            }
            if components.count == 1 {
                return pythonSimpleEnumDefaultValue(components[0], type: type)
            }
            return nil
        case let .call(callee, arguments):
            return pythonZeroArgumentMethodCall(callee: callee, arguments: arguments, type: type, context: context)
        }
    }

    private func pythonIntegerLimitDefaultValue(memberName: String, type: TranslatedType) -> PythonDefaultValue? {
        switch type.sourceType.unqualifiedName {
        case "Int":
            switch memberName {
            case "min":
                return PythonDefaultValue(expression: "-sys.maxsize - 1", imports: [.module("sys")])
            case "max":
                return PythonDefaultValue(expression: "sys.maxsize", imports: [.module("sys")])
            default:
                return nil
            }
        case "UInt":
            switch memberName {
            case "min":
                return PythonDefaultValue(expression: "0")
            case "max":
                return PythonDefaultValue(expression: "sys.maxsize * 2 + 1", imports: [.module("sys")])
            default:
                return nil
            }
        case "Int8", "Int16", "Int32", "Int64", "UInt8", "UInt16", "UInt32", "UInt64":
            return pythonFixedWidthIntegerLimitDefaultValue(components: [type.sourceType.unqualifiedName, memberName]).map {
                PythonDefaultValue(expression: $0)
            }
        default:
            return nil
        }
    }

    private func pythonIntegerLimitDefaultValue(components: [String]) -> PythonDefaultValue? {
        guard components.count == 2 else {
            return nil
        }
        switch (components[0], components[1]) {
        case ("Int", "min"):
            return PythonDefaultValue(expression: "-sys.maxsize - 1", imports: [.module("sys")])
        case ("Int", "max"):
            return PythonDefaultValue(expression: "sys.maxsize", imports: [.module("sys")])
        case ("UInt", "min"):
            return PythonDefaultValue(expression: "0")
        case ("UInt", "max"):
            return PythonDefaultValue(expression: "sys.maxsize * 2 + 1", imports: [.module("sys")])
        default:
            return pythonFixedWidthIntegerLimitDefaultValue(components: components).map {
                PythonDefaultValue(expression: $0)
            }
        }
    }

    private func pythonFixedWidthIntegerLimitDefaultValue(components: [String]) -> String? {
        SwiftDefaultExpression.memberAccess(components).swiftIntegerLimitValue
    }

    private func pythonZeroArgumentMethodCall(
        callee: SwiftDefaultExpression,
        arguments: [SwiftDefaultExpression],
        type: TranslatedType,
        context: FishyJoesContext
    ) -> PythonDefaultValue? {
        guard arguments.isEmpty,
              case let .memberAccess(components) = callee,
              let methodName = components.last else {
            return nil
        }

        let receiver = SwiftDefaultExpression.memberAccess(Array(components.dropLast()))
        guard let receiverDefault = pythonDefaultValue(receiver, type: type, context: context) else {
            return nil
        }

        switch methodName {
        case "squareRoot":
            return PythonDefaultValue(
                expression: "\(receiverDefault.expression) ** 0.5",
                imports: receiverDefault.imports
            )
        default:
            return nil
        }
    }

    private func pythonSwiftStandardLibraryMemberAccess(_ components: [String]) -> PythonDefaultValue? {
        switch components {
        case ["Double", "ulpOfOne"]:
            return PythonDefaultValue(expression: "sys.float_info.epsilon", imports: [.module("sys")])
        default:
            return nil
        }
    }

    private func pythonSimpleEnumDefaultValue(_ swiftCaseName: String, type: TranslatedType) -> PythonDefaultValue? {
        guard let translatedEnum = type as? TranslatedEnum,
              translatedEnum.isInhabited,
              translatedEnum.cases.allSatisfy({ $0.associatedValues.isEmpty }) else {
            return nil
        }
        let enumCaseNames = pythonSimpleEnumCaseNames(translatedEnum)
        guard let pythonCaseName = enumCaseNames[swiftCaseName] else {
            return nil
        }
        let className = pythonClassName(translatedEnum.nodeName)
        let importedType = PythonImport(moduleName: pythonModuleName(className), className: className)
        return PythonDefaultValue(
            expression: "\(className).\(pythonCaseName)",
            imports: [importedType]
        )
    }

    private func pythonSimpleEnumCaseNames(_ translatedEnum: TranslatedEnum) -> [String: String] {
        // Must mirror disambiguateClassMemberNames' inputs (cases + annotated
        // fields + methods, python: overrides included) so a case name resolved
        // here matches the one the class stub binds.
        let entries =
            translatedEnum.cases.map { PythonMemberNameEntry(rawName: $0.name, isExplicit: false, origin: "enum case `\($0.name)`", annotatableName: nil) } +
            translatedEnum.fields.compactMap { field -> PythonMemberNameEntry? in
                guard let annotation = field.exportAnnotation else { return nil }
                return PythonMemberNameEntry(rawName: annotation.pythonName ?? annotation.name, isExplicit: annotation.pythonName != nil, origin: "member `\(annotation.name)`", annotatableName: annotation.pythonName == nil ? annotation.name : nil)
            } +
            translatedEnum.methods.map { method -> PythonMemberNameEntry in
                let annotation = method.exportAnnotation
                return PythonMemberNameEntry(rawName: annotation.pythonName ?? annotation.name, isExplicit: annotation.pythonName != nil, origin: "method `\(annotation.name)`", annotatableName: annotation.pythonName == nil ? annotation.name : nil)
            }
        let memberNames = resolvePythonMemberNames(entries, owner: translatedEnum.nodeName)
        return Dictionary(uniqueKeysWithValues: zip(translatedEnum.cases.map(\.name), memberNames.prefix(translatedEnum.cases.count)))
    }

    private func pythonModuleName(_ name: String) -> String {
        PythonNaming.moduleName(name)
    }

    private func pythonClassName(_ name: String) -> String {
        PythonNaming.className(name)
    }

    private func pythonStringLiteral(_ value: String) -> String {
        PythonNaming.stringLiteral(value)
    }

    private func pythonSafeIdentifier(_ name: String) -> String {
        PythonNaming.safeIdentifier(name)
    }

    private func pythonSafeAssociatedValueIdentifier(_ name: String) -> String {
        PythonNaming.safeAssociatedValueIdentifier(name)
    }

    private func swiftIdentifierName(_ name: String) -> String {
        name.unescapedSwiftIdentifier
    }

    private func isReservedPythonName(_ name: String) -> Bool {
        PythonNaming.isReserved(name)
    }

    private func canEmitPythonStubAttribute(_ name: String) -> Bool {
        PythonNaming.canEmitStubAttribute(name)
    }

    private func hasAssociatedValues(_ pythonClass: PythonClass) -> Bool {
        pythonClass.enumCases.contains { !$0.values.isEmpty }
    }

    private func supportsInstanceMembers(for type: TranslatedType) -> Bool {
        if type is TranslatedStruct {
            return true
        }
        if type is TranslatedReference {
            return true
        }
        if type is TranslatedProtocol {
            return true
        }
        if let translatedEnum = type as? TranslatedEnum {
            return translatedEnum.isInhabited
        }
        return false
    }
}
