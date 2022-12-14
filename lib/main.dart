import 'package:flutter/material.dart';
import 'package:flutter_bootcamp/app_config.dart';
import 'package:flutter_bootcamp/models/user.dart';
import 'package:flutter_bootcamp/providers/providers.dart';
import 'package:flutter_bootcamp/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ChangeNotifierProvider(create: (_) => UserProvider())
    ]);
  }
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppConfig.initialRoute,
      routes: AppConfig.routes(),
    );
  }
}
