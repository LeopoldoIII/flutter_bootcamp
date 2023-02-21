import 'dart:convert';
import '../api/api_key.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class RegisterProvider extends ChangeNotifier {
  
  RegisterProvider() {
    print("IniciandoRegisterProvider");
  }
  Future<bool> registerUser(Map<String, String> formData) async {
    var url = Uri.parse('${endpoint}accounts:signUp?key=$apiKey');

    var response = await http.post(url, body: jsonEncode(formData));
    if (response.statusCode == 200) {
      var user = User.fromJson(jsonDecode(response.body));
      //print(user.localId);

      var urlDB = Uri.parse(
          '${endpointDb}users/${user.localId!}.json');

      var responseDb = await http.put(urlDB,
          body: jsonEncode(
              {'name': formData['name'], 'lastname': formData['lastname']}));
      if (responseDb.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
