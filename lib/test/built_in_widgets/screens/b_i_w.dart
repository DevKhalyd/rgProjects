import 'package:flutter/material.dart';

import '../widgets/btn_sheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Built-in',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Built-in Bar'),
        ),
        body: BottomSheetTest(),
      ),
    );
  }
}
