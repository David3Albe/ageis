import 'dart:convert';

import 'package:compartilhados/functions/cryptography/secrets.dart';
import 'package:dependencias_comuns/cryptography_export.dart';

class CryptographyHelper {
  static Future<(String base64Cipher, String nonce)> encryptJson(
    String jsonPayload,
  ) async {
    final secretKey = SecretKey(
      utf8.encode(Secrets.KEY),
    );
    final algorithm = AesCbc.with256bits(macAlgorithm: MacAlgorithm.empty);

    final data = utf8.encode(jsonPayload);

    final secretBox = await algorithm.encrypt(
      data,
      secretKey: secretKey,
    );

    return (base64.encode(secretBox.cipherText), secretBox.nonce.toString());
  }
}
