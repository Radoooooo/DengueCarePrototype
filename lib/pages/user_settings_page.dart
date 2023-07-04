import 'package:flutter/material.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Account Settings'),
            leading: const Icon(
              Icons.person,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Prefereneces'),
            leading: const Icon(
              Icons.checklist,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
