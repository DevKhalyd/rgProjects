import 'package:get/get.dart';

import '../getX/whatsapp_camera_controller.dart';

class CameraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WhatsAppCameraController());
  }
}
