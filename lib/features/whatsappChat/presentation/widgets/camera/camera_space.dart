import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rg_projects/features/whatsappChat/presentation/getX/whatsapp_camera_controller.dart';

class CameraSpace extends StatelessWidget {
  const CameraSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WhatsAppCameraController>(
      builder: (c) {
        final controller = c.controller;
        // NOTE: Check with the operators
        if (controller == null) return Container();
        if (!controller.value.isInitialized) return Container();
        return Container(
          color: Colors.green,
          child: CameraPreview(controller),
          height: double.infinity,
        );
      },
    );
  }
}
