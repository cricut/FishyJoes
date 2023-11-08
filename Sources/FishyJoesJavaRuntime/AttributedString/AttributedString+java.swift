import Foundation

extension AttributedString: JavaMutator {
    public static var javaClass: jclass?
    private static var _constructorMethodID: jmethodID!

    public static func fromJava(_ value: jobject?, env: Env) throws -> AttributedString {
        try Box<AttributedString>.fromJava(value, env: env).value
    }

    public static func toJava(_ value: AttributedString, env: Env) throws -> jobject? {
        let ptr = jvalue(pointer: Box(value).retainedOpaque())
        return try env.NewObject(javaClass, _constructorMethodID, ptr)
    }

    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout AttributedString) throws -> R) throws -> R {
        try body(&Box<AttributedString>.fromJava(this, env: env).value)
    }

    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        try AnyBox.javaSetup(env: env)
        javaClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/AttributedString"))
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(J)V")
        let bag = CStringBag()
        try env.RegisterNatives(
            javaClass,
            JNINativeMethod(
                name: bag.add("__jni_get_string"),
                signature: bag.add("()Ljava/lang/String;"),
                fnPtr: unsafeBitCast(_java_string, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_runs"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Runs;"),
                fnPtr: unsafeBitCast(_java_runs, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_characters"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$CharacterView;"),
                fnPtr: unsafeBitCast(_java_characters, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_unicodeScalars"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView;"),
                fnPtr: unsafeBitCast(_java_unicodeScalars, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_substring"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(_java_substring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_substringForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)Lcom/cricut/fishyjoes/runtime/AttributedSubstring;"),
                fnPtr: unsafeBitCast(_java_substringForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_startIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_startIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_get_endIndex"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString$Index;"),
                fnPtr: unsafeBitCast(_java_endIndex, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_append"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;)V"),
                fnPtr: unsafeBitCast(_java_append, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_appendSubstring"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedSubstring;)V"),
                fnPtr: unsafeBitCast(_java_appendSubstring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_insert"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)V"),
                fnPtr: unsafeBitCast(_java_insert, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_insertSubstring"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedSubstring;Lcom/cricut/fishyjoes/runtime/AttributedString$Index;)V"),
                fnPtr: unsafeBitCast(_java_insertSubstring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributedString;)V"),
                fnPtr: unsafeBitCast(_java_replaceSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceSubrangeWithSubstring"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributedSubstring;)V"),
                fnPtr: unsafeBitCast(_java_replaceSubrangeWithSubstring, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_removeSubrange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;)V"),
                fnPtr: unsafeBitCast(_java_removeSubrange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_setAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(_java_setAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_setAttributesForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(_java_setAttributesForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_mergeAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;Z)V"),
                fnPtr: unsafeBitCast(_java_mergeAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_mergeAttributesForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributeContainer;Z)V"),
                fnPtr: unsafeBitCast(_java_mergeAttributesForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceAttributes"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributeContainer;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(_java_replaceAttributes, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_replaceAttributesForRange"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/SwiftRange;Lcom/cricut/fishyjoes/runtime/AttributeContainer;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)V"),
                fnPtr: unsafeBitCast(_java_replaceAttributesForRange, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_swiftEquals"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedString;Lcom/cricut/fishyjoes/runtime/AttributedString;)Z"),
                fnPtr: unsafeBitCast(_java_equals, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_hashCode"),
                signature: bag.add("()I"),
                fnPtr: unsafeBitCast(_java_hash, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createEmpty"),
                signature: bag.add("()Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(_java_createEmpty, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_create"),
                signature: bag.add("(Ljava/lang/String;Lcom/cricut/fishyjoes/runtime/AttributeContainer;)Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(_java_create, to: UnsafeMutableRawPointer.self)
            ),
            JNINativeMethod(
                name: bag.add("__jni_createFromSubstring"),
                signature: bag.add("(Lcom/cricut/fishyjoes/runtime/AttributedSubstring;)Lcom/cricut/fishyjoes/runtime/AttributedString;"),
                fnPtr: unsafeBitCast(_java_createFromSubstring, to: UnsafeMutableRawPointer.self)
            )
        )
        try AttributeContainer.javaSetup(env: env)
        try AttributedSubstring.javaSetup(env: env)
        try AttributedString.Index.javaSetup(env: env)
        try AttributedString.UnicodeScalarView.javaSetup(env: env)
        try AttributedString.CharacterView.javaSetup(env: env)
        try AttributedString.Runs.javaSetup(env: env)
    }

    private static let _java_string: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> String.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let s = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try String.toJava(String(s.characters), env: _javaEnv)
        }
    }

    private static let _java_runs: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Runs.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Runs.toJava(AttributedString.fromJava(_javaThis, env: _javaEnv).runs, env: _javaEnv)
        }
    }

    private static let _java_characters: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.CharacterView.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.CharacterView.toJava(AttributedString.fromJava(_javaThis, env: _javaEnv).characters, env: _javaEnv)
        }
    }

    private static let _java_unicodeScalars: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.UnicodeScalarView.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.UnicodeScalarView.toJava(AttributedString.fromJava(_javaThis, env: _javaEnv).unicodeScalars, env: _javaEnv)
        }
    }

    private static let _java_substring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedSubstring.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            let s = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedSubstring.toJava(s[s.startIndex..<s.endIndex], env: _javaEnv)
        }
    }

    private static let _java_substringForRange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType
    ) -> AttributedSubstring.CType = { _javaEnv, _javaThis, range in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedSubstring.toJava(
                AttributedString.fromJava(_javaThis, env: _javaEnv)[
                    try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)
                ],
                env: _javaEnv
            )
        }
    }

    private static let _java_startIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.fromJava(_javaThis, env: _javaEnv).startIndex, env: _javaEnv)
        }
    }

    private static let _java_endIndex: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.Index.CType = { _javaEnv, _javaThis in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            try AttributedString.Index.toJava(AttributedString.fromJava(_javaThis, env: _javaEnv).endIndex, env: _javaEnv)
        }
    }

    private static let _java_append: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, s in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.append(
                        try AttributedString.fromJava(s, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_appendSubstring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedSubstring.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, s in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.append(
                        try AttributedSubstring.fromJava(s, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_insert: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedString.CType,
        AttributedString.Index.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, s, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.insert(
                        try AttributedString.fromJava(s, env: _javaEnv),
                        at: try AttributedString.Index.fromJava(index, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_insertSubstring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedSubstring.CType,
        AttributedString.Index.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, s, index in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.insert(
                        try AttributedSubstring.fromJava(s, env: _javaEnv),
                        at: try AttributedString.Index.fromJava(index, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_replaceSubrange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType,
        AttributedString.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range, s in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.replaceSubrange(
                        try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv),
                        with: try AttributedString.fromJava(s, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_replaceSubrangeWithSubstring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType,
        AttributedSubstring.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range, s in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.replaceSubrange(
                        try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv),
                        with: try AttributedSubstring.fromJava(s, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_removeSubrange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        RangeConverter<AttributedString.Index>.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.removeSubrange(
                        try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_setAttributes: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributeContainer.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, attributes in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.setAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_setAttributesForRange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject,
        AttributeContainer.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range, attributes in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf[try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)].setAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_mergeAttributes: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributeContainer.CType,
        jboolean
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, attributes, keepCurrent in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.mergeAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv),
                        mergePolicy: keepCurrent == jboolean(JNI_FALSE) ? .keepNew : .keepCurrent
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_mergeAttributesForRange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject,
        AttributeContainer.CType,
        jboolean
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range, attributes, keepCurrent in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf[try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)].mergeAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv),
                        mergePolicy: keepCurrent == jboolean(JNI_FALSE) ? .keepNew : .keepCurrent
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_replaceAttributes: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributeContainer.CType,
        AttributeContainer.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, attributes, others in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf.replaceAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv),
                        with: try AttributeContainer.fromJava(others, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_replaceAttributesForRange: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        jobject,
        AttributeContainer.CType,
        AttributeContainer.CType
    ) -> VoidConverter.CType = { _javaEnv, _javaThis, range, attributes, others in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            var mutatingSelf = try AttributedString.fromJava(_javaThis, env: _javaEnv)
            return try AttributedString.mutateJava(_javaThis, env: _javaEnv) { mutatingSelf in
                return try VoidConverter.toJava(
                    mutatingSelf[try RangeConverter<AttributedString.Index>.fromJava(range, env: _javaEnv)].replaceAttributes(
                        try AttributeContainer.fromJava(attributes, env: _javaEnv),
                        with: try AttributeContainer.fromJava(others, env: _javaEnv)
                    ),
                    env: _javaEnv
                )
            }
        }
    }

    private static let _java_equals: @convention(c)(
        UnsafeMutablePointer<JNIEnv?>,
        jobject?,
        jobject?,
        jobject?
    ) -> Bool.CType = { _javaEnv, _, lhs, rhs in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try Bool.toJava(
                AttributedString.fromJava(lhs, env: _javaEnv) == AttributedString.fromJava(rhs, env: _javaEnv),
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
                Int32(truncatingIfNeeded: AttributedString.fromJava(_javaThis, env: _javaEnv).hashValue),
                env: _javaEnv
            )
        }
    }

    private static let _java_createEmpty: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject
    ) -> AttributedString.CType = { _javaEnv, _ in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.toJava(
                AttributedString(
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_create: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        Swift.String.CType,
        OptionalConverter<AttributeContainer>.CType
    ) -> AttributedString.CType = { _javaEnv, _, string, attributes in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.toJava(
                AttributedString(
                    try Swift.String.fromJava(string, env: _javaEnv),
                    attributes: try OptionalConverter<AttributeContainer>.fromJava(attributes, env: _javaEnv) ?? .init()
                ),
                env: _javaEnv
            )
        }
    }

    private static let _java_createFromSubstring: @convention(c) (
        UnsafeMutablePointer<JNIEnv?>,
        jobject,
        AttributedSubstring.CType
    ) -> AttributedString.CType = { _javaEnv, _, substring in
        FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in
            return try AttributedString.toJava(
                AttributedString(
                    try AttributedSubstring.fromJava(substring, env: _javaEnv)
                ),
                env: _javaEnv
            )
        }
    }
}
