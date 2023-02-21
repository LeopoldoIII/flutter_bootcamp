import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
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
    'localId': '',
    'email': '',
    'password': '',
    'name': '',
    'lastname': '',
    'image': ''
  };

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  XFile? image;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    nameController.text = userProvider.user.name!;
    lastNameController.text = userProvider.user.lastname!;
    
    formData['name'] = nameController.text;
    formData['lastname'] = lastNameController.text;
    formData['localId'] = userProvider.user.localId!;
    formData['image'] = userProvider.user.image!;

    return Scaffold(
      appBar: getAppBar(context, 'Profile', userProvider.user),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              GestureDetector(
                  onTap: () async {
                    final ImagePicker _picker = ImagePicker();
                    // Pick an image
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    if (image != null) {
                      final bytes = File(image!.path).readAsBytesSync();
                      formData['image'] = base64Encode(bytes);
                    }
                    setState(() {});
                  },
                  child: userProvider.user.image! == ""
                      ? const Image(image: AssetImage('assets/profile.png'))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(300),
                          child: Image.memory(
                            base64Decode(userProvider.user.image!),
                            fit: BoxFit.cover,
                            height: 400,
                            width: 400,
                          ))),
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
              const SizedBox(
                height: 20,
              ),
              (loading == false)
                  ? ElevatedButton(
                      onPressed: formUpdate, child: const Text('Actualizar'))
                  : const Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }

  formUpdate() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      setState(() {});
      bool respuesta = await userProvider.updateUser(formData);
      loading = false;
      setState(() {});
      if (respuesta) {
        AppDialogs.showDialog1(context, 'Datos Actualizados.');
      } else {
        AppDialogs.showDialog1(context, 'No se pudo actualizar.');
      }
    } else {
      AppDialogs.showDialog1(context, 'Validación no exitosa.');
    }
  }
}
