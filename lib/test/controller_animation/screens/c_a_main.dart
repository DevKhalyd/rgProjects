import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/core/utils/logger.dart';

import '../../../core/extensions/build_context_ext.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controller Container App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Controller Container App Bar'),
        ),
        body: _Body(),
      ),
    );
  }
}

const side = 40.0;

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Stack(
        children: [
          _MenuCustom(),
        ],
      ),
    );
  }
}

class _MenuCustom extends StatefulWidget {
  const _MenuCustom({
    Key? key,
  }) : super(key: key);

  @override
  __MenuCustomState createState() => __MenuCustomState();
}

class __MenuCustomState extends State<_MenuCustom>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double maxHeight;
  double minHeight = 0;
  double currentHeight = 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Durations.getDurationInMilliseconds(750));
    Timer(Durations.getDurationInMilliseconds(1500), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    maxHeight = context.height * .35;
    return GestureDetector(
      onVerticalDragUpdate: (d) {
        final deltaY = d.delta.dy;
        setState(() {
          // the new height in the container
          final newHeight = currentHeight - deltaY;
          // The percetange to show in the animated controller
          controller.value = currentHeight / maxHeight;
          // Clamp the values
          currentHeight = newHeight.clamp(minHeight, maxHeight);
        });
        //Log.console(deltaX);
      },
      child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            final value = controller.value;
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: lerpDouble(0, maxHeight, value),
                width: context.width,
                color: Colors.red,
              ),
            );
          }),
    );
  }
}
