import Foundation
import NodeAPI

public enum NAPI {
    public typealias Env = swift_napi_env
    public typealias Value = swift_napi_value
    public typealias Ref = swift_napi_ref
    public typealias HandleScope = swift_napi_handle_scope
    public typealias CallbackInfo = swift_napi_callback_info
    public typealias Deferred = swift_napi_callback_info

    public typealias Finalize = napi_finalize
    public typealias CleanupHook = @convention(c) (UnsafeMutableRawPointer?) -> Void
    public typealias Callback = napi_callback
}

// MARK: napi function wrappers
extension NAPI.Env {
    private func check(_ status: napi_status, file: StaticString = #file, line: UInt = #line) throws {
        guard status == napi_ok else {
            var err: UnsafePointer<napi_extended_error_info>?
            napi_get_last_error_info(ptr, &err)
            let message = err.flatMap(\.pointee.error_message).map(String.init(cString:)) ?? "unknown error"

            let errorStr = "\(file):\(line): n-api error: \(message)"

            print(errorStr)
            #if !os(WASI)
            Thread.callStackSymbols.forEach { print($0) }
            #endif

            throw JSException(message: errorStr)
        }
    }

    // MARK: Environment life cycle APIs
    public func setInstanceData(_ data: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalize_hint: UnsafeMutableRawPointer?) throws {
        try check(napi_set_instance_data(ptr, data, finalizeCb, finalize_hint))
    }

    public func getInstanceData() throws -> UnsafeMutableRawPointer? {
        var result: UnsafeMutableRawPointer?
        try check(napi_get_instance_data(ptr, &result))
        return result
    }

    // MARK: Exceptions
    public func `throw`(_ error: NAPI.Value) throws {
        try check(napi_throw(ptr, error.ptr))
    }

    public func throwError(_ code: String?, _ message: String) throws {
        try check(napi_throw_error(ptr, code, message))
    }

    // public func throwTypeError(_ code: String?, _ message: String) throws {
    //     try check(napi_throw_type_error(ptr, code, message))
    // }

    // public func throwRangeError(_ code: String?, _ message: String) throws {
    //     try check(napi_throw_range_error(ptr, code, message))
    // }

    // public func throwSyntaxError(_ code: String?, _ message: String) throws {
    //     try check(napi_throw_syntax_error(ptr, code, message))
    // }

