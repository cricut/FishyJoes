import './_exports.dart' as EmojiFun;
import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:path/path.dart' as path;
import 'package:tuple/tuple.dart' as tuple;

final ensureLoaded = (() {
    FishyJoesRuntime.Loader.shared.ensureLoaded;

    final dylib = Loader.openLibrary('EmojiFun-iota');
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_EmojiFun_registerTypes')();

    final EmojiFun_EmojiExplorer_setup = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        ),
        void Function(
            Env env,
            ffi.Pointer<ffi.NativeFunction<CreatedRef Function(ffi.Pointer, OutCreatedRef)>> constructorMethod,
            OutCreatedRef exn
        )
    >('EmojiFun_EmojiExplorer_setup');
    EmojiFun.EmojiExplorer.f__iota_EmojiFun_EmojiExplorer_create = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            ffi.IntPtr count,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            int count,
            OutCreatedRef _exn
        )
    >("__iota_EmojiFun_EmojiExplorer_create");
    EmojiFun.EmojiExplorer.f__iota_EmojiFun_EmojiExplorer_enumerateKnown = dylib.lookupFunction<
        ffi.Void Function(
            Env env,
            UnownedRef _this,
            UnownedRef body,
            OutCreatedRef _exn
        ),
        void Function(
            Env env,
            UnownedRef _this,
            UnownedRef body,
            OutCreatedRef _exn
        )
    >("__iota_EmojiFun_EmojiExplorer_enumerateKnown");
    EmojiFun.EmojiExplorer.f__iota_EmojiFun_EmojiExplorer_random = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_EmojiFun_EmojiExplorer_random");
    EmojiFun.EmojiExplorer.f__iota_EmojiFun_EmojiExplorer_randomUnique = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_EmojiFun_EmojiExplorer_randomUnique");
    EmojiFun.EmojiExplorer.f__iota_get_EmojiFun_EmojiExplorer_hello = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_EmojiFun_EmojiExplorer_hello");
    EmojiFun.EmojiExplorer.f__iota_get_EmojiFun_EmojiExplorer_known = dylib.lookupFunction<
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        ),
        CreatedRef Function(
            Env env,
            UnownedRef _this,
            OutCreatedRef _exn
        )
    >("__iota_get_EmojiFun_EmojiExplorer_known");

    Loader.shared.once("setup_Function1Converter<Swift.String, Swift.Bool>", () {
        // print("setting up (Swift.String) throws -> Swift.Bool (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup<bool, String>(
                Loader.shared.env,
                "Function1Converter<Swift.String, Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_Function1Converter<Swift.String, Swift.Bool>", () {
        // print("setting up (String) throws -> Bool (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_Function1Converter_setup<bool, String>(
                Loader.shared.env,
                "Function1Converter<Swift.String, Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_FutureConverter<Swift.Bool>", () {
        // print("setting up Future<Swift.Bool> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_FutureConverter_setup<bool>(
                Loader.shared.env,
                "FutureConverter<Swift.Bool>",
                exn
            );
        });
    });

    Loader.shared.once("setup_OptionalConverter<Swift.String>", () {
        // print("setting up Optional<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_OptionalConverter_setup(
                Loader.shared.env,
                exn
            );
        });
    });

    Loader.shared.once("setup_SetConverter<Swift.String>", () {
        // print("setting up Set<String> (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            Loader.shared.FishyJoesCommonRuntime_SetConverter_setup<String>(
                Loader.shared.env,
                "SetConverter<Swift.String>",
                exn
            );
        });
    });

    Loader.shared.once("setup_EmojiFun.EmojiExplorer", () {
        // print("setting up EmojiFun.EmojiExplorer (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            EmojiFun_EmojiExplorer_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(EmojiFun.EmojiExplorer.ffi_new),
                exn
            );
        });
    });

    arena.releaseAll();
})();
