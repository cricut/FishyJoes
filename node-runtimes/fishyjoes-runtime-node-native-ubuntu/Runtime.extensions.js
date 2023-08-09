function applyExtensions(library) {
    library.AttributeContainer.FoundationAttributes.create = function(attributes) {
        const container = library.AttributeContainer.FoundationAttributes.createEmpty();
        if (attributes.languageIdentifier) {
            container.languageIdentifier = attributes.languageIdentifier;
        }
        if (attributes.link) {
            container.link = attributes.link;
        }
        return container;
    }

    library.AttributedString.createJoining = function(attributedStrings) {
        const joined = library.AttributedString.createEmpty();
        attributedStrings.forEach(attributedString => joined.append(attributedString));
        return joined;
    }

    library.AttributedString.createJoiningSubstrings = function(attributedSubstrings) {
        const joined = library.AttributedString.createEmpty();
        attributedSubstrings.forEach(attributedString => joined.appendSubstring(attributedString));
        return joined;
    }

    library.AttributedString.Runs.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.AttributedString.Runs.prototype.forEach = function(body) {
        [...this].forEach(body)
    }

    library.AttributedString.CharacterView.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.AttributedString.CharacterView.prototype.forEach = function(body) {
        [...this].forEach(body)
    }

    library.AttributedString.UnicodeScalarView.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.AttributedString.UnicodeScalarView.prototype.forEach = function(body) {
        [...this].forEach(body)
    }
}
const imports = {};
export { applyExtensions, imports };
