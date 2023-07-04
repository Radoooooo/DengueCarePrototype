import 'package:flutter/material.dart';
import 'package:prototype_denguecare/pages/user_chat_page.dart';
import 'package:prototype_denguecare/pages/user_home_page.dart';
import 'package:prototype_denguecare/pages/user_login_page.dart';
import 'package:prototype_denguecare/pages/user_otp_page.dart';
import 'package:prototype_denguecare/pages/user_register_page.dart';
import 'package:prototype_denguecare/pages/user_settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  int currentIndex = 0;
  final screens = [
    const UserHomePage(),
    const UserChatPage(),
    const UserSettingsPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: 'userloginpage',
      routes: {
        'userloginpage': (context) => const UserLoginPage(),
        'userhomepage': (context) => const UserHomePage(),
        'userregisterpage': (context) => const UserRegisterPage(),
        'userotppage': (context) => const UserOtpPage(),
      },
    );
  }
}
