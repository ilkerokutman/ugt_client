import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:ugt_client/models/credentials.dart';

import '../models/credentials.dart';
import '../models/auth.dart';
import '../settings/keys.dart' as keys;

class Box {
  static Future<void> writeCredentials(Credentials credentials) async {
    final box = GetStorage();
    String _credentials = json.encode(credentials.toMap());
    await box.write(keys.credentials, _credentials);
  }

  static Credentials? readCredentials() {
    final box = GetStorage();
    String? _credentials = box.read(keys.credentials);
    if (_credentials == null) return null;
    return Credentials.fromMap(json.decode(_credentials));
  }

  static Future<void> writeAuth(Auth auth) async {
    final box = GetStorage();
    String _auth = json.encode(auth.toMap());
    await box.write(keys.auth, _auth);
  }

  static Auth? readAuth() {
    final box = GetStorage();
    String _auth = box.read(keys.auth);
    if (_auth == null) return null;
    return Auth.fromMap(json.decode(_auth));
  }

  static Future<void> writeToken(String token) async {
    final box = GetStorage();
    await box.write(keys.token, token);
  }

  static String readToken() {
    final box = GetStorage();
    return box.read(keys.token);
  }
}
