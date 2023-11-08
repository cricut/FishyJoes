import Foundation

extension AttributeContainer {
    /// Attributes defined by the Foundation library in ``AttributeScopes``, packaged as a structure.
    ///
    /// This type (and the ones like it defined in other libraries) allow features similar to those offered by dynamic member lookup in ``AttributeScope`` to be exported to other languages.
    ///
    /// An attribute container can be asked to fill in the fields defined by this structure using ``Self/init(_ container: AttributeContainer)``.
    /// This structure can be asked to fill in an attribute container using ``AttributeContainer/init(_ foundationAttributes: FoundationAttributes)``.
    ///
    /// Combining these calls with ``AttributedString/setAttributes(_:)`` and ``AttributedString/mergeAttributes(_:)`` allows expansion of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using dynamic member lookup.
    public struct FoundationAttributes: Hashable {
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
