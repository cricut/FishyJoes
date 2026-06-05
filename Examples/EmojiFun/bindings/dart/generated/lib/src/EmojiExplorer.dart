import './_exports.dart' as EmojiFun;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// A playground object for working with emoji.
/// <!-- FishyJoes.exportReference(EmojiExplorer) -->
class EmojiExplorer extends SwiftReference {
    EmojiExplorer(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(EmojiExplorer(ref))
    );

    /// Emits a hello string.
    /// - Returns: A string containing an emoji hello message.
    /// <!-- FishyJoes.export(hello) -->
    static String get hello =>
        check((exn) =>
            consumeCreatedRef<String>(f__iota_get_EmojiFun_EmojiExplorer_hello(Loader.shared.env, exn))
        )
    ;
    /// A collection of emoji strings known to the object.
    ///
    /// This value could contain millions of strings and be very large, incuring a performance cost to communicate to foreign callers, so `enumerateKnown(_:)` is also provided.
    /// <!-- FishyJoes.export(known) -->
    Set<String> get known =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<Set<String>>(f__iota_get_EmojiFun_EmojiExplorer_known(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    /// Creates an object that works with emoji strings.
    /// - Parameter count: The number of emoji strings to include in the object's known collection.
    /// <!-- FishyJoes.export(create) -->
    static EmojiFun.EmojiExplorer create(
        int count,
    ) =>
        consumeCreatedRef<EmojiFun.EmojiExplorer>(check((OutCreatedRef _exn) => f__iota_EmojiFun_EmojiExplorer_create(Loader.shared.env, count, _exn)))
    ;

    /// Reports a random emoji string built using the object's collection of known emoji strings.
    /// - Returns: A string containing one or more random emoji. In the unusual case that the object knows zero emoji strings, the `hello` string is returned.
    /// <!-- FishyJoes.export(random) -->
    String random(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String>(check((OutCreatedRef _exn) => f__iota_EmojiFun_EmojiExplorer_random(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// Reports a random emoji string from the object's collection of known emoji strings, ensuring it is only reported once.
    /// - Returns: A random emoji string, or `nil` if all values known to the object have been reported.
    /// <!-- FishyJoes.export(randomUnique) -->
    String? randomUnique(
    ) =>
        GCRef.using(this, (_thisHandle) =>
            consumeCreatedRef<String?>(check((OutCreatedRef _exn) => f__iota_EmojiFun_EmojiExplorer_randomUnique(Loader.shared.env, _thisHandle.ptr, _exn)))
        )
    ;

    /// Enumerates the emoji strings known to the object.
    /// - Parameter body: A closure to call with each string. On each call to the closure, a string is provided, and the closure should return `true` to continue enumeration or `false` to halt.
    /// <!-- FishyJoes.export(enumerateKnown) -->
    void enumerateKnown(
        bool Function(String) body,
    ) =>
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(body, (_bodyHandle) =>
                check((OutCreatedRef _exn) => f__iota_EmojiFun_EmojiExplorer_enumerateKnown(Loader.shared.env, _thisHandle.ptr, _bodyHandle.ptr, _exn))
            )
        )
    ;

    static late CreatedRef Function(
        Env env,
        int count,
        OutCreatedRef _exn
    ) f__iota_EmojiFun_EmojiExplorer_create;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef body,
        OutCreatedRef _exn
    ) f__iota_EmojiFun_EmojiExplorer_enumerateKnown;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_EmojiFun_EmojiExplorer_random;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_EmojiFun_EmojiExplorer_randomUnique;
    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_get_EmojiFun_EmojiExplorer_hello;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_EmojiFun_EmojiExplorer_known;
}
