import 'package:flutter/material.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({super.key});

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a case'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [Text('te')],
        ),
      ),
    );
  }
}
