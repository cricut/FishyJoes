protocol NestedClass: AnyObject {
    associatedtype InnerClass: NestedClass

    var name: String { get }
    var innerClasses: [InnerClass] { get set }
    var unqualifiedName: String { get }
    func fragment(context: FishyJoesContext) -> SourceFragment
}
