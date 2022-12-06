import 'dart:convert';
import '../api/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  String endpoint = 'https://identitytoolkit.googleapis.com/v1/';
  RegisterProvider() {
    print("IniciandoRegisterProvider");
  }
  Future<bool> registerUser(Map<String, String> formData) async {
    var url = Uri.parse('${endpoint}accounts:signUp?key=$apiKey');

    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
