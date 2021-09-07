import 'package:flutter/material.dart';
import 'package:rg_projects/features/designs/saver_password/presentation/widgets/home/shape_transparent.dart';
import 'package:rg_projects/test/saver_test/widgets/transform_container.dart';


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
        body:ShapeTransparent(),
      ),
    );
  }
}
