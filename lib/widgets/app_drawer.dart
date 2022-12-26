import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
            children: [Icon(Icons.person, size: 100)],
          )),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.restorablePushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            title: Text('Mapa'),
            onTap: () {
              Navigator.restorablePushReplacementNamed(context, 'map');
            },
          ),
          ListTile(
            title: Text('Temporal 1'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Temporal 2'),
            onTap: () {},
          ),
          ListTile(
            title: Text('About'),
            onTap: () {
              Navigator.restorablePushReplacementNamed(context, 'about');
            },
          )
        ],
      ),
    );
  }
}
