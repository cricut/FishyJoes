import "dart:io" as io;
import "dart:convert" as convert;
import 'package:path/path.dart' as path;

B? optionalMap<A, B>(A? x, B Function (A) f) => x == null ? null : f(x);
B? optionalFlatMap<A, B>(A? x, B? Function (A) f) => x == null ? null : f(x);

class Download {
  String name;
  String version;
  String url;

  Download(this.name, this.version, this.url);

  @override
  String toString() {
    return "Download(name = '$name', version = '$version', url = '$url')";
  }
}

void main() async {
  final result = await io.Process.run('dart', ['pub', 'deps', '--json']);
  io.stderr.write(result.stderr);
  if (result.exitCode != 0) {
    io.exit(result.exitCode);
  }
  final deps = convert.json.decode(result.stdout)['packages'];
  List<Download> downloads = [];
  for (final dep in deps) {
    String name = dep['name'];
    String version = dep['version'];
    String source = dep['source'];
    List<String> directDeps = [...dep['dependencies']];

    // Download binaries for any remote package that is fishyjoes_dart or depends directly on it
    bool needsDownload =
        // source == 'git' &&
        (name == 'fishyjoes_dart' || directDeps.contains('fishyjoes_dart'));
    if (needsDownload) {
      downloads.add(Download(name, version, "https://api.github.com/cricut/$name/releases/tags/$version"));
    }
  }

  for (final download in downloads) {
    print(download);
  }

  Credentials? githubCreds =
    Credentials.readEnv() ??
    CredentialStore.defaultStore.credentialsFor('github.com') ??
    CredentialStore.defaultStore.credentialsFor('api.github.com');

  if (githubCreds == null) {
    io.stderr.writeln("");
    io.stderr.writeln("Failed to find github credentials.");
    io.stderr.writeln("  Either set credentials for 'github.com' in ~/.netrc");
    io.stderr.writeln("  or set environment variables GITHUB_USER and GITHUB_TOKEN");
    io.stderr.writeln("");
    io.exit(1);
  }
  print("using $githubCreds");

  final releaseURL = "https://api.github.com/repos/cricut/CTextFreestack/releases/tags/3.0.1";
  final release = await callGithubAPI(Uri.parse(releaseURL), githubCreds);
  final neededAssetName = "CTextFreestack-binaries.txz";

  final asset = release['assets'].firstWhere((asset) => asset['name'] == neededAssetName);
  if (asset == null) {
    io.stderr.writeln("Couldn't find asset named '$neededAssetName' in release $releaseURL");
    io.exit(1);
  }

  print(asset['url']);
  // await downloadGithubBinary('foo.txz', Uri.parse(asset['url']), githubCreds);

  // Not sure why this is needed, but things hang otherwise
  io.exit(0);
}

Future<dynamic> callGithubAPI(Uri url, Credentials creds) async {
  final request = await io.HttpClient().getUrl(url);
  request.headers.add('Accept', 'application/vnd.github.v3+json');
  request.headers.add('Authorization', creds.basicAuth());
  final response = await request.close();
  if (response.statusCode != 200) {
    io.stderr.writeln("GET $url failed(?) with status code ${response.statusCode}");
    io.exit(1);
  }
  final stringBody = await response.transform(convert.utf8.decoder).join();
  return convert.json.decode(stringBody);
}

Future<void> downloadGithubBinary(String destination, Uri url, Credentials creds) async {
  final request = await io.HttpClient().getUrl(url);
  request.headers.add('Accept', 'application/octet-stream');
  request.headers.add('Authorization', creds.basicAuth());
  final response = await request.close();
  if (response.statusCode != 200) {
    io.stderr.writeln("GET $url failed(?) with status code ${response.statusCode}");
    io.exit(1);
  }
  response.pipe(io.File(destination).openWrite());
}

// Utilities
class Credentials {
  String username;
  String password;

  Credentials(this.username, this.password);

  static Credentials? readEnv() {
    var username = io.Platform.environment['GITHUB_USER'];
    var password = io.Platform.environment['GITHUB_TOKEN'];
    if (username == null || password == null) { return null; }
    return Credentials(username, password);
  }

  @override
  String toString() {
    return "Credentials(username = '$username', password = '${'*' * password.runes.length}')";
  }

  String basicAuth() {
    return 'Basic ' + convert.base64.encode(convert.utf8.encode('$username:$password'));
  }
}

// netrc parsing code adapted from
// https://github.com/python/cpython/blob/3.11/Lib/netrc.py

class _NetRCLexer {
  static const whitespace = '\n\t\r ';
  String filename;
  var lineNumber = 1;
  var index = 0;
  final String contents;

  _NetRCLexer(this.filename, this.contents);

