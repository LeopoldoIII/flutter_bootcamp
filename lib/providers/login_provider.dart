import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/models/user.dart';
import '../api/api_key.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  String endpoint = 'https://identitytoolkit.googleapis.com/v1/';
  LoginProvider() {
    print("IniciandoLoginProvider");
  }

  Future<User?> loginUser(Map<String, String> formData) async {
    var url = Uri.parse('${endpoint}accounts:signInWithPassword?key=$apiKey');

    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      var user = User.fromJson(jsonDecode(response.body));
      var urlDb = Uri.parse('$endpointDb/users/${user.localId!}.json');

      var responseDb = await http.get(urlDb);
      if (responseDb.statusCode == 200) {
        user.setUserData(jsonDecode(responseDb.body));
        return user;
      }
    }
    return null;
  }
}
