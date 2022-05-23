import Foundation
import SourceryRuntime

/*
 * Helps generate psuedocode-ish files showing internal details used by FishyJoes during code generation
 */

class NeutralTranslate {
    func output(method: Method, context: FishyJoesContext, fragment: SourceFragment) {
        fragment.outputBlock("Method \(method.name) {") {
            fragment.output("Annotation: \(method.exportAnnotation)")
            fragment.output("Generic Overrides: \(method.exportAnnotation.genericOverrides)")
            fragment.output("Call Name: \(method.callName)")
            fragment.output("Static: \(method.isStatic)")
            fragment.output("Mutating: \(method.isMutating)")
            fragment.output("Throwing: \(method.isThrowing)")
            fragment.output("Initializer: \(method.isInitializer)")
            fragment.outputBlock("Documentation {") {
                for doc in method.documentation {
                    fragment.output(doc)
                }
            }
            fragment.outputBlock("Parameters {") {
                for param in method.parameters {
                    let resolvedType = context.resolve(type: param.type, generics: method.exportAnnotation.genericOverrides)
                    if param.label == param.name || param.label == nil {
                        fragment.output("\(param.name): \(resolvedType.neutralName)")
                    } else {
                        fragment.output("\(param.label!) \(param.name): \(resolvedType.neutralName)")
                    }
                }
            }
            let resolvedReturn = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
            fragment.output("Return Type: \(resolvedReturn.neutralName)")
        }
    }

    func output(variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
        fragment.outputBlock("Variable {") {
            if let annotation = variable.exportAnnotation {
                fragment.output("Annotation: \(annotation)")
            }
            fragment.output("Name: \(variable.exportAnnotation?.name ?? "not exported")")
            fragment.output("Type: \(context.resolve(type: variable.typeName.better).neutralName)")
            fragment.output("Mutable: \(variable.isMutable && variable.accessLevel.write == .public)")
            if let containingType = variable.definedInTypeName?.better {
                fragment.output("Defined in: \(containingType.name)")
            } else {
                fragment.output("Does not belong to a type")
            }
        }
    }
}