    public func createError(_ code: NAPI.Value, _ message: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_error(ptr, code.ptr, message.ptr, &result.ptr))
        return result
    }

    // public func createTypeError ...
    // public func createRangeError ...
    // public func createSyntaxError ...

    public func getAndClearLastException() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_and_clear_last_exception(ptr, &result.ptr))
        return result
    }

    public func isExceptionPending() throws -> Bool {
        var result = false
        try check(napi_is_exception_pending(ptr, &result))
        return result
    }

    public func fatalException(_ error: NAPI.Value) throws {
        napi_fatal_exception(ptr, error.ptr)
    }

    // public func fatalError ...

    // MARK: Object lifetime management
    public func openHandleScope() throws -> NAPI.HandleScope {
        var result = NAPI.HandleScope()
        try check(napi_open_handle_scope(ptr, &result.ptr))
        return result
    }

    public func closeHandleScope(_ scope: NAPI.HandleScope) throws {
        try check(napi_close_handle_scope(ptr, scope.ptr))
    }

    public func openEscapableHandleScope() throws -> NAPI.HandleScope {
        var result = NAPI.HandleScope()
        try check(napi_open_escapable_handle_scope(ptr, &result.ptr))
        return result
    }

    public func closeEscapableHandleScope(_ scope: NAPI.HandleScope) throws {
        try check(napi_close_escapable_handle_scope(ptr, scope.ptr))
    }

    public func escapeHandle(_ scope: NAPI.HandleScope, _ escapee: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_escape_handle(ptr, scope.ptr, escapee.ptr, &result.ptr))
        return result
    }

    // MARK: References to objects with a lifespan longer than that of the native method
    public func createReference(_ value: NAPI.Value, _ initialRefCount: UInt32) throws -> NAPI.Ref {
        var result = NAPI.Ref()
        try check(napi_create_reference(ptr, value.ptr, initialRefCount, &result.ptr))
        return result
    }

    public func deleteReference(_ ref: NAPI.Ref) throws {
        try check(napi_delete_reference(ptr, ref.ptr))
    }

    public func referenceRef(_ ref: NAPI.Ref) throws -> UInt32 {
        var result = 0 as UInt32
        try check(napi_reference_ref(ptr, ref.ptr, &result))
        return result
    }

    public func referenceUnref(_ ref: NAPI.Ref) throws -> UInt32 {
        var result = 0 as UInt32
        try check(napi_reference_unref(ptr, ref.ptr, &result))
        return result
    }

    public func getReferenceValue(_ ref: NAPI.Ref) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_reference_value(ptr, ref.ptr, &result.ptr))
        return result
    }

    // MARK: Cleanup on exit of the current Node.js instance
    public func addEnvCleanupHook(_ fun: @escaping NAPI.CleanupHook, _ arg: UnsafeMutableRawPointer?) throws {
        try check(napi_add_env_cleanup_hook(ptr, fun, arg))
    }

    public func removeEnvCleanupHook(_ fun: @escaping NAPI.CleanupHook, _ arg: UnsafeMutableRawPointer?) throws {
        try check(napi_remove_env_cleanup_hook(ptr, fun, arg))
    }

    // public func addAsyncCleanupHook ...
    // public func removeAsyncCleanupHook ...

    // MARK: Working with JavaScript values
    // MARK: Object creation public functions
    public func createArray() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_array(ptr, &result.ptr))
        return result
    }

    public func createArrayWithLength(_ length: Int) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_array_with_length(ptr, length, &result.ptr))
        return result
    }

    public func createArraybuffer(_ byteLength: Int) throws -> (data: UnsafeMutableRawPointer?, result: NAPI.Value) {
        var result = NAPI.Value()
        var data: UnsafeMutableRawPointer?
        try check(napi_create_arraybuffer(ptr, byteLength, &data, &result.ptr))
        return (data, result)
    }

    // Currently unused. If needed, will need a wasm implementation
    // public func createBuffer(_ size: Int) throws -> (data: UnsafeMutableRawPointer?, result: NAPI.Value) {
    //     var result = NAPI.Value()
    //     var data: UnsafeMutableRawPointer?
    //     try check(napi_create_buffer(ptr, size, &data, &result.ptr))
    //     return (data, result)
    // }
    // public func createBufferCopy(_ length: Int, data: UnsafeRawPointer?) throws -> (data: UnsafeMutableRawPointer?, result: NAPI.Value) {
    //     var result = NAPI.Value()
    //     var result_data: UnsafeMutableRawPointer?
    //     try check(napi_create_buffer_copy(ptr, length, data, &result_data, &result.ptr))
    //     return (result_data, result)
    // }

    public func createDate(_ time: Double) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_date(ptr, time, &result.ptr))
        return result
    }
    public func createExternal(_ data: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalize_hint: UnsafeMutableRawPointer?) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_external(ptr, data, finalizeCb, finalize_hint, &result.ptr))
        return result
    }
    // Currently unused. If needed, will need a wasm implementation
    // public func createExternalArraybuffer(_ external_data: UnsafeMutableRawPointer?, byteLength: Int, finalizeCb: @escaping NAPI.Finalize, finalize_hint: UnsafeMutableRawPointer?) throws -> NAPI.Value {
    //     var result = NAPI.Value()
    //     try check(napi_create_external_arraybuffer(ptr, external_data, byteLength, finalizeCb, finalize_hint, &result.ptr))
    //     return result
    // }
    // public func createExternalBuffer(length: Int, _ data: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalizeHint: UnsafeMutableRawPointer?) throws -> NAPI.Value {
    //     var result = NAPI.Value()
    //     try check(napi_create_external_buffer(ptr, length, data, finalizeCb, finalizeHint, &result.ptr))
    //     return result
    // }
    public func createObject() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_object(ptr, &result.ptr))
        return result
    }
    public func createSymbol(_ description: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_symbol(ptr, description.ptr, &result.ptr))
        return result
    }
    // public func nodeApiSymbolFor(_ utf8description: String?, length: Int) throws -> NAPI.Value {
    //     var result = NAPI.Value()
    //     try check(node_api_symbol_for(ptr, utf8description, length, &result.ptr))
    //     return result
    // }
    public func createTypedarray(_ type: napi_typedarray_type, length: Int, _ arraybuffer: NAPI.Value, byteOffset: Int) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_typedarray(ptr, type, length, arraybuffer.ptr, byteOffset, &result.ptr))
        return result
    }
    public func createDataview(_ byteLength: Int, _ arraybuffer: NAPI.Value, byteOffset: Int) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_dataview(ptr, byteLength, arraybuffer.ptr, byteOffset, &result.ptr))
        return result
    }

    // MARK: Public Functions to convert from C types to Node-API
    public func createInt32(_ value: Int32) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_int32(ptr, value, &result.ptr))
        return result
    }
    public func createUint32(_ value: UInt32) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_uint32(ptr, value, &result.ptr))
        return result
    }
    public func createInt64(_ value: Int64) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_int64(ptr, value, &result.ptr))
        return result
    }
    public func createDouble(_ value: Double) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_double(ptr, value, &result.ptr))
        return result
    }
    public func createBigintInt64(_ value: Int64) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_bigint_int64(ptr, value, &result.ptr))
        return result
    }
    public func createBigintUint64(_ value: UInt64) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_bigint_uint64(ptr, value, &result.ptr))
        return result
    }
    public func createBigintWords(_ signBit: Int32, wordCount: Int, words: [UInt64]) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_bigint_words(ptr, signBit, wordCount, words, &result.ptr))
        return result
    }
    // public func createStringLatin1(_ str: String?, length: Int) throws -> NAPI.Value {
    // public func createStringUtf16(const char16_t* str, length: Int) throws -> NAPI.Value
    public func createStringUtf8(_ str: String) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_string_utf8(ptr, str, str.utf8.count, &result.ptr))
        return result
    }

    // MAKR: Public Functions to convert from Node-API to C types
    public func getArrayLength(_ value: NAPI.Value) throws -> UInt32 {
        var result: UInt32 = 0
        try check(napi_get_array_length(ptr, value.ptr, &result))
        return result
    }

    // Currently unused. If needed, will need a wasm implementation
    // public func getArraybufferInfo(_ arraybuffer: NAPI.Value) throws -> (data: UnsafeMutableRawPointer?, byteLength: Int) {
    //     var data: UnsafeMutableRawPointer?
    //     var byteLength: Int = 0
    //     try check(napi_get_arraybuffer_info(ptr, arraybuffer.ptr, &data, &byteLength))
    //     return (data, byteLength)
    // }
    // public func getBufferInfo(_ value: NAPI.Value) throws -> (data: UnsafeMutableRawPointer?, length: Int) {
    //     var data: UnsafeMutableRawPointer?
    //     var length: Int = 0
    //     try check(napi_get_buffer_info(ptr, value.ptr, &data, &length))
    //     return (data, length)
    // }
    public func getPrototype(_ object: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_prototype(ptr, object.ptr, &result.ptr))
        return result
    }
    public func getTypedarrayInfo(_ typedarray: NAPI.Value) throws -> (type: napi_typedarray_type, length: Int, data: UnsafeMutableRawPointer?, arraybuffer: NAPI.Value, byteOffset: Int) {
        var type: napi_typedarray_type = napi_int8_array
        var length: Int = 0
        var data: UnsafeMutableRawPointer?
        var arraybuffer = NAPI.Value()
        var byteOffset: Int = 0
        try check(napi_get_typedarray_info(ptr, typedarray.ptr, &type, &length, &data, &arraybuffer.ptr, &byteOffset))
        return (type, length, data, arraybuffer, byteOffset)
    }
    public func getDataviewInfo(_ dataview: NAPI.Value) throws -> (byteLength: Int, data: UnsafeMutableRawPointer?, arraybuffer: NAPI.Value, byteOffset: Int) {
        var byteLength: Int = 0
        var data: UnsafeMutableRawPointer?
        var arraybuffer = NAPI.Value()
        var byteOffset: Int = 0
        try check(napi_get_dataview_info(ptr, dataview.ptr, &byteLength, &data, &arraybuffer.ptr, &byteOffset))
        return (byteLength, data, arraybuffer, byteOffset)
    }
    public func getDateValue(_ value: NAPI.Value) throws -> Double {
        var result: Double = 0.0
        try check(napi_get_date_value(ptr, value.ptr, &result))
        return result
    }
    public func getValueBool(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_get_value_bool(ptr, value.ptr, &result))
        return result
    }
    public func getValueDouble(_ value: NAPI.Value) throws -> Double {
        var result: Double = 0.0
        try check(napi_get_value_double(ptr, value.ptr, &result))
        return result
    }
    public func getValueBigintInt64(_ value: NAPI.Value) throws -> (Int64, lossless: Bool) {
        var result: Int64 = 0
        var lossless = false
        try check(napi_get_value_bigint_int64(ptr, value.ptr, &result, &lossless))
        return (result, lossless)
    }
    public func getValueBigintUint64(_ value: NAPI.Value) throws -> (UInt64, lossless: Bool) {
        var result: UInt64 = 0
        var lossless = false
        try check(napi_get_value_bigint_uint64(ptr, value.ptr, &result, &lossless))
        return (result, lossless)
    }
    public func getValueBigintWords(_ value: NAPI.Value) throws -> (signBit: Int32, words: [UInt64]) {
        var signBit: Int32 = 0
        var wordCount: Int = 0
        try check(napi_get_value_bigint_words(ptr, value.ptr, nil, &wordCount, nil))
        var words = [UInt64](repeating: 0, count: wordCount)
        try words.withUnsafeMutableBufferPointer {
            try check(napi_get_value_bigint_words(ptr, value.ptr, &signBit, &wordCount, $0.baseAddress))
        }
        return (signBit, words)
    }
    public func getValueExternal(_ value: NAPI.Value) throws -> UnsafeMutableRawPointer? {
        var result: UnsafeMutableRawPointer?
        try check(napi_get_value_external(ptr, value.ptr, &result))
        return result
    }
    public func getValueInt32(_ value: NAPI.Value) throws -> Int32 {
        var result: Int32 = 0
        try check(napi_get_value_int32(ptr, value.ptr, &result))
        return result
    }
    public func getValueInt64(_ value: NAPI.Value) throws -> Int64 {
        var result: Int64 = 0
        try check(napi_get_value_int64(ptr, value.ptr, &result))
        return result
    }
    // GetNAPI.ValueStringLatin1 ...
    public func getValueStringUtf8(_ value: NAPI.Value) throws -> String? {
        var bufsize: Int = 0
        try check(napi_get_value_string_utf8(ptr, value.ptr, nil, 0, &bufsize))
        // Add space for \0
        bufsize += 1
        var buffer = [CChar](repeating: 0, count: bufsize)
        var result: Int = 0
        try buffer.withUnsafeMutableBufferPointer {
            try check(napi_get_value_string_utf8(ptr, value.ptr, $0.baseAddress, bufsize, &result))
        }
        return String(cString: buffer)
    }
    // GetValueStringUtf16 ...
    public func getValueUint32(_ value: NAPI.Value) throws -> UInt32 {
        var result: UInt32 = 0
        try check(napi_get_value_uint32(ptr, value.ptr, &result))
        return result
    }

    // MARK: Public Functions to get global instances
    public func getBoolean(_ value: Bool) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_boolean(ptr, value, &result.ptr))
        return result
    }
    public func getGlobal() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_global(ptr, &result.ptr))
        return result
    }
    public func getNull() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_null(ptr, &result.ptr))
        return result
    }
    public func getUndefined() throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_undefined(ptr, &result.ptr))
        return result
    }

    // MARK: Working with JavaScript values and abstract operations
    public func coerceToBool(_ value: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_coerce_to_bool(ptr, value.ptr, &result.ptr))
        return result
    }
    public func coerceToNumber(_ value: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_coerce_to_number(ptr, value.ptr, &result.ptr))
        return result
    }
    public func coerceToObject(_ value: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_coerce_to_object(ptr, value.ptr, &result.ptr))
        return result
    }
    public func coerceToString(_ value: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_coerce_to_string(ptr, value.ptr, &result.ptr))
        return result
    }
    public func typeof(_ value: NAPI.Value) throws -> napi_valuetype {
        var result: napi_valuetype = napi_undefined
        try check(napi_typeof(ptr, value.ptr, &result))
        return result
    }
    public func instanceof(_ object: NAPI.Value, _ constructor: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_instanceof(ptr, object.ptr, constructor.ptr, &result))
        return result
    }
    public func isArray(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_array(ptr, value.ptr, &result))
        return result
    }
    public func isArraybuffer(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_arraybuffer(ptr, value.ptr, &result))
        return result
    }
    public func isBuffer(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_buffer(ptr, value.ptr, &result))
        return result
    }
    public func isDate(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_date(ptr, value.ptr, &result))
        return result
    }
    public func isError(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_error(ptr, value.ptr, &result))
        return result
    }
    public func isTypedarray(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_typedarray(ptr, value.ptr, &result))
        return result
    }
    public func isDataview(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_dataview(ptr, value.ptr, &result))
        return result
    }
    public func strictEquals(_ lhs: NAPI.Value, _ rhs: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_strict_equals(ptr, lhs.ptr, rhs.ptr, &result))
        return result
    }
    public func detachArraybuffer(_ arraybuffer: NAPI.Value) throws {
        try check(napi_detach_arraybuffer(ptr, arraybuffer.ptr))
    }
    public func isDetachedArraybuffer(_ arraybuffer: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_detached_arraybuffer(ptr, arraybuffer.ptr, &result))
        return result
    }

    // MARK: Working with JavaScript properties
    public func getPropertyNames(_ object: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_property_names(ptr, object.ptr, &result.ptr))
        return result
    }
    public func getAllPropertyNames(_ object: NAPI.Value, _ key_mode: napi_key_collection_mode, _ key_filter: napi_key_filter, _ key_conversion: napi_key_conversion) throws -> NAPI.Value {
        var result = NAPI.Value()
        napi_get_all_property_names(ptr, object.ptr, key_mode, key_filter, key_conversion, &result.ptr)
        return result
    }
    public func setProperty(_ object: NAPI.Value, _ key: NAPI.Value, _ value: NAPI.Value) throws {
        try check(napi_set_property(ptr, object.ptr, key.ptr, value.ptr))
    }
    public func getProperty(_ object: NAPI.Value, _ key: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_property(ptr, object.ptr, key.ptr, &result.ptr))
        return result
    }
    public func hasProperty(_ object: NAPI.Value, _ key: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_has_property(ptr, object.ptr, key.ptr, &result))
        return result
    }
    public func deleteProperty(_ object: NAPI.Value, _ key: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_delete_property(ptr, object.ptr, key.ptr, &result))
        return result
    }
    public func hasOwnProperty(_ object: NAPI.Value, _ key: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_has_own_property(ptr, object.ptr, key.ptr, &result))
        return result
    }
    public func setNamedProperty(_ object: NAPI.Value, _ utf8Name: String, _ value: NAPI.Value) throws {
        try check(napi_set_named_property(ptr, object.ptr, utf8Name, value.ptr))
    }
    public func getNamedProperty(_ object: NAPI.Value, _ utf8Name: String) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_named_property(ptr, object.ptr, utf8Name, &result.ptr))
        return result
    }
    public func hasNamedProperty(_ object: NAPI.Value, _ utf8Name: String) throws -> Bool {
        var result = false
        try check(napi_has_named_property(ptr, object.ptr, utf8Name, &result))
        return result
    }
    public func setElement(_ object: NAPI.Value, _ index: UInt32, _ value: NAPI.Value) throws {
        try check(napi_set_element(ptr, object.ptr, index, value.ptr))
    }
    public func getElement(_ object: NAPI.Value, _ index: UInt32) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_element(ptr, object.ptr, index, &result.ptr))
        return result
    }
    public func hasElement(_ object: NAPI.Value, _ index: UInt32) throws -> Bool {
        var result = false
        try check(napi_has_element(ptr, object.ptr, index, &result))
        return result
    }
    public func deleteElement(_ object: NAPI.Value, _ index: UInt32) throws -> Bool {
        var result = false
        try check(napi_delete_element(ptr, object.ptr, index, &result))
        return result
    }
    public func defineProperties(_ object: NAPI.Value, properties: [napi_property_descriptor]) throws {
        try check(napi_define_properties(ptr, object.ptr, properties.count, properties))
    }
    public func objectFreeze(_ object: NAPI.Value) throws {
        try check(napi_object_freeze(ptr, object.ptr))
    }
    public func objectSeal(_ object: NAPI.Value) throws {
        try check(napi_object_seal(ptr, object.ptr))
    }

    // MARK: Working with JavaScript public functions
    public func callFunction(_ recv: NAPI.Value, _ func: NAPI.Value, _ argv: [NAPI.Value]) throws -> NAPI.Value {
        var result = NAPI.Value()
        try argv.map(\.ptr).withUnsafeBufferPointer {
            try check(napi_call_function(ptr, recv.ptr, `func`.ptr, argv.count, $0.baseAddress, &result.ptr))
        }
        return result
    }
    public func createFunction(_ utf8name: String?, _ cb: @escaping NAPI.Callback, _ data: UnsafeMutableRawPointer?) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_create_function(ptr, utf8name, -1, cb, data, &result.ptr))
        return result
    }
    public func getCbInfo(_ cbinfo: NAPI.CallbackInfo) throws -> (argv: [NAPI.Value], this: NAPI.Value, data: UnsafeMutableRawPointer?) {
        var argc: Int = 0
        try check(napi_get_cb_info(ptr, cbinfo.ptr, &argc, nil, nil, nil))
        var argv = [napi_value?](repeating: nil, count: argc)
        var this = NAPI.Value()
        var data: UnsafeMutableRawPointer?
        try argv.withUnsafeMutableBufferPointer {
            try check(napi_get_cb_info(ptr, cbinfo.ptr, &argc, $0.baseAddress, &this.ptr, &data))
        }
        return (argv.map(NAPI.Value.init), this, data)
    }
    public func getNewTarget(_ cbinfo: NAPI.CallbackInfo) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_get_new_target(ptr, cbinfo.ptr, &result.ptr))
        return result
    }
    public func newInstance(_ cons: NAPI.Value, _ argv: [NAPI.Value]) throws -> NAPI.Value {
        var result = NAPI.Value()
        try argv.map(\.ptr).withUnsafeBufferPointer {
            try check(napi_new_instance(ptr, cons.ptr, argv.count, $0.baseAddress, &result.ptr))
        }
        return result
    }

    // MARK: Object wrap
    public func defineClass(_ utf8name: String, _ constructor: @escaping NAPI.Callback, _ data: UnsafeMutableRawPointer?, _ properties: [napi_property_descriptor]) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_define_class(ptr, utf8name, -1, constructor, data, properties.count, properties, &result.ptr))
        return result
    }
    public func wrapAndGetRef(_ jsObject: NAPI.Value, _ nativeObject: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalizeHint: UnsafeMutableRawPointer?) throws -> NAPI.Ref {
        var result = NAPI.Ref()
        try check(napi_wrap(ptr, jsObject.ptr, nativeObject, finalizeCb, finalizeHint, &result.ptr))
        return result
    }
    public func wrapWithoutRef(_ jsObject: NAPI.Value, _ nativeObject: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalizeHint: UnsafeMutableRawPointer?) throws {
        try check(napi_wrap(ptr, jsObject.ptr, nativeObject, finalizeCb, finalizeHint, nil))
    }
    public func unwrap(_ jsObject: NAPI.Value) throws -> UnsafeMutableRawPointer? {
        var result: UnsafeMutableRawPointer?
        try check(napi_unwrap(ptr, jsObject.ptr, &result))
        return result
    }
    public func removeWrap(_ jsObject: NAPI.Value) throws -> UnsafeMutableRawPointer? {
        var result: UnsafeMutableRawPointer?
        try check(napi_remove_wrap(ptr, jsObject.ptr, &result))
        return result
    }
    public func typeTagObject(_ jsObject: NAPI.Value, typeTag: UnsafePointer<napi_type_tag>) throws {
        try check(napi_type_tag_object(ptr, jsObject.ptr, typeTag))
    }
    public func checkObjectTypeTag(_ jsObject: NAPI.Value, typeTag: UnsafePointer<napi_type_tag>) throws -> Bool {
        var result = false
        try check(napi_check_object_type_tag(ptr, jsObject.ptr, typeTag, &result))
        return result
    }
    public func addFinalizerAndGetRef(_ jsObject: NAPI.Value, _ nativeObject: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalizeHint: UnsafeMutableRawPointer?) throws -> NAPI.Ref {
        var result = NAPI.Ref()
        try check(napi_add_finalizer(ptr, jsObject.ptr, nativeObject, finalizeCb, finalizeHint, &result.ptr))
        return result
    }
    public func addFinalizerWithoutRef(_ jsObject: NAPI.Value, _ nativeObject: UnsafeMutableRawPointer?, _ finalizeCb: @escaping NAPI.Finalize, _ finalizeHint: UnsafeMutableRawPointer?) throws {
        try check(napi_add_finalizer(ptr, jsObject.ptr, nativeObject, finalizeCb, finalizeHint, nil))
    }

    // MARK: asynchronous operations
    // napi_create_async_work
    // napi_delete_async_work
    // napi_queue_async_work
    // napi_cancel_async_work

    // MARK: Custom asynchronous operations
    // napi_async_init
    // napi_make_callback
    // napi_open_callback_scope
    // napi_close_callback_scope

    // MARK: Version management

    // Currently unused. If needed, will need a wasm implementation
    // public func getNodeVersion() throws -> UnsafePointer<napi_node_version>? {
    //     var result: UnsafePointer<napi_node_version>?
    //     try check(napi_get_node_version(ptr, &result))
    //     return result
    // }

    public func getVersion() throws -> UInt32 {
        var result: UInt32 = 0
        try check(napi_get_version(ptr, &result))
        return result
    }

    // MARK: Memory management
    public func adjustExternalMemory(changeInBytes: Int64) throws -> Int64 {
        var result: Int64 = 0
        try check(napi_adjust_external_memory(ptr, changeInBytes, &result))
        return result
    }

    // MARK: Promises
    public func createPromise() throws -> (deferred: NAPI.Deferred, promise: NAPI.Value) {
        var deferred = NAPI.Deferred()
        var promise = NAPI.Value()
        try check(napi_create_promise(ptr, &deferred.ptr, &promise.ptr))
        return (deferred, promise)
    }
    public func resolveDeferred(_ deferred: NAPI.Deferred, _ resolution: NAPI.Value) throws {
        try check(napi_resolve_deferred(ptr, deferred.ptr, resolution.ptr))
    }
    public func rejectDeferred(_ deferred: NAPI.Deferred, _ rejection: NAPI.Value) throws {
        try check(napi_reject_deferred(ptr, deferred.ptr, rejection.ptr))
    }
    public func isPromise(_ value: NAPI.Value) throws -> Bool {
        var result = false
        try check(napi_is_promise(ptr, value.ptr, &result))
        return result
    }

    // MARK: Script execution
    public func runScript(_ script: NAPI.Value) throws -> NAPI.Value {
        var result = NAPI.Value()
        try check(napi_run_script(ptr, script.ptr, &result.ptr))
        return result
    }

    // MARK: libuv event loop
    // getUvEventLoop

    // MARK: Asynchronous thread-safe public function calls
    // napi_create_threadsafe_public function
    // napi_get_threadsafe_public function_context
    // napi_call_threadsafe_public function
    // napi_acquire_threadsafe_public function
    // napi_release_threadsafe_public function
    // napi_ref_threadsafe_public function
    // napi_unref_threadsafe_public function

    // MARK: Miscellaneous utilities
    // public func getModuleFileName() throws -> String? {
    //     var result: UnsafePointer<CChar>?
    //     try check(node_api_get_module_file_name(ptr, &result))
    //     return result.map(String.init(cString:))
    // }
}
