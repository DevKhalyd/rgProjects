import 'package:get/get.dart';

import '../getX/bottom_input_controller.dart';

class WhatsAppChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomInputController());
  }
}
