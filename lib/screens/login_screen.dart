import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/providers/providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  Map<String, String> formData = {'email': '', 'password': ''};
  LoginProvider loginProvider = LoginProvider();
  UserProvider userProvider = UserProvider();
  bool checkSaveData = false;
  SharedPreferences? pref;
  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    loadSharedPferences();
    super.initState();
  }

  loadSharedPferences() async {
    pref = await SharedPreferences.getInstance();
    if (pref != null) {
      emailController.text = pref!.getString("email").toString();
      passwordController.text = pref!.getString("password").toString();
      formData['email'] = emailController.text;
      formData['password'] = passwordController.text;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context);
    userProvider = Provider.of<UserProvider>(context);

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
                        controller: emailController,
                        icon: Icons.email_outlined,
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
                        controller: passwordController,
                        icon: Icons.padding_outlined,
                        obscureText: true,
                        formData: formData,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Contraseña no valida";
                          }
                          return null;
                        },
                      ),
                      CheckboxListTile(
                          value: checkSaveData,
                          title: const Text('Guardar datos?',
                              style: TextStyle(color: Colors.grey)),
                          onChanged: (value) {
                            setState(() {
                              checkSaveData = value!;
                            });
                          }),
                      ElevatedButton(
                          onPressed: formLogin, child: const Text('Ingresar'))
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

  formLogin() async {
    if (formKey.currentState!.validate()) {
      var user = await loginProvider.loginUser(formData);
      if (user != null) {
        userProvider.setUser(user);
        //shared peference
        if (checkSaveData && pref != null) {
          pref!.setString("email", user.email!);
          pref!.setString("password", formData['password']!);
        }
        AppDialogs.showDialog2(context, 'Usuario Autenticado!', [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, 'home');
              },
              child: const Text('OK'))
        ]);
      } else {
        AppDialogs.showDialog1(context, 'No se pudo iniciar sesion.');
      }
    } else {
      AppDialogs.showDialog1(context, 'No se pudo validar.');
    }
  }
}
