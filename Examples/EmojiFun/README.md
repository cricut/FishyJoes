# EmojiFun Example for FishyJoes

This package defines the `EmojiExplorer` type and shows how to export it and its members to foreign languages using FishyJoes.

It has already had `fishy-joes package-init` and `fishy-joes generate` run and includes a test suite for the Swift version of the type, as well as a translated version of the test suite for each supported foreign language.

Test each suite by executing:

* `swift test`
* `swift run fishy-joes build test --wasm`
* `swift run fishy-joes build test --kotlin-fast`
* `swift run fishy-joes build test --c-sharp`
* `swift run fishy-joes build test --dart`
* `swift run fishy-joes build test --python`

Generation can be tested by adding a member to the `EmojiExplorer` type in `Sources/EmojiFun/EmojiExplorer.swift` like:

```
public struct EmojiExplorer {
    /// <!-- FishyJoes.export(people) -->
    public static let people = "😀🤓🥸🥳🤯"
    /* ... */
}
```

then executing:

`swift run fishy-joes generate`
