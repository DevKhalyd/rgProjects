import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rg_projects/core/utils/durations.dart';


class IconAnimated extends StatelessWidget {
  const IconAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Durations.getDurationInMilliseconds(750),
      controller: (c) {
        c.addStatusListener((status) {
          if (status == AnimationStatus.completed) c.reverse();
          if (status == AnimationStatus.dismissed) c.forward();
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          Icons.mic,
          color: Colors.red,
        ),
      ),
    );
  }
}
