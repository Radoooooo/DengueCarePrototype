import 'package:flutter/material.dart';
import 'package:prototype_denguecare/pages/user_home_page.dart';
import 'package:prototype_denguecare/pages/user_login_page.dart';
import 'package:prototype_denguecare/pages/user_otp_page.dart';
import 'package:prototype_denguecare/pages/user_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        'userregisterpage':(context) => const UserRegisterPage(),
        'userotppage': (context) => const UserOtpPage(),
      },
    );
  }
}
