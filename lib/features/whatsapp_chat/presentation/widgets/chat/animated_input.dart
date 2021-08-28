import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../getX/bottom_inp_butn_controller.dart';

class AnimatedInput extends StatelessWidget {
  const AnimatedInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputBtnController>(
      builder: (c) {
        return Positioned(
          bottom: 10,
          left: 5,
          child: Container(
            // With .9 peercent get the size required
            width: context.width * .81,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0), color: Colors.white),
            child: Row(
              children: [Container()],
            ),
          ),
        );
      },
    );
  }
}
