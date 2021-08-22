import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/durations.dart';
import '../../getX/bottom_input_controller.dart';

/// Change the icon according to the user's input
class MicSendButton extends StatelessWidget {
  const MicSendButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(builder: (c) {
      return AnimatedPositioned(
        duration: Durations.getDurationInMilliseconds(c.isAnimatingButton ? 10 : 50),
        right: c.rightSide,
        bottom: c.getBottomSpaceForMicButton(),
        child: GestureDetector(
          onTap: c.onPressedSendMicButton,
          onLongPress: c.onLongPress,
          onLongPressEnd: c.onLongPressEnd,
          onLongPressMoveUpdate: c.onLongPressMoveUpdate,
          child: AnimatedContainer(
              duration: Durations.getDurationInMilliseconds(50),
              curve: Curves.ease,
              decoration: BoxDecoration(
                color: ColorsApp.whatsapp,
                shape: BoxShape.circle,
              ),
              child: AnimatedPadding(
                duration: Durations.defaultAnimation,
                padding: EdgeInsets.all(c.paddingAll),
                child: c.shouldSendMessage
                    ? Icon(
                        Icons.send,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: c.sizeIcon,
                      ),
              )),
        ),
      );
    });
  }
}
