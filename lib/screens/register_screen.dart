import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/providers/providers.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

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
                      const Text('Registro de Usuario',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      TextFormField(
                        onChanged: (value) {
                          formData['email'] = value;
                        },
                        validator: (value) {
                          if (value!.length < 5) {
                            return "Invalid";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            hintText: 'Correo electronico'),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          formData['password'] = value;
                        },
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Contraseña no valida";
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password_outlined),
                            hintText: 'Contraseña'),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              bool respuesta =
                                  await registerProvider.registerUser(formData);
                              if (respuesta) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                          title: Text(
                                              'Usuario registrado con exito.'));
                                    });
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                        title: Text(
                                            'No se pudo registrar el usuario.'));
                                  });
                            }
                          },
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
}
