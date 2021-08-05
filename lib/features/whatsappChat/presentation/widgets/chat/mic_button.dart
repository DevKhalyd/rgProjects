import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';
import '../../getX/bottom_input_controller.dart';

class MicButton extends StatelessWidget {
  const MicButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(builder: (c) {
      return AnimatedPositioned(
        duration: defaultAnimation,
        right: 5,
        bottom: c.getBottomSpace(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          decoration: BoxDecoration(
            color: ColorsApp.whatsapp,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
