import 'package:flutter/material.dart';
import 'package:rg_projects/src/features/clone_features/whatsapp_chat/presentation/widgets/chat/animated_locked.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jump Animation',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Jump Animation Bar'),
        ),
        body: Center(
          child: LockVoiceRecord(),
        ),
      ),
    );
  }
}
