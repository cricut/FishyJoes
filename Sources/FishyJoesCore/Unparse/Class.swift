/// The FishyJoes Class properties that are needed for processing of fragments.
protocol Class: _Class where InnerClass == Self {}

/// Use `Class` instead of using this directly.
///
/// It is a shim around this that helps resolved assoicated type vs Self class issues.
protocol _Class: AnyObject {
    associatedtype InnerClass

    var name: String { get }
    var innerClasses: [InnerClass] { get set }
    var unqualifiedName: String { get }
    var fragment: SourceFragment { get }
}
