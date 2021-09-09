import 'package:get/get.dart';

import 'saver_controller.dart';

class SaverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaverController());
  }
}
