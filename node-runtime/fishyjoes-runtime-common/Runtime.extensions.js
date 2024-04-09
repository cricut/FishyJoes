function applyExtensions(library, { wasmNapi } = {}) {
    library.Runtime.AttributeContainer.FoundationAttributes.create = function(attributes) {
        const container = library.Runtime.AttributeContainer.FoundationAttributes.createEmpty();
        if (attributes.languageIdentifier) {
            container.languageIdentifier = attributes.languageIdentifier;
        }
        if (attributes.link) {
            container.link = attributes.link;
        }
        return container;
    }

    library.Runtime.AttributedString.createJoining = function(attributedStrings) {
        const joined = library.Runtime.AttributedString.createEmpty();
        attributedStrings.forEach(attributedString => joined.append(attributedString));
        return joined;
    }

    library.Runtime.AttributedString.createJoiningSubstrings = function(attributedSubstrings) {
        const joined = library.Runtime.AttributedString.createEmpty();
        attributedSubstrings.forEach(attributedString => joined.appendSubstring(attributedString));
        return joined;
    }

    library.Runtime.AttributedString.Runs.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.Runtime.AttributedString.Runs.prototype.forEach = function(callback) {
        [...this].forEach(callback)
    }

    library.Runtime.AttributedString.CharacterView.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.Runtime.AttributedString.CharacterView.prototype.forEach = function(callback) {
        [...this].forEach(callback)
    }

    library.Runtime.AttributedString.UnicodeScalarView.prototype[Symbol.iterator] = function* () {
        let index = this.startIndex;
        while (!index.equals(this.endIndex)) {
            yield this.elementAt(index)
            index = this.indexAfter(index)
        }
    }

    library.Runtime.AttributedString.UnicodeScalarView.prototype.forEach = function(callback) {
        [...this].forEach(callback)
    }

    if (typeof wasmNapi !== 'undefined') {
        library.Runtime._DataNodeConverter = {
            fromWasi(arrayBufferLike, outBufferSize, outBufferPtr) {
                let buffer = arrayBufferLike;
                let offset = 0;
                const length = arrayBufferLike.byteLength;

                if (!(arrayBufferLike instanceof ArrayBuffer)) {
                    // Assume it's a TypedBuffer (including node's Buffer type)
                    buffer = arrayBufferLike.buffer;
                    offset = arrayBufferLike.byteOffset;
                }
                if (outBufferSize != length) {
                    throw new Error("internal error: Runtime._DataNodeConverter.fromWasi size mismatch");
                }
                const view = new Uint8Array(wasmNapi.memory.buffer, outBufferPtr, length);
                view.set(new Uint8Array(buffer, offset, length));
                wasmNapi.wasi.refreshMemory();
            },
            toWasi(byteLength, dataPtr) {
                const buffer = wasmNapi.memory.buffer.slice(dataPtr, dataPtr + byteLength);
                return buffer;
            },
        }
    }
}
const imports = {};
export { applyExtensions, imports };
