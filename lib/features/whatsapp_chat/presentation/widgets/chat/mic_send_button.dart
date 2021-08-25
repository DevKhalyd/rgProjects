import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/durations.dart';
import '../../getX/bottom_input_controller.dart';

/// Change the icon according to the user's input
@deprecated
class MicSendButton extends StatefulWidget {
  const MicSendButton({Key? key}) : super(key: key);

  @override
  _MicSendButtonState createState() => _MicSendButtonState();
}

class _MicSendButtonState extends State<MicSendButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomInputController>(builder: (c) {
      return AnimatedPositioned(
        duration:
            Durations.getDurationInMilliseconds(c.isAnimatingButton ? 0 : 100),
        right: c.rightSide,
        bottom: c.getBottomSpaceForMicButton(),
        child: GestureDetector(
          onTap: c.onPressedSendMicButton,
          onLongPressStart: c.onLongPressStart,
          onLongPressEnd: c.onLongPressEnd,
          onLongPressMoveUpdate: c.onLongPressMoveUpdate,
          child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.whatsapp,
                shape: BoxShape.circle,
              ),
              child: AnimatedPadding(
                duration: Durations.getDurationInMilliseconds(140),
                padding: EdgeInsets.all(c.paddingAll),
                curve: !c.isAnimatingButton ? Curves.linear : Curves.bounceOut,
                child: c.shouldSendMessage
                    ? Icon(
                        Icons.send,
                        color: Colors.white,
                        size: c.sizeIcon,
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
