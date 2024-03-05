import 'dart:convert';

import 'package:dependencias_comuns/main.dart';

class LocalStorageRepository {
  final _storage = SharedPreferences.getInstance();

  Future<bool> delete(final String key) async {
    return (await _storage).remove(key);
  }

  Future<dynamic> get<T>(
    final String chave,
    T Function(dynamic json) deserializerFunction,
  ) async {
    Object? object = (await _storage).get(chave);
    if (object == null) return null;
    return deserializerFunction(jsonDecode(object as String));
  }

  Future<bool> save(final String chave, final dynamic valor) async {
    return (await _storage).setString(chave, jsonEncode(valor.toJson()));
  }
}
