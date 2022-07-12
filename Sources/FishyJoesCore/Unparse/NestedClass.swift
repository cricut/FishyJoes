/// The FishyJoes Class properties that are needed for processing of fragments.
protocol NestedClass: _NestedClass where InnerClass == Self {}

/// Use `Class` instead of using this directly.
///
/// It is a shim around this that helps resolved assoicated type vs Self class issues.
protocol _NestedClass: AnyObject {
    associatedtype InnerClass

    var name: String { get }
    var innerClasses: [InnerClass] { get set }
    var unqualifiedName: String { get }
    func fragment(context: FishyJoesContext) -> SourceFragment
}