  List<String> pushback = [];
  String readChar() {
    if (index < contents.length) {
      final chr = contents[index];
      index++;
      if (chr == '\n') { lineNumber++; }
      return chr;
    } else {
      return '';
    }
  }

  String getToken() {
    if (pushback.length > 0) {
      return pushback.removeLast();
    }
    var token = '';
    String ch;
    while ((ch = readChar()) != '') {
      if (whitespace.contains(ch)) {
        continue;
      }
      if (ch == '"') {
        while ((ch = readChar()) != '') {
          if (ch == '"') {
            return token;
          } else if (ch == '\\') {
            ch = readChar();
          }
          token += ch;
        }
      } else {
        if (ch == '\\') {
          ch = readChar();
        }
        token += ch;
        while ((ch = readChar()) != '') {
          if (whitespace.contains(ch)) {
            return token;
          } else if (ch == '\\') {
            ch = readChar();
          }
          token += ch;
        }
      }
    }
    return token;
  }

  String readLine() {
    var line = '';
    String ch;
    while ((ch = readChar()) != '') {
      line += ch;
      if (ch == '\n') {
        return line;
      }
    }
    return line;
  }

  void pushToken(String token) {
    pushback.add(token);
  }

  NetrcParseError error(String message) {
    return NetrcParseError(message, filename, lineNumber);
  }
}

class NetrcParseError {
  String message;
  String filename;
  int lineNumber;

  NetrcParseError(this.message, this.filename, this.lineNumber);

  @override
  String toString() {
    return "$message ($filename, line $lineNumber)";
  }
}

class CredentialStore {
  Map<String, Credentials> hosts = {};
  Map<String, List<String>> macros = {};

  static late final defaultStore = tryReadNetRC() ?? CredentialStore();

  CredentialStore();

  static CredentialStore? tryReadNetRC({ String? file = null }) {
    try { return CredentialStore.readNetRC(file: file); } catch(_) {}
  }

  CredentialStore.readNetRC({ String? file = null }) {
    if (file == null) {
      String? home;
      // https://stackoverflow.com/a/22320366/73681
      if(io.Platform.isWindows) {
        home = optionalMap(io.Platform.environment['USERPROFILE'], path.absolute);
      } else {
        home = optionalMap(io.Platform.environment['HOME'], path.absolute);
      }
      if (home == null) {
        throw Exception("Couldn't locate home directory on this platform");
      }
      file = path.join(home, '.netrc');
    }
    // TODO: non-utf8 encodings?
    final lexer = _NetRCLexer(file, io.File(file).readAsStringSync());
    while (true) {
      // Look for a machine, default, or macdef top-level keyword
      final savedLineNumber = lexer.lineNumber;
      var topLevel = lexer.getToken();
      String entryname;
      var tt = topLevel;
      if (tt == '') {
        break;
      } else if (tt[0] == "#") {
        if (lexer.lineNumber == savedLineNumber && tt.length == 1) {
          lexer.readLine();
        }
        continue;
      } else if (tt == 'machine') {
        entryname = lexer.getToken();
      } else if (tt == 'default') {
        entryname = 'default';
      } else if (tt == 'macdef') {
        entryname = lexer.getToken();
        macros[entryname] = [];
        while (true) {
          final line = lexer.readLine();
          if (line == '') {
            throw lexer.error("Macro definition missing null line terminator.");
          }
          if (line == '\n') {
            // a macro definition finished with consecutive new-line
            // characters. The first \n is encountered by the
            // readline() method and this is the second \n.
            break;
          }
          macros[entryname]!.add(line);
        }
        continue;
      } else {
        throw lexer.error("bad toplevel token '$tt'");
      }

      if (entryname == '') {
        throw lexer.error("missing '$tt' name");
      }

      // We're looking at start of an entry for a named machine or default.
      var login = '';
      var account = '';
      var password = '';

      while (true) {
        final prev_lineno = lexer.lineNumber;
        var tt = lexer.getToken();
        if (tt.startsWith('#')) {
          if (lexer.lineNumber == prev_lineno) {
            lexer.readLine();
          }
          continue;
        }
        if (['', 'machine', 'default', 'macdef'].contains(tt)) {
          // Ignore account because I don't need it
          hosts[entryname] = Credentials(login, password);
          lexer.pushToken(tt);
          break;
        } else if (tt == 'login' || tt == 'user') {
          login = lexer.getToken();
        } else if (tt == 'account') {
          account = lexer.getToken();
        } else if (tt == 'password') {
          password = lexer.getToken();
        } else {
          throw lexer.error("bad follower token '$tt'");
        }
      }
    }
  }

  Credentials? credentialsFor(String host) {
    return hosts[host] ?? hosts['default'];
  }
}
