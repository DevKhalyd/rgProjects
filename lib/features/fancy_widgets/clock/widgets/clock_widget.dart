import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide ContextExtensionss;

import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/utils/durations.dart';
import '../../../../core/utils/logical.dart';
import '../getX/clock_controller.dart';
import 'text_gradient.dart';

/// Exposes the parameters to create the clock
class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Durations.getDurationInMilliseconds(1200),
    );

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    final heightGreaterThanWidth = height > width + 100;
    return Center(
      child: AnimatedBuilder(
          animation: controller,
          builder: (_, child) {
            final t = controller.value;
            final linearGradient = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                HSVColor.fromAHSV(1, Logical.getHue(initial: 60, t: t), 1, 1)
                    .toColor(),
                HSVColor.fromAHSV(1, Logical.getHue(initial: 180, t: t), 1, 1)
                    .toColor(),
                HSVColor.fromAHSV(1, Logical.getHue(initial: 300, t: t), 1, 1)
                    .toColor(),
              ],
            );

            final heightHorizontal = height * .3;
            final widthHorizontal = width * .75;
            final heightVertical = width * .3;
            final widthVertical = height * .75;
            // Resource:
            //https://stackoverflow.com/questions/50751226/how-to-dynamically-resize-text-in-flutter
            return RotatedBox(
              // 0 = Horizontal
              // 1 = Vertical
              quarterTurns: heightGreaterThanWidth ? 1 : 0,
              child: Container(
                constraints: BoxConstraints(maxWidth: 1700),
                width: heightGreaterThanWidth ? widthVertical : widthHorizontal,
                height:
                    heightGreaterThanWidth ? heightVertical : heightHorizontal,
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
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: GetBuilder<ClockController>(
                        builder: (c) {
                          return TextGradient(
                            c.currentTime,
                            gradient: linearGradient,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            fontSize: 170,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
