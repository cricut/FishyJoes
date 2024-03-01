import "dart:io" as io;
import "dart:convert" as convert;
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart' as yaml;

class Download {
  String repoName;
  String version;
  String assetName;

  Download(this.repoName, this.version, this.assetName);

  @override
  String toString() {
    return "Download(repoName = '$repoName', version = '$version', assetName = '$assetName')";
  }
}

void main() async {
  final pubDepsResult = await io.Process.run('dart', ['pub', 'deps', '--json']);
  io.stderr.write(pubDepsResult.stderr);
  if (pubDepsResult.exitCode != 0) {
    io.stderr.writeln("Failed to get dart dependencies (dart pub deps)");
    io.exit(pubDepsResult.exitCode);
  }
  final deps = convert.json.decode(pubDepsResult.stdout)['packages'];

  dynamic pubspecLock;
  try {
     pubspecLock = yaml.loadYaml(io.File('pubspec.lock').readAsStringSync());
  } catch (_) {
    io.stderr.writeln("");
    io.stderr.writeln("Failed to read pubspec.lock in current directory.");
    io.stderr.writeln("Needed to determine versions of binaries to download.");
    io.stderr.writeln("");
    io.exit(1);
  }

  List<Download> downloads = [];
  for (final dep in deps) {
    String name = dep['name'];
    // String version = dep['version'];
    String source = dep['source'];
    List<String> directDeps = [...dep['dependencies']];

    // Download binaries for any remote package that is fishyjoes_dart or depends directly on it
    bool needsDownload =
        source == 'git' &&
        (name == 'fishyjoes_dart' || directDeps.contains('fishyjoes_dart'));
    if (needsDownload) {
      final depLock = pubspecLock["packages"][name];
      if (depLock == null) {
        io.stderr.writeln("No lock information for $name. Skipping binary download");
      } else {
        final url = Uri.parse(depLock["description"]["url"]);
        String ref = depLock["description"]["ref"];
        final pathMatch = RegExp(r'cricut/(.*?)(.git)?$').firstMatch(url.path);
        if (pathMatch == null) {
          io.stderr.writeln("Couldn't determing github repo of $name");
          io.exit(1);
        }
        final repoName = pathMatch[1]!;
        downloads.add(Download(repoName, ref, "$repoName-dart-binaries.tgz"));
      }
    }
  }

  Credentials? githubCreds =
    Credentials.readEnv() ??
    CredentialStore.defaultStore.credentialsFor('github.com') ??
    CredentialStore.defaultStore.credentialsFor('api.github.com');

  if (githubCreds == null) {
    io.stderr.writeln("");
    io.stderr.writeln("Failed to find github credentials.");
    io.stderr.writeln("  Either set credentials for 'api.github.com' in ~/.netrc");
    io.stderr.writeln("  or set environment variables GITHUB_USER and GITHUB_TOKEN");
    io.stderr.writeln("");
    io.exit(1);
  }
  print("using $githubCreds");

  await io.Directory('native/download-cache/').create(recursive: true);
  for (final download in downloads) {
    final archivePath = "native/download-cache/${pathSafe(download.repoName)}-${pathSafe(download.version)}-${download.assetName}";

    if (await io.File(archivePath).exists()) {
      print("using cached binary for '${download.repoName}:${download.version}' at $archivePath");
    } else {
      // Download binaries
      final releaseURL = "https://api.github.com/repos/cricut/${download.repoName}/releases/tags/${download.version}";
      dynamic release;
      try {
        release = await callGithubAPI(Uri.parse(releaseURL), githubCreds);
      } catch (e) {
        io.stderr.writeln("");
        io.stderr.writeln("$e");
        io.stderr.writeln("");
        io.stderr.writeln("Failed to find github release '${download.version}' in");
        io.stderr.writeln("  https://github.com/cricut/${download.repoName}/releases");
        io.stderr.writeln("Check that release exists and used token has permissions to read it");
        io.stderr.writeln("");
        io.exit(1);
      }
      final asset = release['assets'].firstWhere(
        (asset) => asset['name'] == download.assetName,
        orElse: () {
          io.stderr.writeln("Couldn't find asset named '${download.assetName}' in release");
          io.stderr.writeln("  https://github.com/cricut/${download.repoName}/releases/tag/${download.version}");
          io.stderr.writeln("Maybe CI/CD failed to generate the asset");
          io.exit(1);
        }
      );
      print("downloading $releaseURL => $archivePath");
      await downloadGithubBinary(archivePath, Uri.parse(asset['url']), githubCreds);
    }

    // Extract binaries
    final tarResult = await io.Process.run('tar', ['-xvzf', archivePath]);
    io.stdout.write(tarResult.stdout);
    io.stderr.write(tarResult.stderr);
    if (tarResult.exitCode != 0) {
      io.stderr.writeln("Failed to extract archive:");
      io.stderr.writeln("  tar -xvzf $archivePath");
      io.exit(tarResult.exitCode);
    }
  }

  // process hangs for a long time if we don't do this
  io.exit(0);
}

Future<dynamic> callGithubAPI(Uri url, Credentials creds) async {
  final request = await io.HttpClient().getUrl(url);
  request.headers.add('Accept', 'application/vnd.github.v3+json');
  request.headers.add('Authorization', creds.basicAuth());
  final response = await request.close();
  if (response.statusCode != 200) {
    throw Exception("GET $url failed(?) with status code ${response.statusCode}");
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
    throw Exception("GET $url failed(?) with status code ${response.statusCode}");
  }
  final tempFile = io.File("$destination.tmp");
  await response.pipe(tempFile.openWrite());
  await tempFile.rename(destination);
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
    return 'Basic ${convert.base64.encode(convert.utf8.encode('$username:$password'))}';
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
    if (pushback.isNotEmpty) {
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

  static final defaultStore = tryReadNetRC() ?? CredentialStore();

  CredentialStore();

  static CredentialStore? tryReadNetRC({ String? file }) {
    try { return CredentialStore.readNetRC(file: file); } catch(_) { return null; }
  }

  CredentialStore.readNetRC({ String? file }) {
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
      // ignore: unused_local_variable
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

// Utilities

String pathSafe(String input) => input.replaceAll(RegExp(r'[^-A-Za-z0-9_.]'), '-');

B? optionalMap<A, B>(A? x, B Function (A) f) => x == null ? null : f(x);
B? optionalFlatMap<A, B>(A? x, B? Function (A) f) => x == null ? null : f(x);
