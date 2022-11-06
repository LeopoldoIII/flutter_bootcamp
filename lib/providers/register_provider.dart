import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    print("IniciandoRegisterProvider");
  }

  Future<bool> registerUser(Map<String, String> formData) async {
    return false;
  }
}
