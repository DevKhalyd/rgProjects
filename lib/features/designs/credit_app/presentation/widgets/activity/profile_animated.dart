import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rg_projects/core/widgets/mini_widgets.dart';

import '../../../../../../core/utils/durations.dart';
import '../../../../../../core/utils/logical.dart';
import 'img_recipients.dart';
import 'painters/border_custom.dart';


class ProfileAnimated extends StatefulWidget {
  const ProfileAnimated({
    Key? key,
    required this.borderColor,
    required this.asset,
    required this.name,
  }) : super(key: key);

  final Color borderColor;
  final String asset;
  final String name;

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
      duration: Durations.getDurationInMilliseconds(1500),
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
      builder: (_, __) {
        return Column(
          children: [
            CustomPaint(
              painter: CustomBorderAnimated(
                value: controller.value,
                borderColor: widget.borderColor,
              ),
              child: ImgProfile(asset: widget.asset),
            ),
            TextCustom(
              widget.name,
              fontWeight: FontWeight.bold,
            )
          ],
        );
      },
    );
  }
}
