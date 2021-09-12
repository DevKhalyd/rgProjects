import 'package:flutter/material.dart';

import '../../features/designs/credit_app/presentation/widgets/activity/profile_animated.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Painter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Custom Painter Bar'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileAnimated(
                    borderColor: Colors.pink,
                  ),
                  ProfileAnimated(
                    borderColor: Colors.purple,
                  ),
                  ProfileAnimated(
                    borderColor: Colors.green,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
