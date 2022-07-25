import Foundation
import SourceryRuntime

final class CPPTranslate: Translator {
    func generateCPPInterfaceMethod(
        name: String,
        bindingOnlyName: String? = nil,
        generics: [String: BetterType],
        parameters: [CPPClass.CPPParameter],
        returnType: CPPClass.CPPType,
        documentation: [String],
        definedInCPPClassNamed: String?,
        isStatic: Bool,
        isMutating: Bool,
        isPrivate: Bool = false,
        in context: FishyJoesContext
    ) -> CPPClass.CPPMethod {
        return CPPClass.CPPMethod(
            name: name,
            documentation: documentation,
            isStatic: isStatic,
            isPrivate: isPrivate,
            isConst: !isMutating,
            parameters: parameters,
            returnType: returnType,
            bindingOnlyName: bindingOnlyName
        )
    }
    func translateToHeader(method: Method, in context: FishyJoesContext) -> CPPClass.CPPMethod {
        let resolvedReturn = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
        return generateCPPInterfaceMethod(
            name: method.exportAnnotation.name,
            generics: method.exportAnnotation.genericOverrides,
            parameters: method.parameters.map({ formal in
                CPPClass.CPPParameter(
                    labelComment: formal.label,
                    name: formal.name,
                    type: .type(context.resolve(type: formal.type, generics: method.exportAnnotation.genericOverrides)),
                    defaultValue: formal.defaultValue
                )
            }),
            returnType: .type(resolvedReturn),
            documentation: method.documentation,
            definedInCPPClassNamed: method.definedIn.map { context.resolve(type: $0).cppName },
            isStatic: method.isStatic,
            isMutating: method.isMutating,
            in: context
        )
    }
    func translateToHeader(variable: Variable, in context: FishyJoesContext) -> (getter: CPPClass.CPPMethod, setter: CPPClass.CPPMethod?) {
        let capitalizedVariableName = upperCaseFirst(variable.name)
        let varType = context.resolve(type: variable.typeName.better)
        let getter = generateCPPInterfaceMethod(
            name: "get\(capitalizedVariableName)",
            generics: [:],
            parameters: [],
            returnType: .type(varType),
            documentation: variable.documentation,
            definedInCPPClassNamed: variable.definedInTypeName.map { context.resolve(type: $0.better).cppName },
            isStatic: variable.isStatic,
            isMutating: false,
            in: context
        )
        var setter: CPPClass.CPPMethod?
        if variable.isMutable && variable.accessLevel.write == .public {
            setter = generateCPPInterfaceMethod(
                name: "set\(capitalizedVariableName)",
                generics: [:],
                parameters: [CPPClass.CPPParameter(
                    labelComment: "newVal",
                    name: "newVal",
                    type: .type(varType),
                    defaultValue: nil
                )],
                returnType: .type(TranslatedVoid()),
                documentation: variable.documentation,
                definedInCPPClassNamed: variable.definedInTypeName.map { context.resolve(type: $0.better).cppName },
                isStatic: variable.isStatic,
                isMutating: true,
                in: context
            )
        }
        return (getter: getter, setter: setter)
    }

