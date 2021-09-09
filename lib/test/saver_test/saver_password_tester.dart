import 'package:flutter/material.dart';

import '../../features/designs/saver_password/presentation/widgets/home/mini_widgets/account_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SaverPassword',
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('SaverPassword Bar'),
          ),
          body: Center(
            child: AccountItem(
              image: 'spotify',
            ),
          )),
    );
  }
}
