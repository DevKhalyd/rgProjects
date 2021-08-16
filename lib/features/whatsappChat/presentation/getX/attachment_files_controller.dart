import 'package:get/get.dart';
import 'package:rg_projects/core/utils/timers.dart';

import 'bottom_input_controller.dart';

class AttachmentFilesController extends GetxController {
  static AttachmentFilesController get to => Get.find();

  // Values to controlle the menu
  final _initialHeight = 0.0;
  final _initialWidth = 120.0;
  final _initialRadius = 100.0;

  final double _finalWidth = BottomInputController.to.context.width;

  // NOTE: Check if is needed to use the context.width
  final _finalHeight = 300.0;
  final _finalRadius = 13.0;

  late double currentHeight;
  late double currentWidth;
  double currentRadius = 0.0;

  bool _showContent = false;

  bool get showContent => _showContent;

  bool get isOpenMenu => currentHeight == _finalHeight;

  AttachmentFilesController() {
    currentHeight = _initialHeight;
    currentWidth = _initialWidth;
  }

  /// Open the menu or close the menu
  onTapFilesAttached() {
    if (!isOpenMenu) {
      currentHeight = _finalHeight;
      currentWidth = _finalWidth;
      currentRadius = _finalRadius;
      Timers.execute(() {
        _showContent = true;
        update();
      }, milliseconds: 210);
    } else {
      currentHeight = _initialHeight;
      currentWidth = _initialWidth;
      currentRadius = _initialRadius;
      _showContent = false;
    }
    update();
  }

  /// Space needed to show the menu
  double getBottomSpace() => BottomInputController.to.getBottomSpace() + 50;

  /// Get the right distance to show the menu in order with the icon file
  double getRightDistance() {
    if (!isOpenMenu)
      return BottomInputController.to.context.width * 0.22;
    else
      return 0;
  }
}
