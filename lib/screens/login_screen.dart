import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.indigo,
        child: Column(children: [
          SizedBox(height: 35),
          Icon(
            Icons.supervised_user_circle,
            size: 200,
            color: Colors.white,
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    const Text('Iniciar Sesion',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          hintText: 'Correo electronico'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.password_outlined),
                          hintText: 'Contraseña'),
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Ingresar'))
                  ],
                ),
              ),
            ),
          ),
          TextButton(onPressed: null, child: Text('Registrar nueva cuenta')),
          SizedBox(height: 35),
        ]),
      ),
    );
  }
}
