protocol NestedClass<InnerClass>: AnyObject {
    associatedtype InnerClass: NestedClass

    var name: String { get }
    var innerClasses: [InnerClass] { get set }
    var unqualifiedName: String { get }
    func fragments(context: FishyJoesContext) -> [SourceFragment]
}
