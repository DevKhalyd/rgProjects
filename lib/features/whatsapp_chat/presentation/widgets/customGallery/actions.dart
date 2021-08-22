import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/durations.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../../getX/whatsapp_camera_controller.dart';

/// The actions to use to take a picture or
class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhatsAppCameraController>(
      builder: (c) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: WhatsAppCameraController.to.onSwitchFlashMode,
                    highlightColor: ColorsApp.whatsapp,
                    icon: Icon(
                      c.getIconFlashes(),
                      color: Colors.white,
                    )),
                GestureDetector(
                  onTap: c.onTapCamera,
                  onLongPress: c.onLongPressCamera,
                  onLongPressEnd: c.onLongPressEndCamera,
                  child: AnimatedContainer(
                    curve: Curves.bounceInOut,
                    duration: Durations.defaultAnimation,
                    height: c.dimensionSquare,
                    width: c.dimensionSquare,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3.5,
                        )),
                    child: AnimatedPadding(
                      duration: Durations.defaultAnimation,
                      padding: EdgeInsets.all(8.0),
                      child: AnimatedContainer(
                          duration: Durations.defaultAnimation,
                          curve: Curves.bounceInOut,
                          decoration: BoxDecoration(
                            color:
                                c.isRecording ? Colors.red : Colors.transparent,
                            shape: BoxShape.circle,
                          )),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: WhatsAppCameraController.to.onSwitchCamera,
                    highlightColor: ColorsApp.whatsapp,
                    focusColor: Colors.red,
                    icon: Icon(
                      Icons.cameraswitch_outlined,
                      color: Colors.white,
                    )),
              ],
            ),
            Space(0.02),
            TextCustom(
              'Hold for video, tap for photo',
              color: Colors.white,
            ),
            Space(0.02),
          ],
        );
      },
    );
  }
}
