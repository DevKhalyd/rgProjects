import 'package:flutter/material.dart';

import '../features/designs/twitter/presentation/screen/twitter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Twitter Screen',
      home: TwitterScreen(),
    );
  }
}
