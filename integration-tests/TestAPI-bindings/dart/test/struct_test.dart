import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('StructTests', () {
      test('testConstruction', () {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(memberwise.immutable, equals("Eternal"));
          expect(memberwise.mutable, equals("Fickle"));

          final reference = Structs_ReferenceStruct.create();
          expect(reference.immutable, equals("Eternal"));
          expect(reference.mutable, equals("Fickle"));
      });

      test('testMutablility', () {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(memberwise.immutable, equals("Eternal"));
          // TODO: Ensure this is true!
          // memberwise.immutable = "Should generate a compile Error!";
          expect(memberwise.mutable, equals("Fickle"));
          memberwise.mutable = "Fickle as the wind";
          expect(memberwise.mutable, isNot(equals("Fickle")));

          final reference = Structs_ReferenceStruct.create();
          expect(reference.immutable, equals("Eternal"));
          // TODO: Ensure this is true!
          // reference.immutable = "Should generate a compile Error!";
          expect(reference.mutable, equals("Fickle"));
          memberwise.mutable = "Fickle as the wind";
          expect(memberwise.mutable, isNot(equals("Fickle")));
      });

      test('testEquality', () {
          expect(Structs_MemberwiseStruct.create(), equals(Structs_MemberwiseStruct.create()));
          expect(Structs_ReferenceStruct.create(), equals(Structs_ReferenceStruct.create()));
          expect(Structs_MemberwiseStruct.create(), isNot(equals(Structs_ReferenceStruct.create())));
      });
  });
}
