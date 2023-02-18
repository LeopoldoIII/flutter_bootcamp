import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProvider userProvider = UserProvider();
  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: getAppBar(context, 'Profile', userProvider.user),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
