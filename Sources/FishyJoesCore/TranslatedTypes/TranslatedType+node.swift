extension TranslatedType {
    public func expectedTypes(context: FishyJoesContext, fields: [Field]) -> String {
        let expectedArgTypes = fields.map {
            guard !$0.type.name.starts(with: "Optional") else {
                // any optional type in swift is mapped to napi_undefined
                return "napi_undefined"
            }
            guard !$0.type.name.starts(with: "Array"),
                  !$0.type.name.starts(with: "Set"),
                  !$0.type.name.starts(with: "Dictionary") else {
                return "napi_object"
            }
            let resolved = context.resolve(type: $0.type)
            guard !(resolved is TranslatedFunction) else {
                return "napi_function"
            }

            switch resolved.nodeName {
            case "undefined":
                return "napi_undefined"
            case "null":
                return "napi_null"
            case "boolean":
                return "napi_boolean"
            case "number":
                return "napi_number"
            case "string":
                return "napi_string"
            case "symbol":
                return "napi_symbol"
            case "object":
                return "napi_object"
            case "function":
                return "napi_function"
            case "external":
                return "napi_external"
            case "bigint":
                return "napi_bigint"
            default:
                return "napi_undefined"
            }
        }.joined(separator: ", ")

        return expectedArgTypes
    }
}
