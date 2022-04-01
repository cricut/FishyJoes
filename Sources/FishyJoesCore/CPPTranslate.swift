import Foundation
import SourceryRuntime

class CPPTranslate {
    private func generateCPPInterfaceMethod(
        name: String,
        generics: [String : BetterType],
        parameters: [CPPClass.CPPParameter],
        returnType: TranslatedType,
        documentation: [String],
        definedIn: BetterType?,
        isStatic: Bool,
        isMutating: Bool,
        in context: FishyJoesContext
    ) -> CPPClass.CPPMethod {
        var cBindingName: String
        if let selfType = definedIn {
            let resolvedSelf = context.resolve(type: selfType)
            let selfNameUnderscores = resolvedSelf.cppName.replacingOccurrences(of: "::", with: "_")
            cBindingName = "FJInternalBinding_\(context.module)_\(selfNameUnderscores)_\(name)"
        } else {
            cBindingName = "FJInternalBinding_\(context.module)_\(name)"
        }
        return CPPClass.CPPMethod(
            name: name,
            documentation: documentation,
            isStatic: isStatic,
            parameters: parameters,
            returnType: returnType,
            bindings: [CPPClass.CPPBinding(symbol: cBindingName, params: isStatic ? parameters.count : parameters.count + 1)]
        ) { fragment in
            //method body lambda
            let paramsPassed = ((isStatic ? [] : [
                isMutating ? "FishyJoesInternal::Packer::packThenUnpackMutatedMembersOnDestruct(*this).ptr()" : "FishyJoesInternal::Packer::pack(*this).ptr()"
            ]) + parameters.map { "FishyJoesInternal::Packer::pack(\($0.name)).ptr()" }).joined(separator: ", ")
            var callStmt = ""
            if !(returnType is TranslatedVoid) {
                callStmt += "return FishyJoesInternal::Packer::unpack<\(returnType.cppName)>("
            }
            callStmt += "FishyJoesInternal::CBindings::\(cBindingName)(\(paramsPassed))"
            if !(returnType is TranslatedVoid) {
                callStmt += ")"
            }
            callStmt += ";"
            fragment.output(callStmt)
        }
    }
    func translateToHeaderFragment(method: Method, in context: FishyJoesContext) -> CPPClass.CPPMethod {
        let resolvedReturn = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
        return generateCPPInterfaceMethod(
            name: method.exportAnnotation.name,
            generics: method.exportAnnotation.genericOverrides,
            parameters: method.parameters.map({ formal in
                CPPClass.CPPParameter(
                    labelComment: formal.label,
                    name: formal.name,
                    type: context.resolve(type: formal.type, generics: method.exportAnnotation.genericOverrides),
                    defaultValue: formal.defaultValue
                )
            }),
            returnType: resolvedReturn,
            documentation: method.documentation,
            definedIn: method.definedIn,
            isStatic: method.isStatic,
            isMutating: method.isMutating,
            in: context
        )
    }
    func translateToHeaderFragment(variable: Variable, in context: FishyJoesContext) -> (getter: CPPClass.CPPMethod, setter: CPPClass.CPPMethod?) {
        let capitalizedVariableName = variable.name.prefix(1).capitalized + variable.name.dropFirst()
        let varType = context.resolve(type: variable.typeName.better)
        let getter = generateCPPInterfaceMethod(
            name: "get\(capitalizedVariableName)",
            generics: [:],
            parameters: [],
            returnType: varType,
            documentation: variable.documentation,
            definedIn: variable.definedInTypeName?.better,
            isStatic: variable.isStatic,
            isMutating: false,
            in: context
        )
        var setter: CPPClass.CPPMethod? = nil
        if variable.isMutable {
            setter = generateCPPInterfaceMethod(
                name: "set\(capitalizedVariableName)",
                generics: [:],
                parameters: [CPPClass.CPPParameter(
                    labelComment: "newVal",
                    name: "newVal",
                    type: varType,
                    defaultValue: nil
                )],
                returnType: TranslatedVoid(),
                documentation: variable.documentation,
                definedIn: variable.definedInTypeName?.better,
                isStatic: variable.isStatic,
                isMutating: true,
                in: context
            )
        }
        return (getter: getter, setter: setter)
    }
    
    func generatePreHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/include/\(context.module)_pre.hpp")
        //TODO: change to ifndef/define for better compatibility, pragma once is lazy
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
        frag.output("")
        
        frag.outputBlock("namespace \(context.module) {") {
            frag.outputBlock("namespace FishyJoesInternal {") {
                //generated classes are friends with FishyJoesInternal::Packer
                //to allow packer_impl.hpp (in src/) to access private members
                frag.output("class Packer;")
                frag.output("")
                
                //output all bindings
                frag.outputBlock("namespace CBindings {") {
                    frag.outputBlock("extern \"C\" {") {
                        for classObj in context.cppClasses.values {
                            for method in classObj.methods {
                                for binding in method.bindings {
                                    frag.output("void* \(binding.symbol)(\(Array(repeating: "void*", count: binding.params).joined(separator: ", ")));")
                                }
                            }
                        }
                    }
                }
            }
            frag.output("")
            //forward-declare top level classes
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
        return frag
    }
    
