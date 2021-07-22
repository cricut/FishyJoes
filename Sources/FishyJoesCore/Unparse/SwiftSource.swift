// enum SwiftSource {
//     struct Method {
//         let annotations: [String]
//         let name: String
//         let parameters: [CFacingFormal]
//         let `throws`: Bool
//         let returnType: BetterType
//         let body: Body

//         enum Body {
//             case oneLiner(Expression)
//             case multiLiner([Statement])
//         }
//     }

//     struct Extension {
//         let extending: BetterType
//         let conformingTo: [String]
//         var methods: [Method] = []
//     }

//     indirect enum Expression {
//         case `try`(Expression)
//         case namedCall(String, [(String?, Expression)])
//     }

//     enum Statement {
//         case `let`(String, Expression)
//         case expression(Expression)
//     }
// }

// extension SwiftSource.Extension {
//     // var fragment: SourceFragment {
//     //     let fragment =
//     // }
// }
