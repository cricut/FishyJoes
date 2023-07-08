import Foundation

extension AttributeContainer {
    /// Attributes defined by the Foundation library in ``AttributeScopes``, packaged as a structure.
    ///
    /// This type (and the ones like it defined in other libraries) allow features similar to those offered by dynamic member lookup in ``AttributeScope`` to be exported to other languages.
    ///
    /// An attribute container can be asked to fill in the fields defined by this structure using `Self/init(_ container: AttributeContainer)`.
    /// This structure can be asked to fill in an attribute container using `AttributeContainer/init(_ foundationAttributes: FoundationAttributes`).
    ///
    /// Combining these calls with ``AttributedString/setAttributes(_:)`` and ``AttributedString/mergeAttributes(_:)`` allows expansion of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using dynamic member lookup.
    public struct FoundationAttributes: Hashable, Sendable {
        public var link: AttributeScopes.FoundationAttributes.LinkAttribute.Value?
        //    public var morphology: AttributeScopes.FoundationAttributes.MorphologyAttribute.Value?
        //    public var inflect: AttributeScopes.FoundationAttributes.InflectionRuleAttribute.Value?
        public var languageIdentifier: AttributeScopes.FoundationAttributes.LanguageIdentifierAttribute.Value?
        //    public var personNameComponent: AttributeScopes.FoundationAttributes.PersonNameComponentAttribute.Value?
        //    public var numberFormat: AttributeScopes.FoundationAttributes.NumberFormatAttributes.Value?
        //    public var dateField: AttributeScopes.FoundationAttributes.DateFieldAttribute.Value?
        //    public var inlinePresentationIntent: AttributeScopes.FoundationAttributes.InlinePresentationIntentAttribute.Value?
        //    public var presentationIntent: AttributeScopes.FoundationAttributes.PresentationIntentAttribute.Value?
        //    public var alternateDescription: AttributeScopes.FoundationAttributes.AlternateDescriptionAttribute.Value?
        //    public var imageURL: AttributeScopes.FoundationAttributes.ImageURLAttribute.Value?
        //    public var replacementIndex: AttributeScopes.FoundationAttributes.ReplacementIndexAttribute.Value?
        //    public var measurement: AttributeScopes.FoundationAttributes.MeasurementAttribute.Value?
        //    public var inflectionAlternative: AttributeScopes.FoundationAttributes.InflectionAlternativeAttribute.Value?
        //    public var byteCount: AttributeScopes.FoundationAttributes.ByteCountAttribute.Value?

        public init(
            link: AttributeScopes.FoundationAttributes.LinkAttribute.Value? = nil,
            languageIdentifier: AttributeScopes.FoundationAttributes.LanguageIdentifierAttribute.Value? = nil
        ) {
            self.link = link
            self.languageIdentifier = languageIdentifier
        }

        public init(_ container: AttributeContainer) {
            self.link = container.link
            self.languageIdentifier = container.languageIdentifier
        }
    }

    public init(_ foundationAttributes: FoundationAttributes) {
        self = AttributeContainer()
        if let link = foundationAttributes.link {
            self.link = link
        }
        if let languageIdentifier = foundationAttributes.languageIdentifier {
            self.languageIdentifier = languageIdentifier
        }
    }
}

extension AttributeContainer.FoundationAttributes: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributeContainer.FoundationAttributes {
        try Box<AttributeContainer.FoundationAttributes>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributeContainer.FoundationAttributes, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributeContainer.FoundationAttributes) throws -> R) throws -> R {
        try body(&Box<AttributeContainer.FoundationAttributes>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(
            AttributeContainer.FoundationAttributes.javaClass,
            JNINativeMethod(
                name: bag.add("__jni_createEmpty"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes;"),
                fnPtr: unsafeBitCast(_java_createEmpty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createFromContainer"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;)Lcom/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes;"),
                fnPtr: unsafeBitCast(_java_createFromContainer, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_asContainer"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributeContainer;"),
                fnPtr: unsafeBitCast(_java_asContainer, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_link"),
                signature: bag.add("()Ljava/net/URL;"),
                fnPtr: unsafeBitCast(_java_get_link, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_link"),
                signature: bag.add("(Ljava/net/URL;)V"),
                fnPtr: unsafeBitCast(_java_set_link, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_languageIdentifier"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(_java_get_languageIdentifier, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_set_languageIdentifier"),
                signature: bag.add("(Ljava/lang/String;)V"),
                fnPtr: unsafeBitCast(_java_set_languageIdentifier, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes;Lcom/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes;)Z"),
                fnPtr: unsafeBitCast(_java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_java_hash, to: UnsafeMutableRawPointer.self)
            )
        )
    }

    private static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributeContainer.FoundationAttributes.fromJava(lhs, env: _javaEnv) == AttributeContainer.FoundationAttributes.fromJava(rhs, env: _javaEnv),
                env: _javaEnv
            )
        }
    }

    private static let _java_hash: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?
    ) -> Int32.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Int32.toJava(
                Int32(truncatingIfNeeded: AttributeContainer.FoundationAttributes.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }

    private static let _java_createEmpty: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributeContainer.FoundationAttributes.CType = { _javaEnv, _ in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributeContainer.FoundationAttributes.toJava(
                AttributeContainer.FoundationAttributes(
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_createFromContainer: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject
    ) -> AttributeContainer.FoundationAttributes.CType = { _javaEnv, _, container in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributeContainer.FoundationAttributes.toJava(
                AttributeContainer.FoundationAttributes(
                    AttributeContainer.fromJava(container, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_asContainer: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributeContainer.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributeContainer.toJava(
                AttributeContainer(AttributeContainer.FoundationAttributes.fromJava(_javaThis, env: _javaEnv)),
                env: _javaEnv
            )
        }
    }

    private static let _java_get_link: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> OptionalConverter<URL>.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try OptionalConverter<URL>.toJava(
                AttributeContainer.FoundationAttributes.fromJava(_javaThis, env: _javaEnv).link,
                env: _javaEnv
            )
        }
    }

    private static let _java_set_link: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, link in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributeContainer.FoundationAttributes.mutateJava(_javaThis, env: _javaEnv) {
                $0.link = try OptionalConverter<URL>.fromJava(link, env: _javaEnv)
            }
        }
    }

    private static let _java_get_languageIdentifier: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> OptionalConverter<String>.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try OptionalConverter<String>.toJava(
                AttributeContainer.FoundationAttributes.fromJava(_javaThis, env: _javaEnv).languageIdentifier,
                env: _javaEnv
            )
        }
    }

    private static let _java_set_languageIdentifier: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, languageIdentifier in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributeContainer.FoundationAttributes.mutateJava(_javaThis, env: _javaEnv) {
                $0.languageIdentifier = try OptionalConverter<String>.fromJava(languageIdentifier, env: _javaEnv)
            }
        }
    }
}
