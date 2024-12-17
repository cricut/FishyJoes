function applyExtensions(library, { wasmNapi } = {}) {
    // TODO: why is this function being applied multiple times in the first place?
    if (library.Runtime.__extensionsApplied !== undefined) {
        return
    }
    library.Runtime.__extensionsApplied = true;
    // TODO: unify this file and the .d.ts into a single .ts file
    // The .js and .d.ts code for result was generated from this TS:

    // class Result<out T, out E> {
    //     readonly contents: { success: T } | { error: E }
    //
    //     private constructor(contents: { success: T } | { error: E }) {
    //         this.contents = contents
    //     }
    //
    //     static success<T>(success: T): Result<T, never> {
    //         return new Result<T, never>({ success })
    //     }
    //
    //     static failure<E>(error: E): Result<never, E> {
    //         return new Result<never, E>({ error })
    //     }
    //
    //     match<R>(onSuccess: (success: T) => R, onError: (error: E) => R) {
    //         return 'success' in this.contents ? onSuccess(this.contents.success) : onError(this.contents.error)
    //     }
    //
    //     isSuccess(): boolean {
    //         return 'success' in this.contents
    //     }
    //
    //     map<T2>(transform: (x: T) => T2): Result<T2, E> {
    //         return this.match<Result<T2, E>>(x => Result.success(transform(x)), Result.failure);
    //     }
    //
    //     flatMap<T2>(transform: (x: T) => Result<T2, E>): Result<T2, E> {
    //         return this.match(transform, Result.failure)
    //     }
    //
    //     // This signature is not currently possible in typescript: https://github.com/Microsoft/TypeScript/issues/14520
    //     // getOrElse<R super T>(alternative: (error: E) => R): R
    //     // use this one instead
    //     getOrElse<R = T>(alternative: (error: E) => R): T | R {
    //         return this.match<T | R>(it => it, alternative)
    //     }
    //
    //     getOrThrow(): T {
    //         return this.getOrElse(e => { throw e })
    //     }
    //
    //     getOrUndefined(): T | undefined {
    //         return this.getOrElse(_ => undefined)
    //     }
    //
    //     exceptionOrUndefined(): E | undefined {
    //         return this.match<E | undefined>(_ => undefined, e => e)
    //     }
    // };

    library.Runtime.Result = class Result {
        constructor(contents) {
            this.contents = contents;
        }
        static success(success) {
            return new Result({ success });
        }
        static failure(error) {
            return new Result({ error });
        }
        match(onSuccess, onError) {
            return 'success' in this.contents ? onSuccess(this.contents.success) : onError(this.contents.error);
        }
        isSuccess() {
            return 'success' in this.contents;
        }
        map(transform) {
            return this.match(x => Result.success(transform(x)), Result.failure);
        }
        flatMap(transform) {
            return this.match(transform, Result.failure);
        }
        // This signature is not currently possible in typescript: https://github.com/Microsoft/TypeScript/issues/14520
        // getOrElse<R super T>(alternative: (error: E) => R): R
        // use this one instead
        getOrElse(alternative) {
            return this.match(it => it, alternative);
        }
        getOrThrow() {
            return this.getOrElse(e => { throw e; });
        }
        getOrUndefined() {
            return this.getOrElse(_ => undefined);
        }
        exceptionOrUndefined() {
            return this.match(_ => undefined, e => e);
        }
    };

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
