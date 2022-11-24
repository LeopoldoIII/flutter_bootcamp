import 'package:flutter/material.dart';

class AppFormFiled extends StatelessWidget {
  final String name;
  final String label;
  final IconData? icon;
  final String? Function(String?)? validator;

  const AppFormFiled(
    this.name,
    this.label, {
    Key? key,
    this.icon,
    this.validator,
    required this.formData,
  }) : super(key: key);

  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        formData['password'] = value;
      },
      validator: validator,
      decoration: InputDecoration(icon: Icon(icon), hintText: label),
    );
  }
}
