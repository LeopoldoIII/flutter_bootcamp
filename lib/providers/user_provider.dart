import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/models/user.dart';
import '../api/api_key.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  User user = User();

  setUser(User _user) {
    user = _user;
    notifyListeners();
  }

  Future<bool> updateUser(Map<String, String> formData) async {
    var urlDB = Uri.parse('${endpointDb}users/${user.localId!}.json');

    var responseDb = await http.put(urlDB, body: jsonEncode(formData));
    if (responseDb.statusCode == 200) {
      user.setUserData(jsonDecode(responseDb.body));
      notifyListeners();
      return true;
    }
    return false;
  }
}
