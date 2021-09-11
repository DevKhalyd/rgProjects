import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/logger.dart';

import '../../../../../../core/utils/durations.dart';
import '../../../../../../core/widgets/mini_widgets.dart';

const _height = 80.0;

class NumberAnimation extends StatefulWidget {
  const NumberAnimation({Key? key, this.miliseconds = 4500, this.avoid = -1})
      : super(key: key);

  final int miliseconds;

  /// Avoid from -1 to avoid number desired
  final int avoid;

  @override
  _NumberAnimationState createState() => _NumberAnimationState();
}

class _NumberAnimationState extends State<NumberAnimation> {
  final controller = ScrollController();
  final random = Random();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Durations.getDurationInMilliseconds(widget.miliseconds),
        (_) {
      int randomNumber = random.nextInt(10);

      if (randomNumber <= widget.avoid) return;

      Log.console('Number generated: $randomNumber');
      final pixels = randomNumber * _height;
      controller.animateTo(
        pixels,
        duration: Durations.getDurationInMilliseconds(850),
        curve: Curves.linearToEaseOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: 50,
      child: AbsorbPointer(
        child: ListView(
          controller: controller,
          physics: BouncingScrollPhysics(),
          itemExtent: _height,
          children: List.generate(
              10,
              (index) => CenterText(
                    '$index',
                    fontSize: 65,
                  )),
        ),
      ),
    );
  }
}
