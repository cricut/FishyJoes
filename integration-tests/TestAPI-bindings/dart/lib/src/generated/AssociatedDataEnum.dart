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
// enum AssociatedDataEnumCase {
//   thing
// }

// class AssociatedDataEnum {
//     factory AssociatedDataEnum.thing(dynamic thingValue) => AssociatedDataEnum(AssociatedDataEnumCase.thing, thingValue);

//     const AssociatedDataEnum(
//       this.enumCase,
//       this.thingValue      
//     );

//     final int thingValue;
//     final AssociatedDataEnumCase enumCase;
//     // factory AssociatedDataEnum.thing(
//     //     int value
//     // ) = AssociatedDataEnum_Thing;

//     // AssociatedDataEnum._() {}

//     static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) =>
//         // peekRef<AssociatedDataEnum>(obj).map(
//         //     thing: (_) => 0,
//         // )
//         peekRef<AssociatedDataEnum>(obj).enumCase.index
//     );

//     static CreatedRef newThing(
//         int _value,
//         OutCreatedRef exn
//     ) => catchingRef(exn, () =>
//         // createRef(AssociatedDataEnum_Thing(
//         //     _value,
//         // ))
//         createRef(AssociatedDataEnum.thing(_value))
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

sealed class AssociatedDataEnum {
  const factory AssociatedDataEnum.thing(int value) = AssociatedDataEnum_Thing.thing;
  const factory AssociatedDataEnum.noValue() = AssociatedDataEnum_NoValue;

  const AssociatedDataEnum();

  // TResult map<TResult extends Object?>({
  //   required TResult Function(AssociatedDataEnum_Thing value) thing,
  //   required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  // }) =>
  //     throw UnsupportedError('use a factory contstructor for AssociatedDataEnum.');

  static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {
    print("obj.runtimeType: ${obj.runtimeType}");
    // if (obj is AssociatedDataEnum_Thing) {
    //   return 0;
    // } else if (obj is AssociatedDataEnum_NoValue) {
    //   return 1;
    // } else {
    //   return 0;
    // }
      final peekedObj = peekRef<AssociatedDataEnum>(obj);
      if (peekedObj is AssociatedDataEnum_Thing) {
        return 0;
      } else if (peekedObj is AssociatedDataEnum_NoValue) {
        return 1;
      } else {
        return 0;
      }
  });

  static CreatedRef newThing(
    int _value,
    OutCreatedRef exn
  ) => catchingRef(exn, () =>      
    createRef(AssociatedDataEnum.thing(_value))
  );

  static void extractThing(
      UnownedRef obj,
      ffi.Pointer<ffi.Int> _value,
      OutCreatedRef exn
  ) {
      catching(exn, () {
          final _self = peekRef<AssociatedDataEnum_Thing>(obj);
          _value.value = _self.value;
      });
  }

  static CreatedRef newNoValue(
      OutCreatedRef exn
  ) => catchingRef(exn, () =>
      createRef(AssociatedDataEnum_NoValue(
      ))
  );

  static void extractNoValue(
      UnownedRef obj,
      OutCreatedRef exn
  ) {
      catching(exn, () {
          final _self = peekRef<AssociatedDataEnum_NoValue>(obj);
      });
  }


  /// <!-- FishyJoes.export(staticThing) -->
  static TestAPI.AssociatedDataEnum get staticThing =>
      check((exn) =>
          consumeCreatedRef<TestAPI.AssociatedDataEnum>(f__iota_get_TestAPI_AssociatedDataEnum_staticThing(Loader.shared.env, exn))
      )
  ;

  /// <!-- FishyJoes.export(intValue) -->
  int get intValue =>
      GCRef.using(this, (_thisHandle) =>
          check((exn) =>
              f__iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.shared.env, _thisHandle.ptr, exn)
          )
      )
  ;

  /// <!-- FishyJoes.export(plus) -->
  TestAPI.AssociatedDataEnum plus(
      TestAPI.AssociatedDataEnum other,
  ) =>
      GCRef.using(this, (_thisHandle) =>
          GCRef.using(other, (_otherHandle) =>
              consumeCreatedRef<TestAPI.AssociatedDataEnum>(check((OutCreatedRef _exn) => f__iota_TestAPI_AssociatedDataEnum_plus(Loader.shared.env, _thisHandle.ptr, _otherHandle.ptr, _exn)))
          )
      )
  ;

  static late CreatedRef Function(
      Env env,
      OutCreatedRef _exn
  ) f__iota_get_TestAPI_AssociatedDataEnum_staticThing;

  static late int Function(
      Env env,
      UnownedRef _this,
      OutCreatedRef _exn
  ) f__iota_get_TestAPI_AssociatedDataEnum_intValue;

  static late CreatedRef Function(
      Env env,
      UnownedRef _this,
      UnownedRef other,
      OutCreatedRef _exn
  ) f__iota_TestAPI_AssociatedDataEnum_plus;

}

class AssociatedDataEnum_Thing extends AssociatedDataEnum {
  const factory AssociatedDataEnum_Thing.thing(int value) = AssociatedDataEnum_Thing;

  const AssociatedDataEnum_Thing(this.value);

  final int value;

  // @override
  // TResult map<TResult extends Object?>({
  //   required TResult Function(AssociatedDataEnum_Thing value) thing,
  //   required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  // }) {
  //   return thing(this);
  // }
}

class AssociatedDataEnum_NoValue extends AssociatedDataEnum {
  const AssociatedDataEnum_NoValue();

  // @override
  // TResult map<TResult extends Object?>({
  //   required TResult Function(AssociatedDataEnum_Thing value) thing,
  //   required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  // }) {
  //   return noValue(this);
  // }
}
