import 'package:flutter/material.dart';
import '../models/user.dart';

getAppBar(String title, User user) {
  String initials = user.name!.substring(0, 1) + user.lastname!.substring(0, 1);
  return AppBar(title: Text(title), centerTitle: true, actions: [
    CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(initials),
    ),
    SizedBox(
      width: 5,
    )
  ]);
}
