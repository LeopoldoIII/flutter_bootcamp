import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/providers/providers.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {
    'email': '',
    'password': '',
    'name': '',
    'lastname': '',
  };
  RegisterProvider registerProvider = RegisterProvider();

  @override
  Widget build(BuildContext context) {
    registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.indigo,
        child: Column(children: [
          const SizedBox(height: 35),
          const Icon(
            Icons.supervised_user_circle,
            size: 200,
            color: Colors.white,
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const AppTitle('Registro de Usuario'),
                      AppFormFiled(
                        'name',
                        'Nombre',
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
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 4) {
                            return "Nombre no valido ";
                          }
                          return null;
                        },
                      ),
                      AppFormFiled(
                        'email',
                        'Correo electronico',
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Correo electronico no valida";
                          }
                          return null;
                        },
                      ),
                      AppFormFiled(
                        'password',
                        'Contraseña',
                        obscureText: true,
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Contraseña no valida";
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                          onPressed: formRegister,
                          child: const Text('Registrar'))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35),
        ]),
      ),
    );
  }

  formRegister() async {
    if (formKey.currentState!.validate()) {
      bool respuesta = await registerProvider.registerUser(formData);
      if (respuesta) {
        AppDialogs.showDialog1(context, 'Usuario registrado con exito.');
      } else {
        AppDialogs.showDialog1(context, 'No se pudo registrar el usuario.');
      }
    } else {
      AppDialogs.showDialog1(context, 'No se pudo registrar el usuario.');
    }
  }
}
