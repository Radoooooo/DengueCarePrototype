import 'package:flutter/material.dart';

import 'admin_add_account_page.dart';

class AdminManageAccountsPage extends StatefulWidget {
  const AdminManageAccountsPage({super.key});

  @override
  State<AdminManageAccountsPage> createState() =>
      _AdminManageAccountsPageState();
}

class _AdminManageAccountsPageState extends State<AdminManageAccountsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Account'),
        leading: const BackButton(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const AdminAddAccountPage()),
                );
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("Juan Dela Cruz"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_remove),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit_square),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
