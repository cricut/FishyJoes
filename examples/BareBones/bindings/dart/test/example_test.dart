import 'package:cricut_barebones/barebones.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
    final _ = ensureLoaded;
  });

  group('BareBonesTests', () {
    test('Skeleton Bone Count', () {
      expect(Skeleton.boneCount, equals(206));
    });
  });
}
