import 'package:flutter/material.dart';
import '../api/api_key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  String endpoint = 'https://identitytoolkit.googleapis.com/v1/';
  LoginProvider() {
    print("IniciandoLoginProvider");
  }

  Future<bool> loginUser(Map<String, String> formData) async {
    var url = Uri.parse(
        '${endpoint}accounts:signInWithPassword?key=$apiKey');

    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
