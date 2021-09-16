import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/durations.dart';
import 'package:rg_projects/core/utils/logical.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import '../../core/extensions/build_context_ext.dart';
// Resources: https://en.wikipedia.org/wiki/Hue

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Animations',
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Container Animations Bar'),
        ),
        body: _Body(),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  // How to use hex colors
  // 1. Remove the #
  // 2.. Add the 0xFF(COLOR) then use it
  // https://stackoverflow.com/a/65796763/10942018
  /* Color(0xFF14ffe9),
                      Color(0xFFffeb3b),
                      Color(0xFFff00e0),*/
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Durations.getDurationInMilliseconds(1500),
    );

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              final t = controller.value;
              final Shader linearGradient = LinearGradient(
                colors: <Color>[
                  HSVColor.fromAHSV(1, Logical.getHue(initial: 60, t: t), 1, 1)
                      .toColor(),
                  HSVColor.fromAHSV(1, Logical.getHue(initial: 180, t: t), 1, 1)
                      .toColor(),
                  HSVColor.fromAHSV(1, Logical.getHue(initial: 300, t: t), 1, 1)
                      .toColor(),
                ],
              ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
              return Container(
                width: context.width * .9,
                height: context.width * .35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: HSVColor.fromAHSV(
                              1, Logical.getHue(initial: 60, t: t), 1, 1)
                          .toColor(),
                      blurRadius: lerpDouble(80, 120, t)!,
                      spreadRadius: lerpDouble(10, 20, t)!,
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      HSVColor.fromAHSV(
                              1, Logical.getHue(initial: 60, t: t), 1, 1)
                          .toColor(),
                      HSVColor.fromAHSV(
                              1, Logical.getHue(initial: 180, t: t), 1, 1)
                          .toColor(),
                      HSVColor.fromAHSV(
                              1, Logical.getHue(initial: 300, t: t), 1, 1)
                          .toColor(),
                    ],
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color(0xFF1b1b1b),
                  child: Center(
                    child: TextCustom(
                      'Hello There',
                      fontSize: 46,
                      color: null,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
