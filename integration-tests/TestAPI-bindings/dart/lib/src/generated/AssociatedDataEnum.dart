import './AssociatedDataEnum.dart' as TestAPI;
import './AssociatedDataEnum.dart';
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './AttributedString_PuttingTypesIntoQuestionablePlaces.dart';
import './AttributedStrings.dart' as TestAPI;
import './AttributedStrings.dart';
import './Bytes.dart' as TestAPI;
import './Bytes.dart';
import './ClosedRanges.dart' as TestAPI;
import './ClosedRanges.dart';
import './Collections.dart' as TestAPI;
import './Collections.dart';
import './Collections_CollectionHolder.dart' as TestAPI;
import './Collections_CollectionHolder.dart';
import './DefaultArguments.dart' as TestAPI;
import './DefaultArguments.dart';
import './Deprecations.dart' as TestAPI;
import './Deprecations.dart';
import './Functions.dart' as TestAPI;
import './Functions.dart';
import './Functions_TheError.dart' as TestAPI;
import './Functions_TheError.dart';
import './Methods.dart' as TestAPI;
import './Methods.dart';
import './Primitives.dart' as TestAPI;
import './Primitives.dart';
import './Primitives_PrimitiveHolder.dart' as TestAPI;
import './Primitives_PrimitiveHolder.dart';
import './Ranges.dart' as TestAPI;
import './Ranges.dart';
import './SimpleEnum.dart' as TestAPI;
import './SimpleEnum.dart';
import './String_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './String_PuttingTypesIntoQuestionablePlaces.dart';
import './Strings.dart' as TestAPI;
import './Strings.dart';
import './Structs.dart' as TestAPI;
import './Structs.dart';
import './Structs_MemberwiseStruct.dart' as TestAPI;
import './Structs_MemberwiseStruct.dart';
import './Structs_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './Structs_PuttingTypesIntoQuestionablePlaces.dart';
import './Structs_ReferenceStruct.dart' as TestAPI;
import './Structs_ReferenceStruct.dart';
import './Tuples.dart' as TestAPI;
import './Tuples.dart';
import './URLs.dart' as TestAPI;
import './URLs.dart';
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart' as TestAPI;
import './UnicodeScalar_PuttingTypesIntoQuestionablePlaces.dart';
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tuple/tuple.dart' as tuple;

// part 'AssociatedDataEnum.freezed.dart';

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
// @freezed
// class AssociatedDataEnum with _$AssociatedDataEnum {
// enum AssociatedDataEnum {
//     thing(thingValue: 42);

//     const AssociatedDataEnum({
//       required this.thingValue
//     });

//     final int thingValue;
//     // factory AssociatedDataEnum.thing(
//     //     int value
//     // ) = AssociatedDataEnum_Thing;

//     // AssociatedDataEnum._() {}

//     static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
//         // peekRef<AssociatedDataEnum>(obj).map(
//         //     thing: (_) => 0,
//         // )
//         peekRef<AssociatedDataEnum>(obj).index
//     );

//     static CreatedRef newThing(
//         int _value,
//         OutCreatedRef exn
//     ) => catchingRef(exn, () =>
//         // createRef(AssociatedDataEnum_Thing(
//         //     _value,
//         // ))
//         createRef(AssociatedDataEnum.thing)
//     );

//     static void extractThing(
//         UnownedRef obj,
//         ffi.Pointer<ffi.Int> _value,
//         OutCreatedRef exn
//     ) {
//         catching(exn, () {
//             // final _self = peekRef<AssociatedDataEnum_Thing>(obj);
//             final _self = peekRef<AssociatedDataEnum>(obj);
//             _value.value = _self.thingValue;
//         });
//     }
// }
enum AssociatedDataEnumCase {
  thing
}

class AssociatedDataEnum {
    factory AssociatedDataEnum.thing({required dynamic thingValue}) => AssociatedDataEnum(enumCase: AssociatedDataEnumCase.thing, thingValue: thingValue);

    const AssociatedDataEnum({
      required this.enumCase,
      required this.thingValue      
    });

    final int thingValue;
    final AssociatedDataEnumCase enumCase;
    // factory AssociatedDataEnum.thing(
    //     int value
    // ) = AssociatedDataEnum_Thing;

    // AssociatedDataEnum._() {}

    static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
        // peekRef<AssociatedDataEnum>(obj).map(
        //     thing: (_) => 0,
        // )
        peekRef<AssociatedDataEnum>(obj).enumCase.index
    );

    static CreatedRef newThing(
        int _value,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        // createRef(AssociatedDataEnum_Thing(
        //     _value,
        // ))
        createRef(AssociatedDataEnum.thing(thingValue: _value))
    );

    static void extractThing(
        UnownedRef obj,
        ffi.Pointer<ffi.Int> _value,
        OutCreatedRef exn
    ) {
        catching(exn, () {
            // final _self = peekRef<AssociatedDataEnum_Thing>(obj);
            final _self = peekRef<AssociatedDataEnum>(obj);
            _value.value = _self.thingValue;
        });
    }
}
