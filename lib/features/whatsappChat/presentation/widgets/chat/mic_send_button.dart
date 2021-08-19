import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/durations.dart';

import '../../../../../core/utils/colors.dart';
import '../../getX/bottom_input_controller.dart';

/// Change the icon according to the user's input
class MicSendButton extends StatelessWidget {
  const MicSendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(builder: (c) {
      return AnimatedPositioned(
        duration: Durations.defaultAnimation,
        right: 5,
        bottom: c.getBottomSpace(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          decoration: BoxDecoration(
            color: ColorsApp.whatsapp,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: c.onPressedSendMicButton,
            icon: AnimatedSwitcher(
              duration: Durations.fiftyMilliseconds,
              child: c.shouldSendMessage
                  ? Icon(
                      Icons.send,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.mic,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      );
    });
  }
}
