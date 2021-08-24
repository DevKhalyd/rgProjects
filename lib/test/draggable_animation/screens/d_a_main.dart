import 'package:flutter/material.dart';

import '../widgets/bodyh_d_a.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Draggable App Bar'),
        ),
        body: BodyHD(),
      ),
    );
  }
}
