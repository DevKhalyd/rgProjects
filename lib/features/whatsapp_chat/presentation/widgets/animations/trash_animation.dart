import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rg_projects/features/whatsapp_chat/presentation/getX/bottom_inp_butn_controller.dart';

import '../../../../../core/utils/durations.dart';

const _firstRect = 8.0;
const _secondRect = 15.0;
const _height = 5.0;

const _bodySide = 12.0;

/// When the Lid raise in the air and the close the container
class TrashAnimation extends StatelessWidget {
  const TrashAnimation({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LidAnimation(),
        Container(
          color: Colors.grey,
          width: _bodySide,
          height: _bodySide + 5,
          child: child,
        )
      ],
    );
  }
}

// Use animation
class _LidAnimation extends StatefulWidget {
  const _LidAnimation({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_LidAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Durations.getDurationInMilliseconds(100),
    );

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        /// End the other animation
        Future.delayed(Durations.getDurationInMilliseconds(1400), () {
          controller.reverse();
          BottomInputBtnController.to.restartInput();
        });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final value = controller.value;
        return Transform.translate(
          offset: Offset(lerpDouble(0, -20, value)!, lerpDouble(1, 10, value)!),
          child: Transform.rotate(
            angle: lerpDouble(1.55, -.5, value)!,
            child: RotatedBox(
              quarterTurns: 3,
              child: _LidIcon(),
            ),
          ),
        );
      },
    );
  }
}

class _LidIcon extends StatelessWidget {
  const _LidIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _firstRect,
          height: _height,
          color: Colors.grey,
        ),
        Container(
          width: _secondRect,
          height: _height,
          color: Colors.grey,
        ),
      ],
    );
  }
}
