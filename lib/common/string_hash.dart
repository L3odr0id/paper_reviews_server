import 'dart:convert';

import 'package:crypto/crypto.dart';

extension Hash on String {
  String get sha256Hash {
    var bytes1 = utf8.encode(this); // data being hashed
    var digest1 = sha256.convert(bytes1);
    return digest1.toString();
  }
}
