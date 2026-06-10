import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read({required String key}) async {
    return _storage.read(key: key);
  }

  static Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  static Future<bool> containsKey({required String key}) async {
    return await _storage.containsKey(key: key);
  }
  static Future<Map<String,String>> readAll() async {
    return _storage.readAll();
  }
  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

}
