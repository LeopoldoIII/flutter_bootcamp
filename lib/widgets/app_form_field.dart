import 'package:flutter/material.dart';

class AppFormFiled extends StatelessWidget {
  final String name;
  final String label;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const AppFormFiled(
    this.name,
    this.label, {
    Key? key,
    this.icon,
    this.validator,
    this.obscureText = false,
    required this.formData,
  }) : super(key: key);

  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        formData[name] = value;
      },
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(icon: Icon(icon), hintText: label),
    );
  }
}
