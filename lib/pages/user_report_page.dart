import 'package:flutter/material.dart';

class UserReportPage extends StatefulWidget {
  const UserReportPage({super.key});

  @override
  State<UserReportPage> createState() => _UserReportPageState();
}

class _UserReportPageState extends State<UserReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a case'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Center(
            child: Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 400),
                child: const Column(
                  children: [
                    Text('te'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
