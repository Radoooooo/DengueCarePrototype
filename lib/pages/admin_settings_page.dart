import 'package:flutter/material.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({super.key});

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More Options'),
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
            title: const Text('Encode Cases'),
            leading: const Icon(
              Icons.upload,
              color: Colors.black,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Data Analysis'),
            leading: const Icon(
              Icons.add_chart_sharp,
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      actionsOverflowButtonSpacing: 20,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'adminloginpage');
                            },
                            child: const Text("Logout")),
                      ],
                      content: const Text("Do you really want to logout?"),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
