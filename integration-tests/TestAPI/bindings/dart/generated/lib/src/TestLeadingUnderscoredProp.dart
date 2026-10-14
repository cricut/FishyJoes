import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

/// <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
abstract class TestLeadingUnderscoredProp {

    /// <!-- FishyJoes.export(_leadingUnderscoreProp) -->
    String get m_leadingUnderscoreProp;
}

extension TestLeadingUnderscoredProp_DefaultImplementations on TestLeadingUnderscoredProp {
}

extension TestLeadingUnderscoredProp_FfiHooks on TestLeadingUnderscoredProp {
    static CreatedRef ffi_get__leadingUnderscoreProp(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<TestLeadingUnderscoredProp>(obj).m_leadingUnderscoreProp
        )
    );
}
