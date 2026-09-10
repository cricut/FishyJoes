import './_exports.dart' as TestAPI;
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

/// <!-- FishyJoes.export(Tree) -->
class Tree {
    final int value;
    final List<TestAPI.Tree> children;

    Tree({
        required int value,
        required List<TestAPI.Tree> children
    }):
        this.value = value,
        this.children = children;

    static CreatedRef ffi_constructor(
        int value,
        ConsumedRef children,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Tree(
            value: value,
            children: consumeRef(children),
        ))
    );
    @override
    String toString() => 'TestAPI.Tree(value: $value, children: $children)';

    static int ffi_get_value(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catching(exn, () =>
        peekRef<Tree>(obj).value
    ) ?? 0;

    static CreatedRef ffi_get_children(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Tree>(obj).children
        )
    );

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Tree &&
            (
                const DeepCollectionEquality().equals(other.value, value) &&
                const DeepCollectionEquality().equals(other.children, children)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(value),
        const DeepCollectionEquality().hash(children)
    );

    Tree copyWith({
        int? value,
        List<TestAPI.Tree>? children
    }) => Tree(
        value: value ?? this.value,
        children: children ?? this.children
    );
}