    func generateSwiftInterfaceMethod(
        cppName: String,
        swiftName: String,
        parameters: [SwiftFormal],
        selfType: BetterType?,
        isStatic: Bool,
        isMutating: Bool,
        returnType: BetterType,
        generics: [String: BetterType],
        body: (SourceFragment, String, [(label: String?, expression: String)]) -> Void,
        in context: FishyJoesContext
    ) -> [SourceFragment] {
        var selfExpression: String
        var selfConverter: String = ""
        let containingNamespace: String

        if let selfType = selfType {
            let resolved = context.resolve(type: selfType)
            containingNamespace = resolved.sourceType.name

            if isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "\(resolved.converterType.name).fromCPPPtr(thisPtr)"
                selfConverter = resolved.converterType.name
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        let returnType = context.resolve(type: returnType, generics: generics)

        //all void*/UnsafeMutableRawPointer at the barrier
        let formals =
            (!isStatic ? ["thisPtr"] : []) +
            (!isStatic && isMutating ? ["thisPtrOut"] : []) +
            parameters.map(\.name)

        let fragment = context.swiftFragment(
            "CPPInterface/\(containingNamespace)+cppdecl.swift",
            additionalImports: ["Foundation", "FishyJoesCPPRuntime"]
        )
        fragment.output("// Generated by FishyJoes for `\(containingNamespace).\(swiftName)`")

        let cMethod = "FJInternalBinding_\(context.module)_\(containingNamespace)_\(cppName)".replacingOccurrences(of: ".", with: "_")

        fragment.output("@_cdecl(\"\(cMethod)\")")
        fragment.outputBlock("func \(cMethod)(\(formals.map({ "\($0): UnsafeMutableRawPointer" }).joined(separator: ", "))) -> UnsafeMutableRawPointer {") {
            if isMutating {
                fragment.output("var mutatingSelf = try! \(selfExpression)")
                selfExpression = "mutatingSelf"
            }

            fragment.outputBlock("let ret = try! \(returnType.converterType.name).toCPPPtr(({", closeWith: "})())") {
                body(fragment, selfExpression, parameters.map { (
                    label: $0.label,
                    expression: "try! \(context.resolve(type: $0.type, generics: generics).converterType.name).fromCPPPtr(\($0.name))"
                ) })
            }

            if isMutating {
                fragment.output("thisPtrOut.storeBytes(of: Int(bitPattern: try! \(selfConverter).toCPPPtr(mutatingSelf)), as: Int.self)")
            }

            fragment.output("return ret")
        }

        return [fragment]
    }

    func translateToSwift(method: Method, in context: FishyJoesContext) -> [SourceFragment] {
        return generateSwiftInterfaceMethod(
            cppName: method.exportAnnotation.name,
            swiftName: method.name,
            parameters: method.parameters,
            selfType: method.definedIn,
            isStatic: method.isStatic,
            isMutating: method.isMutating,
            returnType: method.returnType,
            generics: method.exportAnnotation.genericOverrides,
            body: { fragment, selfExpression, params in
                fragment.outputBlock("try! \(selfExpression)\(method.isInitializer ? "" : ".\(method.callName)")(", closeWith: ")") {
                    fragment.outputMap(params, separator: ",") { param in
                        return (param.label.map { "\($0): " } ?? "") + param.expression
                    }
                }
            },
            in: context
        )
    }

    func translateToSwift(variable: Variable, in context: FishyJoesContext) -> [SourceFragment] {
        return generateSwiftInterfaceMethod(
            cppName: "get\(upperCaseFirst(variable.exportAnnotation!.name))",
            swiftName: variable.name,
            parameters: [],
            selfType: variable.definedInTypeName?.better,
            isStatic: variable.isStatic,
            isMutating: false,
            returnType: variable.typeName.better,
            generics: [:],
            body: { fragment, selfExpression, params in
                fragment.output("try! \(selfExpression).\(variable.name)")
            },
            in: context
        ) + (variable.isMutable && variable.accessLevel.write == .public ? generateSwiftInterfaceMethod(
            cppName: "set\(upperCaseFirst(variable.exportAnnotation!.name))",
            swiftName: variable.name,
            parameters: [SwiftFormal(label: nil, name: "newValue", type: variable.typeName.better)],
            selfType: variable.definedInTypeName?.better,
            isStatic: variable.isStatic,
            isMutating: true,
            returnType: BetterType.void,
            generics: [:],
            body: { fragment, selfExpression, params in
                fragment.output("try! \(selfExpression).\(variable.name) = \(params[0].expression)")
                fragment.output("return")
            },
            in: context
        ) : [])
    }

    func generateEqualityHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/include/\(context.module)_eq.hpp")
        frag.output("#include <functional>")
        let hashableObjs = context.cppClasses.values.filter { $0.isHashable(in: context) }
        let equatableObjs = context.cppClasses.values.filter { $0.isEquatable(in: context) }
        // Hashing for references
        frag.outputBlock("template <> struct std::hash<\(context.module)::FishyJoesInternal::SwiftReference> {", semicolonTerminated: true) {
            frag.outputBlock("inline size_t operator()(const \(context.module)::FishyJoesInternal::SwiftReference& ref) const {") {
                frag.output("return (size_t)\(context.module)::FishyJoesInternal::fishyjoes_swift_hash(ref.ref.get());")
            }
        }
        // Forward declarations of std::hash and operator==
        // Needed as their implementations will depend on each other
        for classObj in hashableObjs {
            let typeNameWithModule = "\(context.module)::\(classObj.qualifiedName)"
            frag.outputBlock("template <> struct std::hash<\(typeNameWithModule)> {", semicolonTerminated: true) {
                //the "inline" here is purely being used to make the linker shut up
                frag.output("inline size_t operator()(const \(typeNameWithModule) &obj) const;")
            }
        }
        // Definitions
        for classObj in hashableObjs {
            let typeNameWithModule = "\(context.module)::\(classObj.qualifiedName)"
            frag.outputBlock("inline size_t std::hash<\(typeNameWithModule)>::operator()(const \(typeNameWithModule) &obj) const {") {
                frag.output("size_t ret = 0;")
                for field in classObj.serializedFields {
                    frag.output("\(context.module)::FishyJoesInternal::hashCombine(ret, obj.\(field.name));")
                }
                frag.output("return ret;")
            }
        }
        for classObj in equatableObjs {
            let typeNameWithModule = "\(context.module)::\(classObj.qualifiedName)"
            frag.outputBlock("inline bool \(typeNameWithModule)::operator==(const \(typeNameWithModule)& other) const {") {
                for field in classObj.serializedFields {
                    frag.output("if(!(\(field.name) == other.\(field.name))) return false;")
                }
                frag.output("return true;")
            }
        }
        return frag
    }

