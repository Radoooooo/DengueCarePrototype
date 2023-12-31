import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('DengueCare'),
        actions: <Widget>[
          PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              // const PopupMenuItem<int>(
              //   value: 0,
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.settings,
              //       color: Colors.black,
              //       size: 26,
              //     ),
              //     title: Text('Settings'),
              //   ),
              // ),
              const PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.black,
                    size: 26,
                  ),
                  title: Text('About'),
                ),
              ),
              // const PopupMenuItem<int>(
              //   value: 2,
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.logout_rounded,
              //       color: Colors.black,
              //       size: 26,
              //     ),
              //     title: Text('Logout'),
              //   ),
              // ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (() {}),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset('images/dengue4s.jpg'),
                    const ListTile(
                      title: Text('Mag 4S tayo!'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            // GestureDetector(
            //   onTap: (() {}),
            //   child: Container(
            //     margin:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15),
            //       color: Colors.white,
            //       boxShadow: const [
            //         BoxShadow(
            //           color: Colors.black12,
            //           spreadRadius: 2,
            //           blurRadius: 2,
            //           offset: Offset(2, 2),
            //         ),
            //       ],
            //     ),
            //     width: double.infinity,
            //     child: Column(
            //       children: [
            //         Image.asset('images/boba-two-graphs.png'),
            //         const ListTile(
            //           title: Text('Dengue Cases as of June 01, 2023'),
            //           trailing: Icon(Icons.arrow_forward_ios_rounded),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
  }
}
