import 'package:flutter/material.dart';
import 'package:prototype_denguecare/pages/admin_dataviz_page.dart';
import 'package:prototype_denguecare/pages/admin_dengueform_page.dart';
import 'package:prototype_denguecare/pages/admin_home_page.dart';
import 'package:prototype_denguecare/pages/admin_login_page.dart';
import 'package:prototype_denguecare/pages/user_otp_page.dart';
import 'package:prototype_denguecare/pages/user_report_page.dart';
import 'package:prototype_denguecare/pages/user_home_page.dart';
import 'package:prototype_denguecare/pages/user_login_page.dart';
import 'package:prototype_denguecare/pages/user_settings_page.dart';
import 'package:prototype_denguecare/pages/admin_report_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const UserLoginPage(),
      routes: {
        'mainpage': (context) => const MainPage(),
        'loginpage': (context) => const UserLoginPage(),
        'userotppage': (context) => const UserOtpPage(),
        'adminmainpage': (context) => const AdminMainPage(),
        'adminloginpage': (context) => const AdminLoginPage(),
      },
    );
  }
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
    const UserReportPage(),
    const UserSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: _navBarItemsUser,
        ),
      );
}

const _navBarItemsUser = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.report_outlined),
    selectedIcon: Icon(Icons.report_rounded),
    label: 'Report',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings_outlined),
    selectedIcon: Icon(Icons.settings_rounded),
    label: 'Settings',
  ),
];

class AdminMainPage extends StatefulWidget {
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  int currentIndex = 0;
  final screens = [
    const AdminHomePage(),
    const AdminReportPage(),
    const AdminDengueFormPage(),
    const AdminDataVizPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: NavigationBar(
          animationDuration: const Duration(seconds: 1),
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: _navBarItemsAdmin,
        ),
      );
}

const _navBarItemsAdmin = [
  NavigationDestination(
    icon: Icon(Icons.home_outlined),
    selectedIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  NavigationDestination(
    icon: Icon(Icons.report_outlined),
    selectedIcon: Icon(Icons.report_rounded),
    label: 'Report',
  ),
  NavigationDestination(
    icon: Icon(Icons.map_outlined),
    selectedIcon: Icon(Icons.map_rounded),
    label: 'Map',
  ),
  NavigationDestination(
    icon: Icon(Icons.auto_graph_outlined),
    selectedIcon: Icon(Icons.auto_graph_rounded),
    label: 'Data Analytics',
  ),
  // NavigationDestination(
  //   icon: Icon(Icons.more_horiz_outlined),
  //   selectedIcon: Icon(Icons.more_horiz_rounded),
  //   label: 'More',
  // ),
];