    func generatePreHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/include/\(context.module)_pre.hpp")
        // TODO: change to ifndef/define for better compatibility, pragma once is lazy
        frag.output("#pragma once")
        frag.output("#include <cstdint>")
        frag.output("#include <vector>")
        frag.output("#include <unordered_map>")
        frag.output("#include <unordered_set>")
        frag.output("#include <variant>")
        frag.output("#include <functional>")
        frag.output("#include <optional>")
        frag.output("#include <string>")
        frag.output("#include <tuple>")
        frag.output("#include <memory>")
        frag.output("")

        frag.outputBlock("namespace \(context.module) {") {
            frag.outputBlock("namespace FishyJoesInternal {") {
                // generated classes are friends with FishyJoesInternal::Packer
                // to allow packer_impl.hpp (in src/) to access private members
                frag.output("struct Packer;")
                frag.output("")

                // hash combination
                frag.output("template <typename T>")
                frag.outputBlock("inline void hashCombine(std::size_t &seed, const T &v) {") {
                    frag.output("seed ^= std::hash<T>()(v) + 0x9e3779b9 + (seed << 6) + (seed >> 2);")
                }

                frag.outputBlock("extern \"C\" {") {
                    frag.output("void fishyjoes_swift_release(void* swift_obj);")
                    frag.output("void fishyjoes_swift_release_packed_data(void* swift_buf);")
                    frag.output("bool fishyjoes_swift_check_equality(void* swift_obj_1, void* swift_obj_2);")
                    frag.output("uint64_t fishyjoes_swift_hash(void* swift_obj);")
                }

                frag.outputBlock("struct SwiftReference {", semicolonTerminated: true) {
                    frag.output("std::shared_ptr<void> ref;")
                    frag.outputBlock("inline bool operator==(const SwiftReference& other) const {") {
                        frag.output("return fishyjoes_swift_check_equality(ref.get(), other.ref.get());")
                    }
                    frag.output("inline bool operator!=(const SwiftReference& other) const { return !(*this == other); }")
                }

                frag.outputBlock("inline SwiftReference swiftRefFromPtr(uint64_t ptr) {") {
                    frag.output("return {.ref = {(void*)ptr, fishyjoes_swift_release}};")
                }

                // output all bindings
                frag.outputBlock("namespace CBindings {") {
                    frag.outputBlock("extern \"C\" {") {
                        for classObj in context.cppClasses.values {
                            for method in classObj.methods {
                                let binding = method.binding(for: classObj, in: context)
                                frag.output("void* \(binding.symbol)(\(Array(repeating: "void*", count: binding.params).joined(separator: ", ")));")
                            }
                        }
                    }
                }
            }
            frag.output("")
            // forward-declare top level classes
            for classObj in context.cppClasses.values {
                if classObj.parentQualifiedName == nil {
                    frag.output("class \(classObj.qualifiedName);")
                }
            }
        }
        return frag
    }

    func generateCombinedHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/include/\(context.module).hpp")
        frag.output("#include \"\(context.module)_pre.hpp\"")
        for cppClass in context.cppClasses.values {
            if cppClass.parentQualifiedName == nil {
                frag.output("#include \"\(cppClass.swiftQualifiedName).hpp\"")
            }
        }
        frag.output("#include \"\(context.module)_eq.hpp\"")
        return frag
    }

    // Probably going to need some -O3 to dissolve all this c++ sugar into something fast
    // All the packing/unpacking stuff is inline and happening with a single vector<byte>, so after
    // optimizations the resulting assembly should be a lot more straight-forward than this makes it seem.
    // The cost of compilation does not matter as this header is not part of the user headers, it is
    // compiled in each .cpp file for this binding and then the resulting library & swift libraries are consumed.
    func generatePackImplHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/src/shared_impl.hpp")
        frag.output("#include \"\(context.module).hpp\"")
        frag.output("#include <cstdlib>")
        frag.output("#include <utility>")
        frag.output("")
        frag.outputBlock("namespace \(context.module) {") {
            frag.outputBlock("struct FishyJoesInternal::Packer {", semicolonTerminated: true) {
                frag.output("std::vector<uint8_t> data{0,0,0,0,0,0,0,0};")
                frag.output("int idx = 8;")
                // maybe a bad idea to use std::function here?
                frag.output("std::function<void()> on_destruct = [](){};")
                frag.output("//size must be power of 2")
                frag.outputBlock("inline void align(int size) {") {
                    frag.output("auto off = idx & (size - 1);")
                    frag.output("if(off) idx += size - off;")
                }
                frag.outputBlock("inline void* ptr() {") {
                    frag.output("align(8);")
                    frag.output("data.resize(idx);")
                    frag.output("*((uint64_t*)data.data()) = idx - 8;")
                    frag.output("return data.data();")
                }
                frag.outputBlock("static inline Packer fromSwiftPtr(void* ptr) {") {
                    frag.output("uint32_t data_size = *(uint32_t*)ptr;")
                    frag.output("uint8_t* u8ptr = ((uint8_t*)ptr);")
                    frag.output("//copy data into a Packer")
                    frag.output("Packer ret = { .data = { u8ptr, u8ptr + data_size + 8 }, .idx = 8 };")
                    frag.output("fishyjoes_swift_release_packed_data(ptr);")
                    frag.output("return ret;")
                }

                frag.outputBlock("~Packer() {") {
                    frag.output("on_destruct();")
                }

                frag.output("template <typename T>")
                frag.outputBlock("static inline Packer pack(const T& obj) {") {
                    frag.output("Packer packer;")
                    frag.output("packer.put(obj);")
                    frag.output("return packer;")
                }

                frag.output("template <typename T>")
                frag.outputBlock("static inline T unpack(void* swiftPtr) {") {
                    frag.output("return fromSwiftPtr(swiftPtr).get_t<T>();")
                }

                frag.output("template <typename T>")
                frag.outputBlock("inline T get_t() {") {
                    frag.output("return get(std::in_place_type_t<T>{});")
                }

                for simple_type in [ // must be power-of-2-bytes sized types
                    "uint8_t", "uint16_t", "uint32_t", "uint64_t",
                    "int8_t", "int16_t", "int32_t", "int64_t",
                    "bool", "char", "float", "double"
                ] {
                    frag.outputBlock("inline void put(const \(simple_type)& obj) {") {
                        frag.output("align(sizeof(obj));")
                        frag.output("data.resize(idx + sizeof(obj));")
                        frag.output("*(\(simple_type)*)(data.data() + idx) = obj;")
                        frag.output("idx += sizeof(obj);")
                    }
                    frag.outputBlock("inline \(simple_type) get(std::in_place_type_t<\(simple_type)> typeGuide = std::in_place_type_t<\(simple_type)>{}) {") {
                        frag.output("align(sizeof(\(simple_type)));")
                        frag.output("auto ret = *(\(simple_type)*)(data.data() + idx);")
                        frag.output("idx += sizeof(\(simple_type));")
                        frag.output("return ret;")
                    }
                }

                frag.outputBlock("inline void put(const FishyJoesInternal::SwiftReference &ref) {") {
                    frag.output("put((uint64_t)ref.ref.get());")
                }

                frag.outputBlock("inline FishyJoesInternal::SwiftReference get(std::in_place_type_t<FishyJoesInternal::SwiftReference> typeGuide = std::in_place_type_t<FishyJoesInternal::SwiftReference>{}) {") {
                    frag.output("return {.ref = {(void*)get_t<uint64_t>(), FishyJoesInternal::fishyjoes_swift_release}};")
                }

                // now to deal with packing all the STL types we generate
                frag.output("template <typename T>")
                frag.outputBlock("inline void put(const std::vector<T>& vec) {") {
                    frag.output("put((uint64_t)vec.size());")
                    frag.outputBlock("for(const auto &ele: vec) {") {
                        frag.output("put(ele);")
                    }
                }
                frag.output("template <typename T>")
                frag.outputBlock("inline std::vector<T> get(std::in_place_type_t<std::vector<T>> typeGuide = std::in_place_type_t<std::vector<T>>{}) {") {
                    frag.output("std::vector<T> out;")
                    frag.output("auto length = get_t<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < length; i++) {") {
                        frag.output("out.emplace_back(get_t<T>());")
                    }
                    frag.output("return out;")
                }

                frag.output("template <typename K, typename V>")
                frag.outputBlock("inline void put(const std::unordered_map<K, V>& map) {") {
                    frag.output("put((uint64_t)map.size());")
                    frag.outputBlock("for(const auto &entry: map) {") {
                        frag.output("put(entry.first);")
                        frag.output("put(entry.second);")
                    }
                }
                frag.output("template <typename K, typename V>")
                frag.outputBlock("inline std::unordered_map<K, V> get(std::in_place_type_t<std::unordered_map<K, V>> typeGuide = std::in_place_type_t<std::unordered_map<K, V>>{}) {") {
                    frag.output("std::unordered_map<K, V> out;")
                    frag.output("auto len = get_t<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < len; i++) {") {
                        frag.output("out.insert({get_t<K>(), get_t<V>()});")
                    }
                    frag.output("return out;")
                }

                frag.output("template <typename... Types>")
                frag.outputBlock("inline void put(const std::variant<Types...>& variant) {") {
                    frag.output("put((int64_t)variant.index());")
                    frag.output("std::visit([&](auto&& arg){ put(arg); }, variant);")
                }

                // welcome to c++ template hell
                // figuring out how to do this took 3 hours
                // it looks like recursion (and it is recursion)
                // but only the compiler follows the recursion.
                // the resulting code from instantiating this template
                // simply checks against (type index = 0, 1, 2, ... (in reverse actually))
                // then fills in a variant with the corresponding type when a match is hit.
                frag.output("template <typename Variant, int N>")
                frag.outputBlock("inline std::enable_if_t<N != 0, Variant> get_variant_helper(int n) {") {
                    frag.output("if(n >= N || n < 0) {")
                    frag.output("  throw std::runtime_error(\"invalid variant index when unpacking\");")
                    frag.output("} else if(n == N - 1) {")
                    frag.output("  return get_t<std::variant_alternative_t<N - 1, Variant>>();")
                    frag.output("} else {")
                    frag.output("  return get_variant_helper<Variant, N - 1>(n);")
                    frag.output("}")
                }
                frag.output("template <typename Variant, int N>")
                frag.outputBlock("inline std::enable_if_t<N == 0, Variant> get_variant_helper(int n) {") {
                    frag.output("throw std::runtime_error(\"invalid variant index when unpacking\");")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("inline std::variant<Types...> get(std::in_place_type_t<std::variant<Types...>> typeGuide = std::in_place_type_t<std::variant<Types...>>{}) {") {
                    frag.output("int index = (int)get_t<int64_t>();")
                    frag.output("return get_variant_helper<std::variant<Types...>, std::variant_size_v<std::variant<Types...>>>(index);")
                }
                // (end of get() implementation for std::variant)

                frag.output("template <typename T>")
                frag.outputBlock("inline void put(const std::optional<T>& obj) {") {
                    frag.output("put(obj.has_value());")
                    frag.output("if(obj.has_value()) put(*obj);")
                }
                frag.output("template <typename T>")
                frag.outputBlock("inline std::optional<T> get(std::in_place_type_t<std::optional<T>> typeGuide = std::in_place_type_t<std::optional<T>>{}) {") {
                    frag.output("if(!get_t<bool>()) return std::nullopt;")
                    frag.output("return get_t<T>();")
                }

                frag.output("template <typename T>")
                frag.outputBlock("inline void put(const std::unordered_set<T>& obj) {") {
                    frag.output("put((uint64_t)obj.size());")
                    frag.outputBlock("for(const auto &entry: obj) {") {
                        frag.output("put(entry);")
                    }
                }
                frag.output("template <typename T>")
                frag.outputBlock("inline std::unordered_set<T> get(std::in_place_type_t<std::unordered_set<T>> typeGuide = std::in_place_type_t<std::unordered_set<T>>{}) {") {
                    frag.output("std::unordered_set<T> out;")
                    frag.output("auto length = get_t<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < length; i++) {") {
                        frag.output("out.insert(get_t<T>());")
                    }
                    frag.output("return out;")
                }

                frag.outputBlock("inline void put(const std::string& str) {") {
                    frag.output("put((uint64_t)str.size());")
                    frag.outputBlock("for(const auto &ch: str) {") {
                        frag.output("put(ch);")
                    }
                }
                frag.outputBlock("inline std::string get(std::in_place_type_t<std::string> typeGuide = std::in_place_type_t<std::string>{}) {") {
                    frag.output("std::string out((size_t)get_t<uint64_t>(), ' ');")
                    frag.outputBlock("for(auto &ch: out) {") {
                        frag.output("ch = get_t<char>();")
                    }
                    frag.output("return out;")
                }
                frag.output("template <typename Tuple, int N>")
                frag.output("inline std::enable_if_t<N >= std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {}")
                // main case
                frag.output("template <typename Tuple, int N>")
                frag.outputBlock("inline std::enable_if_t<N < std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {") {
                    frag.output("put(std::get<N>(tuple));")
                    frag.output("put_tuple_helper<Tuple, N + 1>(tuple);")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("inline void put(const std::tuple<Types...>& tuple) {") {
                    frag.output("put_tuple_helper<std::tuple<Types...>, 0>(tuple);")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("inline std::tuple<Types...> get(std::in_place_type_t<std::tuple<Types...>> typeGuide = std::in_place_type_t<std::tuple<Types...>>{}) {") {
                    frag.output("return std::make_tuple(get_t<Types>()...);")
                }
                for cppClass in context.cppClasses.values {
                    cppClass.packerImpl(to: frag)
                }
            }
        }
        return frag
    }
    init() {}
    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        return [
            generatePreHeader(in: context),
            generateEqualityHeader(in: context),
            generateCombinedHeader(in: context),
            generatePackImplHeader(in: context)
        ]
    }
}
