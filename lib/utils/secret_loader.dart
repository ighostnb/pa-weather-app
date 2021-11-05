import 'package:weather/utils/secret.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath,
        (jsonString) async {
      final secret = Secret.fromJson(jsonDecode(jsonString));
      return secret;
    });
  }
}
