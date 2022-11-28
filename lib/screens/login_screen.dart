import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/providers/providers.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
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
                      const AppTitle('Inicio de Sesion'),
                      const SizedBox(
                        height: 25,
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
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              bool respuesta =
                                  await loginProvider.loginUser(formData);
                              if (respuesta) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(
                                                  context, 'home');
                                            },
                                            child: Text('OK'))
                                      ], title: Text('Usuario correcto'));
                                    });
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                        title: Text('Usuario incorrecto'));
                                  });
                            }
                          },
                          child: const Text('Ingresar'))
                    ],
                  ),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'register');
              },
              child: const Text(
                'Registrar nueva cuenta',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(height: 35),
        ]),
      ),
    );
  }
}
