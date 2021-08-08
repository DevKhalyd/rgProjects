import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/test/listener/presentation/getX/listener_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listener',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listener Material App'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListenerController>(
      init: ListenerController(),
      builder: (c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onVerticalDragUpdate: c.onVerticalDragUpdate,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                height: c.height,
                width: double.infinity,
                color: Colors.red,
              ),
            )
          ],
        );
      },
    );
  }
}
