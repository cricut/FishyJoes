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

/// <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct) -->
class TestLeadingUnderscoredPropStruct implements TestAPI.TestLeadingUnderscoredProp {
    String m_leadingUnderscoreProp;

    TestLeadingUnderscoredPropStruct({
        required String m_leadingUnderscoreProp
    }):
        this.m_leadingUnderscoreProp = m_leadingUnderscoreProp;

    static CreatedRef ffi_constructor(
        ConsumedRef m_leadingUnderscoreProp,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(TestLeadingUnderscoredPropStruct(
            m_leadingUnderscoreProp: consumeRef(m_leadingUnderscoreProp),
        ))
    );
    @override
    String toString() => 'TestAPI.TestLeadingUnderscoredPropStruct(m_leadingUnderscoreProp: $m_leadingUnderscoreProp)';

    static CreatedRef ffi_get__leadingUnderscoreProp(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestLeadingUnderscoredPropStruct>(obj).m_leadingUnderscoreProp
        )
    );
    static void ffi_set__leadingUnderscoreProp(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<TestLeadingUnderscoredPropStruct>(obj).m_leadingUnderscoreProp = consumeRef<String>(newValue);
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is TestLeadingUnderscoredPropStruct &&
            (
                const DeepCollectionEquality().equals(other.m_leadingUnderscoreProp, m_leadingUnderscoreProp)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        const DeepCollectionEquality().hash(m_leadingUnderscoreProp)
    );

    TestLeadingUnderscoredPropStruct copyWith({
        String? m_leadingUnderscoreProp
    }) => TestLeadingUnderscoredPropStruct(
        m_leadingUnderscoreProp: m_leadingUnderscoreProp ?? this.m_leadingUnderscoreProp
    );
}
