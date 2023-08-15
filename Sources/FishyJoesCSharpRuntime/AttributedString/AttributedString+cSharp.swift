import Foundation

extension AttributedString: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString {
        try Box<AttributedString>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString) throws -> R) throws -> R {
        try body(&Box<AttributedString>.peekCSharp(this).value)
    }
}

@_cdecl("TestAPI_AttributedString_setup")
public func TestAPI_AttributedString_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString._constructorMethod == nil else { return }
    AttributedString._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedString_String")
public func __cs_get_AttributedString_String(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> Swift.String.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        let s = try AttributedString.peekCSharp(_cSharpThis)
        return try String.toCSharp(String(s.characters))
    }
}

@_cdecl("__cs_get_AttributedString_Runs")
public func __cs_get_AttributedString_Runs(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Runs.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Runs.toCSharp(AttributedString.peekCSharp(_cSharpThis).runs)
    }
}

@_cdecl("__cs_get_AttributedString_Characters")
public func __cs_get_AttributedString_Characters(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.CharacterView.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.CharacterView.toCSharp(AttributedString.peekCSharp(_cSharpThis).characters)
    }
}

@_cdecl("__cs_get_AttributedString_UnicodeScalars")
public func __cs_get_AttributedString_UnicodeScalars(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.UnicodeScalarView.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.UnicodeScalarView.toCSharp(AttributedString.peekCSharp(_cSharpThis).unicodeScalars)
    }
}

@_cdecl("__cs_get_AttributedString_Substring")
public func __cs_get_AttributedString_Substring(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedSubstring.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        let s = try AttributedString.peekCSharp(_cSharpThis)
        return try AttributedSubstring.toCSharp(s[s.startIndex..<s.endIndex])
    }
}

@_cdecl("__cs_AttributedString_substringForRange")
public func __cs_AttributedString_substringForRange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: csOutExn
) -> AttributedSubstring.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedSubstring.toCSharp(
            AttributedString.peekCSharp(_cSharpThis)[
                try RangeConverter<AttributedString.Index>.peekCSharp(range)
            ]
        )
    }
}

@_cdecl("__cs_get_AttributedString_StartIndex")
public func __cs_get_AttributedString_StartIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.peekCSharp(_cSharpThis).startIndex)
    }
}

@_cdecl("__cs_get_AttributedString_EndIndex")
public func __cs_get_AttributedString_EndIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.peekCSharp(_cSharpThis).endIndex)
    }
}

@_cdecl("__cs_AttributedString_append")
public func __cs_AttributedString_append(
    _cSharpThis: csObject,
    attributedString: AttributedString.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.append(
                    try AttributedString.peekCSharp(attributedString)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_appendSubstring")
public func __cs_AttributedString_appendSubstring(
    _cSharpThis: csObject,
    substring: AttributedSubstring.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.append(
                    try AttributedSubstring.peekCSharp(substring)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_insert")
public func __cs_AttributedString_insert(
    _cSharpThis: csObject,
    attributedString: AttributedString.CType,
    index: AttributedString.Index.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.insert(
                    try AttributedString.peekCSharp(attributedString),
                    at: try AttributedString.Index.peekCSharp(index)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_insertSubstring")
public func __cs_AttributedString_insertSubstring(
    _cSharpThis: csObject,
    substring: AttributedSubstring.CType,
    index: AttributedString.Index.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.insert(
                    try AttributedSubstring.peekCSharp(substring),
                    at: try AttributedString.Index.peekCSharp(index)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_replaceSubrange")
public func __cs_AttributedString_replaceSubrange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributedString: AttributedString.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.replaceSubrange(
                    try RangeConverter<AttributedString.Index>.peekCSharp(range),
                    with: try AttributedString.peekCSharp(attributedString)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_replaceSubrangeWithSubstring")
public func __cs_AttributedString_replaceSubrangeWithSubstring(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    substring: AttributedSubstring.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.replaceSubrange(
                    try RangeConverter<AttributedString.Index>.peekCSharp(range),
                    with: try AttributedSubstring.peekCSharp(substring)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_removeSubrange")
public func __cs_AttributedString_removeSubrange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.removeSubrange(
                    try RangeConverter<AttributedString.Index>.peekCSharp(range)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_setAttributes")
public func __cs_AttributedString_setAttributes(
    _cSharpThis: csObject,
    attributes: AttributeContainer.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.setAttributes(
                    try AttributeContainer.peekCSharp(attributes)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_setAttributesForRange")
public func __cs_AttributedString_setAttributesForRange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekCSharp(range)].setAttributes(
                    try AttributeContainer.peekCSharp(attributes)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_mergeAttributes")
public func __cs_AttributedString_mergeAttributes(
    _cSharpThis: csObject,
    attributes: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.mergeAttributes(
                    try AttributeContainer.peekCSharp(attributes),
                    mergePolicy: !Bool.peekCSharp(keepCurrent) ? .keepNew : .keepCurrent
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_mergeAttributesForRange")
public func __cs_AttributedString_mergeAttributesForRange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekCSharp(range)].mergeAttributes(
                    try AttributeContainer.peekCSharp(attributes),
                    mergePolicy: !Bool.peekCSharp(keepCurrent) ? .keepNew : .keepCurrent
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_replaceAttributes")
public func __cs_AttributedString_replaceAttributes(
    _cSharpThis: csObject,
    attributes: AttributeContainer.CType,
    others: AttributeContainer.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.replaceAttributes(
                    try AttributeContainer.peekCSharp(attributes),
                    with: try AttributeContainer.peekCSharp(others)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_replaceAttributesForRange")
public func __cs_AttributedString_replaceAttributesForRange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    attributes: AttributeContainer.CType,
    others: AttributeContainer.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf[try RangeConverter<AttributedString.Index>.peekCSharp(range)].replaceAttributes(
                    try AttributeContainer.peekCSharp(attributes),
                    with: try AttributeContainer.peekCSharp(others)
                )
            )
        }
    }
}

@_cdecl("__cs_AttributedString_equals")
public func AttributedString_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedString.peekCSharp(lhs) == AttributedString.peekCSharp(rhs))
    }
}

@_cdecl("__cs_AttributedString_hash")
public func AttributedString_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedString.peekCSharp(this).hashValue)
        )
    }
}

@_cdecl("__cs_AttributedString_createEmpty")
public func __cs_AttributedString_createEmpty(
    _exn: csOutExn
) -> AttributedString.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.toCSharp(
            AttributedString(
            )
        )
    }
}

@_cdecl("__cs_AttributedString_create")
public func __cs_AttributedString_create(
    string: Swift.String.CType,
    attributes: OptionalConverter<AttributeContainer>.CType,
    _exn: csOutExn
) -> AttributedString.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.toCSharp(
            AttributedString(
                try Swift.String.peekCSharp(string),
                attributes: try OptionalConverter<AttributeContainer>.peekCSharp(attributes) ?? .init()
            )
        )
    }
}

@_cdecl("__cs_AttributedString_createFromSubstring")
public func __cs_AttributedString_createFromSubstring(
    substring: AttributedSubstring.CType,
    _exn: csOutExn
) -> AttributedString.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.toCSharp(
            AttributedString(
                try AttributedSubstring.peekCSharp(substring)
            )
        )
    }
}
