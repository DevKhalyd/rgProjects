import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/logger.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/durations.dart';
import '../../getX/bottom_inp_butn_controller.dart';

/// Animated Button Whats
class AnimatedButtonWhats extends StatefulWidget {
  const AnimatedButtonWhats({Key? key}) : super(key: key);

  @override
  _AnimatedButtonWhatsState createState() => _AnimatedButtonWhatsState();
}

class _AnimatedButtonWhatsState extends State<AnimatedButtonWhats>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Durations.getDurationInMilliseconds(50));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        /// Asign the controller to use from the main controller
        c.controller = controller;
        return AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            final value = controller.value;
            if (c.readyForMoveButton) Log.console('Builder Value: $value');
            return Positioned(
              bottom: c.readyForMoveButton
                  ? bottomSideFinal
                  : lerpDouble(bottomSideInitial, bottomSideFinal, value),
              right: c.readyForMoveButton
                  ? lerpDouble(rightSideFinal, 200.0, value)
                  : lerpDouble(rightSideInitial, rightSideFinal, value),
              child: GestureDetector(
                onLongPressMoveUpdate: c.onLongPressMoveUpdate,
                onLongPressStart: c.onLongPressStart,
                onLongPressEnd: c.onLongPressEnd,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorsApp.whatsapp,
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedPadding(
                    duration: Durations.getDurationInMilliseconds(150),
                    padding: EdgeInsets.all(c.paddingBtn),
                    curve: Curves.bounceOut,
                    child: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: c.sizeIcon,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
