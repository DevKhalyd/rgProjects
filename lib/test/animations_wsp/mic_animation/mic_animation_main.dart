
import 'package:flutter/material.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/widgets/animations/mic_trash_animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mic Animation',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mic Animation Bar'),
        ),
        body: MicTrashAnimation(),
      ),
    );
  }
}
