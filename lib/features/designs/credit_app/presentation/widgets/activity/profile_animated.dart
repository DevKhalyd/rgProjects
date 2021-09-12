import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/logical.dart';

import '../../../../../../core/utils/durations.dart';
import 'painters/border_custom.dart';
import 'painters/path_custom.dart';

const _side = 100.0;

class ProfileAnimated extends StatefulWidget {
  const ProfileAnimated({Key? key, required this.borderColor})
      : super(key: key);

  final Color borderColor;
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<ProfileAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      value: .1,
      duration: Durations.getDurationInMilliseconds(
        1500,
      ),
    );

    Timer.periodic(Durations.getDurationInMilliseconds(4500), (_) {
      final percentage = Logical.generateDouble();
      if (percentage < .25) return;
      controller.animateTo(percentage);
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
      child: _Child(),
      builder: (_, child) {
        return CustomPaint(
          painter: CustomBorderAnimated(
            value: controller.value,
            borderColor: widget.borderColor,
          ),
          child: child,
        );
      },
    );
  }
}

class _Child extends StatelessWidget {
  const _Child({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _side,
      width: _side,
      padding: EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: PathCustom(),
        child: Container(
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
