import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'dart:io';

void main() {
  setUp(() {
      print('pid: $pid');
      final _ = ensureLoaded;
  });

  group('StructTests', () {
      test('testConstruction', () {
        expect(Structs_EmptyStruct().aap(), equals("The Netherlands"));
      });

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

      test('MutatingFunctions', () async {
          final struct = Structs_MutableStruct.create();
          expect(struct.i, equals(0));
          struct.increment();
          expect(struct.i, equals(1));
          await struct.incrementAsync();
          expect(struct.i, equals(2));
      });

      test('AsyncMemberFunctions', () async {
          final memberwise = Structs_MemberwiseStruct.create();
          expect(await memberwise.asyncGetMutable(), equals("Fickle"));
          final reference = Structs_ReferenceStruct.create();
          expect(await reference.asyncGetMutable(), equals("Fickle"));
          final mutable = Structs_MutableStruct.create();
          expect(await mutable.asyncGetI(), equals(0));
      });
  });
}
