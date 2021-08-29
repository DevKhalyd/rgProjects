import 'package:get/get.dart';

import '../getX/bottom_inp_butn_controller.dart';

class WspChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomInputBtnController());
  }
}
