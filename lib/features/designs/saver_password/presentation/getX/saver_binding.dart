import 'package:get/get.dart';

import 'saver_controller.dart';
import 'saver_menu_controller.dart';

class SaverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaverController());
    Get.lazyPut(() => SaverMenuController());
  }
}
