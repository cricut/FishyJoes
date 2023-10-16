import 'package:cricut_test_api/cricut_test_api.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart' as tuple;

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('TupleTests', () {
      final tuple2 = tuple.Tuple2(1, "two");
      final tuple3 = tuple.Tuple3("one", 2.1, "three");
      final tuple4 = tuple.Tuple4(tuple2, tuple3, "IV", true);
      final tuple5 = tuple.Tuple5("I", 2, tuple4, tuple3, tuple2);
      final tuple6 = tuple.Tuple6("one", 2, 3.14, tuple4, tuple5, false);

      test('testSwiftTuplesToKotlin', () {
        expect(Tuples.tuple2, equals(tuple2));
        expect(Tuples.tuple3, equals(tuple3));
        expect(Tuples.tuple4, equals(tuple4));
        expect(Tuples.tuple5, equals(tuple5));
        expect(Tuples.tuple6, equals(tuple6));
      });

      test('testKotlinTuplesToSwift', () {
        expect(Tuples.checkTuples(tuple2, tuple3, tuple4, tuple5, tuple6), isTrue);
      });
  });
}
