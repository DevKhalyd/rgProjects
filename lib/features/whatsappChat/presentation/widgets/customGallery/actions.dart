import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/core/utils/logger.dart';
import 'package:rg_projects/features/whatsappChat/presentation/getX/slider_gallery_controller.dart';

import 'dart:ui';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/mini_widgets.dart';
import '../../getX/bottom_input_controller.dart';
import '../../getX/whatsapp_camera_controller.dart';

class Actions extends StatelessWidget {
  const Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhatsAppCameraController>(
      builder: (c) {
        final maxNumber = SliderGalleryController.to.maxSliderHeight -
            SliderGalleryController.to.minSliderHeight;

        final percentage = (SliderGalleryController.to.currentSliderHeight -
                SliderGalleryController.to.minSliderHeight) /
            maxNumber;

        Log.console('Percentage: $percentage');

        return AnimatedOpacity(
          duration: Duration(milliseconds: 250),
          opacity: 1.0 - percentage.clamp(0.0, 1.0),
          child: Column(
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
          ),
        );
      },
    );
  }
}
