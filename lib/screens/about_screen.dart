import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('About App')),
        drawer: const AppDrawer(),
        body: Center(
          child: Text('About'),
        ));
  }
}
