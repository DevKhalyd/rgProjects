import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/utils/durations.dart';
import '../../../../../core/utils/logger.dart';

class MicTrashAnimation extends StatefulWidget {
  const MicTrashAnimation({
    Key? key,
  }) : super(key: key);

  @override
  __MicAnimmationState createState() => __MicAnimmationState();
}

class __MicAnimmationState extends State<MicTrashAnimation>
    with TickerProviderStateMixin {
  late final AnimationController controllerTranslation,
      controllerMic,
      controllerScale;

  late final Animation<double> animationMic, animationScale;

  @override
  void initState() {
    super.initState();

    controllerScale = AnimationController(
      duration: Durations.getDurationInMilliseconds(1100),
      vsync: this,
    );

    animationScale = CurvedAnimation(
      parent: controllerScale,
      curve: Curves.fastOutSlowIn,
    );

    controllerMic = AnimationController(
      duration: Durations.getDurationInMilliseconds(2500),
      vsync: this,
    );

    animationMic = CurvedAnimation(
      parent: controllerMic,
      curve: Curves.elasticOut,
    );

    controllerTranslation = AnimationController(
      duration: Durations.getDurationInMilliseconds(800),
      vsync: this,
    );

    controllerTranslation.forward();
    controllerTranslation.addStatusListener((status) {
      Log.console(status);
      if (status == AnimationStatus.completed) {
        controllerTranslation.reverse();
      }

      if (status == AnimationStatus.reverse) {
        controllerScale.forward();
      }
    });

    Future.delayed(Durations.getDurationInMilliseconds(750), () {
      controllerMic.forward();
    });
  }

  @override
  void dispose() {
    controllerTranslation.dispose();
    controllerMic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: controllerTranslation,
        builder: (_, __) {
          final value = controllerTranslation.value;

          final shouldUseZero =
              controllerTranslation.status == AnimationStatus.reverse;

          return Transform.translate(
            offset:
                Offset(0, lerpDouble(shouldUseZero ? 0 : -30, -150, value)!),
            child: RotationTransition(
              turns: animationMic,
              child: AnimatedBuilder(
                animation: animationScale,
                builder: (_, __) {
                  final status = controllerTranslation.status;
                  final validation = status == AnimationStatus.forward ||
                      status == AnimationStatus.completed;
                  return Transform.scale(
                    scale: validation
                        ? 1.0
                        : lerpDouble(1.0, 0, animationScale.value)!,
                    child: Icon(
                      Icons.mic,
                      color: Colors.red,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
