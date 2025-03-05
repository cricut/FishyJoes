import 'package:cricut_testapi/testapi.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {
      final _ = ensureLoaded;
  });

  group('URLTests', () {
      test('testURLValues', () {
          expect(Uri.parse("https://www.google.com"), equals(URLs.simple));
          expect(Uri.parse("https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"), equals(URLs.remoteFile));
          expect(Uri.parse("file:///Users/someuser/Desktop/a.png"), equals(URLs.localFile));
      });

      test('testURLEcho', () {
          expect(URLs.simple, equals(URLs.echo(URLs.simple)));
          expect(URLs.remoteFile, equals(URLs.echo(URLs.remoteFile)));
          expect(URLs.localFile, equals(URLs.echo(URLs.localFile)));
      });
  });
}
