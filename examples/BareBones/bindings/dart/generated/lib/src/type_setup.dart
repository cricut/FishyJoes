import './_exports.dart' as BareBones;
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

    final dylib = Loader.openLibrary('BareBones-iota');
    final arena = ffi.Arena();

    dylib.lookupFunction<ffi.Void Function(), void Function()>('FishyJoes_BareBones_registerTypes')();

    final BareBones_Skeleton_setup = dylib.lookupFunction<
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
    >('BareBones_Skeleton_setup');
    BareBones.Skeleton.f__iota_get_BareBones_Skeleton_boneCount = dylib.lookupFunction<
        ffi.IntPtr Function(
            Env env,
            OutCreatedRef _exn
        ),
        int Function(
            Env env,
            OutCreatedRef _exn
        )
    >("__iota_get_BareBones_Skeleton_boneCount");

    Loader.shared.once("setup_BareBones.Skeleton", () {
        // print("setting up BareBones.Skeleton (env=0x${Loader.shared.env.address.toRadixString(16)})...");
        utils.check<void>((exn) {
            BareBones_Skeleton_setup(
                Loader.shared.env,
                ffi.Pointer.fromFunction(BareBones.Skeleton.ffi_new),
                exn
            );
        });
    });

    arena.releaseAll();
})();
