import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_ext.dart';
import '../../../core/utils/durations.dart';

const _sideSize = 70.0;

class CircleButtonDA extends StatefulWidget {
  const CircleButtonDA({Key? key}) : super(key: key);

  @override
  _CircleButtonDAState createState() => _CircleButtonDAState();
}

class _CircleButtonDAState extends State<CircleButtonDA>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late double globalPositiononStartDX, globalPositiononStartDY;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Durations.getDurationInMilliseconds(50),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final halfWidth = context.width * .415;
    final halfHeight = context.height * .4;
    //animation.forward();
    return AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          final value = animation.value;
          return Positioned(
              left: isGoingLeft ? lerpDouble(halfWidth, 0, value) : null,
              top: isGoingUp ? lerpDouble(halfHeight, 0, value) : null,
              child: GestureDetector(
                onLongPressStart: onLongPressStart,
                onLongPressMoveUpdate: onLongPressMoveUpdate,
                onLongPressEnd: onLongPressEnd,
                child: CircleCustom(
                  color: Colors.yellow,
                ),
              ));
        });
  }

  bool isGoingLeft = false;
  bool isGoingUp = false;

  onLongPressMoveUpdate(LongPressMoveUpdateDetails d) {
    // final globalPosition = d.globalPosition;
    final localOffsetFromOrigin = d.localOffsetFromOrigin;
    final dx = localOffsetFromOrigin.dx;
    final dy = localOffsetFromOrigin.dy;

    // NOTE: The global position provided by the start method and the
    // localOffsetFromOrigin provided by this one are key for get the current position of the user
    // Log.console('globalPosition - $globalPosition'); // start at: 213.4

    if (dx < 0.0 && dy > -15.0) {
      // Get the percentage to animate
      final result = (dx / globalPositiononStartDX).abs();
      isGoingLeft = true;
      animation.value = result.clamp(.0, 1.0);
      return;
    }

    isGoingLeft = false;

    if (dy < 0.0 && dx > -100.0 && dx < 100) {
      // Get the percentage to animate
      final result = (dy / globalPositiononStartDY).abs();
      isGoingUp = true;
      animation.value = result.clamp(.0, 1.0);
      return;
    }
  }

  onLongPressEnd(_) {
    animation.fling(velocity: -1.0);
    isGoingLeft = false;
    isGoingUp = false;
  }

  onLongPressStart(LongPressStartDetails d) {
    globalPositiononStartDX = d.globalPosition.dx;
    globalPositiononStartDY = d.globalPosition.dy;
  }

  // Reverse the animation
}

class CircleCustom extends StatelessWidget {
  const CircleCustom({
    Key? key,
    this.color = Colors.red,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _sideSize,
      width: _sideSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
