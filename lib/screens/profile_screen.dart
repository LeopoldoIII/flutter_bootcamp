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
  Map<String, String> formData = {
    'email': '',
    'password': '',
    'name': '',
    'lastname': '',
  };

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    nameController.text = userProvider.user.name!;
    lastNameController.text = userProvider.user.lastname!;

    return Scaffold(
      appBar: getAppBar(context, 'Profile', userProvider.user),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            AppFormFiled(
              'name',
              'Nombre',
              controller: nameController,
              icon: Icons.verified_user_sharp,
              formData: formData,
              validator: (value) {
                if (value!.length < 4) {
                  return "Nombre no valido";
                }
                return null;
              },
            ),
            AppFormFiled(
              'lastname',
              'Last name',
              controller: lastNameController,
              icon: Icons.verified_user_sharp,
              formData: formData,
              validator: (value) {
                if (value!.length < 4) {
                  return "Nombre no valido ";
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}
