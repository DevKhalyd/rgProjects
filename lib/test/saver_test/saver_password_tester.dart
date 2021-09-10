import 'package:flutter/material.dart';

import '../../features/designs/saver_password/presentation/screens/saver_password_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaverPassword',
      home: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: SavePasswordMenu(),
          )),
    );
  }
}
