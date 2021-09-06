import 'package:flutter/material.dart';

import '../../../src/features/clone_features/whatsapp_chat/presentation/widgets/animations/trash_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LID',
      home: Scaffold(
        appBar: AppBar(
          title: Text('LID Bar'),
        ),
        body: TrashAnimation(),
      ),
    );
  }
}
