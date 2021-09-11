import 'package:flutter/material.dart';

import '../../features/designs/credit_app/presentation/widgets/activity/number_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Numbers Animatios',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Numbers Animatios Bar'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberAnimation(miliseconds: 7000, avoid: 4),
                  NumberAnimation(),
                  NumberAnimation(
                    miliseconds: 1500,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
