import 'package:flutter/material.dart';
import 'package:prototype_denguecare/pages/user_chat_page.dart';
import 'package:prototype_denguecare/pages/user_home_page.dart';
import 'package:prototype_denguecare/pages/user_settings_page.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const UserHomePage(),
    const UserChatPage(),
    const UserSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: IndexedStack(
          children: screens,
        ),
      );
}