    //Probably going to need some -O3 to dissolve all this c++ sugar into something fast
    //All the packing/unpacking stuff is inline and happening with a single vector<byte>, so after
    //optimizations the resulting assembly should be a lot more straight-forward than this makes it seem.
    //The cost of compilation does not matter as this header is not part of the user headers, it is
    //compiled in each .cpp file for this binding and then the resulting library & swift libraries are consumed.
    func generatePackImplHeader(in context: FishyJoesContext) -> SourceFragment {
        let frag = SourceFragment(sourceryDestination: "file:../../cpp/src/shared_impl.hpp")
        frag.output("#include \"\(context.module).hpp\"")
        frag.output("#include <cstdlib>")
        frag.output("")
        frag.outputBlock("namespace \(context.module) {") {
            frag.outputBlock("struct FishyJoesInternal::Packer {", semicolonTerminated: true) {
                frag.output("std::vector<uint8_t> data;")
                frag.output("int idx;")
                frag.output("//size must be power of 2")
                frag.outputBlock("void align(int size) {") {
                    frag.output("auto off = idx & (size - 1);")
                    frag.output("if(off) idx += size - off;")
                }
                frag.outputBlock("void* ptr() {") {
                    frag.output("align(8);")
                    frag.output("data.resize(idx);")
                    frag.output("return data.data();")
                }
                frag.outputBlock("static Packer fromSwiftPtr(void* ptr) {") {
                    frag.output("uint32_t data_size = *(uint32_t*)ptr;")
                    frag.output("uint8_t* u8ptr = ((uint8_t*)ptr) + 4;")
                    frag.output("//copy data into a Packer")
                    frag.output("Packer ret = { .data = { u8ptr, u8ptr + data_size }, .idx = 0 };")
                    frag.output("//free (swift must have allocated this ptr with c stdlib malloc!)")
                    frag.output("free(ptr);")
                    frag.output("return ret;")
                }
                frag.output("template <typename T>")
                frag.outputBlock("T get_temporary() {") {
                    frag.output("T ret;")
                    frag.output("get(ret);")
                    frag.output("return ret;")
                }
                
                frag.output("template <typename T>")
                frag.outputBlock("static Packer pack(const T& obj) {") {
                    frag.output("Packer packer;")
                    frag.output("packer.put(obj);")
                    frag.output("return packer;")
                }
                
                //TODO: fix
                frag.output("template <typename T>")
                frag.outputBlock("static Packer packThenUnpackMutatedMembersOnDestruct(T& obj) {") {
                    frag.output("Packer packer;")
                    frag.output("packer.put(obj);")
                    frag.output("return packer;")
                }
                
                frag.output("template <typename T>")
                frag.outputBlock("static T unpack(void* swiftPtr) {") {
                    frag.output("T ret;")
                    frag.output("fromSwiftPtr(swiftPtr).get(ret);")
                    frag.output("return ret;")
                }
                
                for simple_type in [ // must be power-of-2-bytes sized types
                    "uint8_t", "uint16_t", "uint32_t", "uint64_t",
                    "int8_t", "int16_t", "int32_t", "int64_t",
                    "bool", "char", "float", "double"
                ] {
                    frag.outputBlock("void put(const \(simple_type)& obj) {") {
                        frag.output("align(sizeof(obj));")
                        frag.output("data.resize(data.size() + sizeof(obj));")
                        frag.output("*(\(simple_type)*)(data.data() + idx) = obj;")
                        frag.output("idx += sizeof(obj);")
                    }
                    frag.outputBlock("void get(\(simple_type)& out) {") {
                        frag.output("align(sizeof(out));")
                        frag.output("out = *(\(simple_type)*)(data.data() + idx);")
                        frag.output("idx += sizeof(out);")
                    }
                }
                
                //now to deal with packing all the STL types we generate
                frag.output("template <typename T>")
                frag.outputBlock("void put(const std::vector<T>& vec) {") {
                    frag.output("put((uint64_t)vec.size());")
                    frag.outputBlock("for(const auto &ele: vec) {") {
                        frag.output("put(ele);")
                    }
                }
                frag.output("template <typename T>")
                frag.outputBlock("void get(std::vector<T>& out) {") {
                    frag.output("auto length = get_temporary<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < length; i++) {") {
                        frag.output("out.push_back(get_temporary<T>());")
                    }
                }
                
                frag.output("template <typename K, typename V>")
                frag.outputBlock("void put(const std::unordered_map<K, V>& map) {") {
                    frag.output("put((uint64_t)map.size());")
                    frag.outputBlock("for(const auto &entry: map) {") {
                        frag.output("put(entry.first);")
                        frag.output("put(entry.second);")
                    }
                }
                frag.output("template <typename K, typename V>")
                frag.outputBlock("void get(std::unordered_map<K, V>& out) {") {
                    frag.output("out.clear();")
                    frag.output("auto len = get_temporary<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < len; i++) {") {
                        frag.output("out.insert({get_temporary<K>(), get_temporary<V>()});")
                    }
                }
                
                frag.output("template <typename... Types>")
                frag.outputBlock("void put(const std::variant<Types...>& variant) {") {
                    frag.output("put((int64_t)variant.index());")
                    frag.output("std::visit([&](auto&& arg){ put(arg); }, variant);");
                }
                
                //welcome to c++ template hell
                //figuring out how to do this took 3 hours
                //it looks like recursion (and it is recursion)
                //but only the compiler follows the recursion.
                //the resulting code from instantiating this template
                //simply checks against (type index = 0, 1, 2, ... (in reverse actually))
                //then fills in a variant with the corresponding type when a match is hit.
                frag.output("template <typename Variant, int N>")
                frag.outputBlock("std::enable_if_t<N != 0, Variant> get_variant_helper(int n) {") {
                    frag.output("if(n >= N || n < 0) {")
                    frag.output("  throw std::runtime_error(\"invalid variant index when unpacking\");")
                    frag.output("} else if(n == N - 1) {")
                    frag.output("  return get_temporary<std::variant_alternative_t<N - 1, Variant>>();")
                    frag.output("} else {")
                    frag.output("  return get_variant_helper<Variant, N - 1>(n);")
                    frag.output("}")
                }
                frag.output("template <typename Variant, int N>")
                frag.outputBlock("std::enable_if_t<N == 0, Variant> get_variant_helper(int n) {") {
                    frag.output("throw std::runtime_error(\"invalid variant index when unpacking\");")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("void get(std::variant<Types...>& out) {") {
                    frag.output("int index = (int)get_temporary<int64_t>();")
                    frag.output("out = get_variant_helper<std::variant<Types...>, std::variant_size_v<std::variant<Types...>>>(index);")
                }
                //(end of get() implementation for std::variant)
                
                frag.output("template <typename T>")
                frag.outputBlock("void put(const std::optional<T>& obj) {") {
                    frag.output("put(obj.has_value());")
                    frag.output("if(obj.has_value()) put(*obj);")
                }
                frag.output("template <typename T>")
                frag.outputBlock("void get(std::optional<T>& out) {") {
                    frag.output("out.reset();")
                    frag.output("if(get_temporary<bool>()) get(*out);")
                }
                
                frag.output("template <typename T>")
                frag.outputBlock("void put(const std::unordered_set<T>& obj) {") {
                    frag.output("put((uint64_t)obj.size());")
                    frag.outputBlock("for(const auto &entry: obj) {") {
                        frag.output("put(entry);")
                    }
                }
                frag.output("template <typename T>")
                frag.outputBlock("void get(std::unordered_set<T>& out) {") {
                    frag.output("out.clear();")
                    frag.output("auto length = get_temporary<uint64_t>();")
                    frag.outputBlock("for(int i = 0; i < length; i++) {") {
                        frag.output("out.insert(get_temporary<T>());")
                    }
                }
                
                frag.outputBlock("void put(const std::string& str) {") {
                    frag.output("put((uint64_t)str.size());")
                    frag.outputBlock("for(const auto &ch: str) {") {
                        frag.output("put(ch);")
                    }
                }
                frag.outputBlock("void get(std::string& out) {") {
                    frag.output("out.resize((size_t)get_temporary<uint64_t>());")
                    frag.outputBlock("for(auto &ch: out) {") {
                        frag.output("get(ch);")
                    }
                }
                
                //this feels more natural now
                //I have become one with the C++ compiler
                //＼＼\\٩( 'ω' )و //／／ C++センスキターーーーー
                //exit case
                frag.output("template <typename Tuple, int N>")
                frag.output("std::enable_if_t<N >= std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {}")
                //main case
                frag.output("template <typename Tuple, int N>")
                frag.outputBlock("std::enable_if_t<N < std::tuple_size_v<Tuple>> put_tuple_helper(const Tuple& tuple) {") {
                    frag.output("put(std::get<N>(tuple));")
                    frag.output("put_tuple_helper<Tuple, N + 1>(tuple);")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("void put(const std::tuple<Types...>& tuple) {") {
                    frag.output("put_tuple_helper<std::tuple<Types...>, 0>(tuple);")
                }
                frag.output("template <typename... Types>")
                frag.outputBlock("void get(std::tuple<Types...>& tuple) {") {
                    frag.output("tuple = std::make_tuple(get_temporary<Types>()...);")
                }
                for cppClass in context.cppClasses.values {
                    cppClass.packerImpl(to: frag)
                }
            }
        }
        return frag
    }
}
