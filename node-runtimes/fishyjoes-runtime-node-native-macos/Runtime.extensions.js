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

//    library.AttributedString.Runs.forEach = function(body) {
//        let index = this.startIndex;
//        while (!index.equals(this.endIndex)) {
//            const element = this.elementAt(index);
//            body(element);
//            index = this.indexAfter(index);
//        }
//    }
//
//    library.AttributedString.Runs[Symbol.iterator] = function* () {
//        const iterator = library.AttributedString.RunIterator(this);
//        let element = iterator.next();
//        while (!element.done) {
//            yield element.value;
//            element = iterator.next();
//        }
//    }
}
const imports = {};
export { applyExtensions, imports };
