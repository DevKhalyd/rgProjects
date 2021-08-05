import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rg_projects/features/whatsappChat/presentation/getX/bottom_input_controller.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/widgets/mini_widgets.dart';
import '../getX/whatsapp_camera_controller.dart';
import '../widgets/camera/camera_space.dart';

class WhatsAppCamarera extends StatelessWidget {
  const WhatsAppCamarera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              CameraSpace(),
              TimerRecording(),
              CameraItems(),
            ],
          )),
    );
  }
}

class TimerRecording extends StatelessWidget {
  const TimerRecording({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhatsAppCameraController>(
      builder: (c) {
        if (!c.isRecording) return Container();

        return Positioned(
          child: Container(
            height: 120,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration:
                      BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
                Space(
                  0.02,
                  isHorizontal: true,
                ),
                CustomTimer(
                  from: Duration(seconds: 15),
                  to: Duration(seconds: 0),
                  onBuildAction: CustomTimerAction.auto_start,
                  builder: (CustomTimerRemainingTime remaining) {
                    return TextCustom(
                      '0 : ${remaining.seconds}',
                      color: Colors.white,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CameraItems extends StatelessWidget {
  const CameraItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhatsAppCameraController>(
      builder: (c) {
        return Column(
          children: [
            Spacer(flex: 7),
            // TODO: End this one
            Expanded(
                child: Container(
              color: Colors.transparent,
            )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed:
                                WhatsAppCameraController.to.onSwitchFlashMode,
                            highlightColor: ColorsApp.whatsapp,
                            icon: Icon(
                              c.getIconFlashes(),
                              color: Colors.white,
                            )),
                        GestureDetector(
                          onLongPress: c.onLongPressCamera,
                          onLongPressEnd: c.onLongPressEndCamera,
                          child: AnimatedContainer(
                            curve: Curves.bounceInOut,
                            duration: defaultAnimation,
                            height: c.dimensionSquare,
                            width: c.dimensionSquare,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3.5,
                                )),
                            child: AnimatedPadding(
                              duration: defaultAnimation,
                              padding: EdgeInsets.all(8.0),
                              child: AnimatedContainer(
                                  duration: defaultAnimation,
                                  curve: Curves.bounceInOut,
                                  decoration: BoxDecoration(
                                    color: c.isRecording
                                        ? Colors.red
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                  )),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed:
                                WhatsAppCameraController.to.onSwitchCamera,
                            highlightColor: ColorsApp.whatsapp,
                            focusColor: Colors.red,
                            icon: Icon(
                              Icons.cameraswitch_outlined,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    Space(0.02),
                    // if (c.shouldBeVisible)
                    TextCustom(
                      'Hold for video, tap for photo',
                      color: Colors.white,
                    ),
                  ],
                ))
          ],
        );
      },
    );
  }
}
