import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    print("IniciandoLoginProvider");
  }

  Future<bool> loginUser(Map<String, String> formData) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=');

    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
