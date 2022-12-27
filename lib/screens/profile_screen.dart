import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Profile'),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
