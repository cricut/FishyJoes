import SourceryRuntime

struct TranslatedAttributedString: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedString"
    let nodeName = "AttributedString"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedString"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString")
    let cppName = "AttributedString"
    let definingModule = Module.runtime
}

struct TranslatedAttributedSubstring: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedSubstring"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring"
    let nodeName = "AttributedSubstring"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedSubstring")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString")
    let cppName = "AttributedString"
    let definingModule = Module.runtime
}

struct TranslatedAttributeContainer: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributeContainer"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributeContainer"
    let nodeName = "AttributeContainer"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributeContainer"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributeContainer")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributeContainer")
    let cppName = "AttributeContainer"
    let definingModule = Module.runtime
}

struct TranslatedAttributeContainerFoundationAttributes: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributeContainer.FoundationAttributes"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributeContainer.FoundationAttributes"
    let nodeName = "AttributeContainer.FoundationAttributes"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributeContainerFoundationAttributes"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributeContainerFoundationAttributes")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributeContainerFoundationAttributes")
    let cppName = "AttributeContainerFoundationAttributes"
    let definingModule = Module.runtime
}

struct TranslatedAttributeScope: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributeScope"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributeScope"
    let nodeName = "AttributeScope"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributeScope"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributeScope")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributeScope")
    let cppName = "AttributeScope"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringAttributeMergePolicy: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.AttributeMergePolicy"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.AttributeMergePolicy"
    let nodeName = "AttributedSubstring.AttributeMergePolicy"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.AttributeMergePolicy"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$AttributeMergePolicy")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.AttributeMergePolicy")
    let cppName = "AttributedString::AttributeMergePolicy"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringIndex: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.Index"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.Index"
    let nodeName = "AttributedSubstring.Index"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.Index"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$Index")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.Index")
    let cppName = "AttributedString::Index"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringUnicodeScalarView: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.UnicodeScalarView"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.UnicodeScalarView"
    let nodeName = "AttributedSubstring.UnicodeScalarView"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.UnicodeScalarView"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$UnicodeScalarView")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.UnicodeScalarView")
    let cppName = "AttributedString::UnicodeScalarView"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringCharacterView: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.CharacterView"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.CharacterView"
    let nodeName = "AttributedSubstring.CharacterView"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.CharacterView"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$CharacterView")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.CharacterView")
    let cppName = "AttributedString::CharacterView"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringRuns: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.Runs"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.Runs"
    let nodeName = "AttributedSubstring.Runs"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.Runs"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$Runs")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.Runs")
    let cppName = "AttributedString::Runs"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringRunsIndex: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.Runs.Index"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.Runs.Index"
    let nodeName = "AttributedSubstring.Runs.Index"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.Runs.Index"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$Runs$Index")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.Runs.Index")
    let cppName = "AttributedString::Runs::Index"
    let definingModule = Module.runtime
}

struct TranslatedAttributedStringRunsRun: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.AttributedString.Runs.Run"))
    let containedNamedTypes: [TranslatedType] = []
    let neutralName = "AttributedSubstring.Runs.Run"
    let nodeName = "AttributedSubstring.Runs.Run"
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let kotlinName = "AttributedSubstring.Runs.Run"
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/AttributedString$Runs$Run")
    let cSharpType = CSharpClass.CSType.named(package: "Cricut.FishyJoesRuntime", name: "AttributedString.Runs.Run")
    let cppName = "AttributedString::Runs::Run"
    let definingModule = Module.runtime
}
