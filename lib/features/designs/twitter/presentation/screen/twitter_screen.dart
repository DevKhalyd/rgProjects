import 'package:flutter/material.dart';

// TODO: Test in a isolate case...
/// Twitter Screen
class TwitterScreen extends StatelessWidget {
  const TwitterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Twitter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
