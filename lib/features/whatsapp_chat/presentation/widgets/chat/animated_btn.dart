import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            final animatingUp = c.animatingUp;

            // TODO: Move to the controller to handle this logic
            final getBottomSpace = () {
              // TODO: Fix this logic to handle with the animaitons in both sides
              if (c.isOpenEmojiMenu) return c.getExtraSpaceForEmojiMenu();

              return c.readyForMoveButton
                  ? bottomSideFinal +
                      (c.animatingUp
                          ? lerpDouble(
                              bottomSideFinal, context.height * .15, value)!
                          : 0)
                  : lerpDouble(
                      bottomSideInitial,
                      bottomSideFinal,
                      value,
                    );
            };

            return Positioned(
              bottom: getBottomSpace(),

              /// When the user goes from right to left
              right: c.readyForMoveButton
                  // Going left
                  ? !c.animatingUp
                      ? lerpDouble(rightSideFinal, context.width * .2, value)
                      : rightSideFinal
                  // Going to the corner
                  : lerpDouble(rightSideInitial, rightSideFinal, value),
              child: GestureDetector(
                onTap: c.onTap,
                onLongPressMoveUpdate: c.onLongPressMoveUpdate,
                onLongPressStart: c.onLongPressStart,
                onLongPressEnd: c.onLongPressEnd,
                child: Transform.scale(
                  scale:
                      animatingUp && c.readyForMoveButton ? 1.0 - value : 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsApp.whatsapp,
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedPadding(
                      duration: Durations.getDurationInMilliseconds(150),
                      padding: EdgeInsets.all(c.paddingBtn),
                      curve: Curves.bounceOut,
                      child: c.getIconForAnimatedBtn(),
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
